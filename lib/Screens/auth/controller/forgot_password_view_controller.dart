import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/auth/model/change_password_model.dart';
import 'package:md_health/Screens/auth/model/mobile_number_exits_model.dart';
import 'package:md_health/Screens/auth/repository/change_password_repository.dart';
import 'package:md_health/Screens/auth/repository/mobile_number_check_repo.dart';
import 'package:md_health/Screens/auth/view/forgot_password_otp_view.dart';
import 'package:md_health/Screens/auth/view/login_view.dart';
import 'package:md_health/firebase_options.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordViewController extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  MobileNumberRepo mobileNumberRepo = MobileNumberRepo();
  ChangePasswordRepository changePasswordRepository =
      ChangePasswordRepository();
  String verificationCode = '';
  bool isLoginBtnEnabled = false;

  Future<void> initState(context) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    notifyListeners();
  }

  void setVerificationCode(code) {
    verificationCode = code;
    notifyListeners();
  }

  void setMobileNumber(number) {
    mobileNumberController.text = number;
    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////

  Future<void> sendOtpToFirebase(String phoneNumber, context) async {
    if (mobileNumberController.text == '') {
      Utils.showPrimarySnackbar(context, 'Enter 10 Digits Mobile Number',
          type: SnackType.error);

      notifyListeners();
      return;
    }
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        print('verificationCompleted ${userCredential.user!.uid}');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('verificationFailed');
        Utils.showPrimarySnackbar(context, e.message, type: SnackType.error);
      },
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ForgotPasswordOtpView(verificationId: verificationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

////////////////////////////////////////////////////////////////////////////////

  NChangePasswordRequestModel get newChangePasswordRequestMode =>
      NChangePasswordRequestModel(
        mobileNumber: mobileNumberController.text,
        newPassword: passwordController.text,
        reNewPassword: repasswordController.text,
      );
  Future<void> updatePassword(context) async {
    if (passwordController.text.isEmpty || passwordController.text.length < 8) {
      Utils.showPrimarySnackbar(context, 'Enter 8 Digits Password',
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (repasswordController.text.isEmpty ||
        repasswordController.text.length < 8) {
      Utils.showPrimarySnackbar(context, 'Enter 8 Digits Password',
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (passwordController.text != repasswordController.text) {
      Utils.showPrimarySnackbar(
          context, "New Password and Re-New Password Not Mached  ",
          type: SnackType.error);
      return;
    }
    if (passwordController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, "Enter New Password",
          type: SnackType.error);
      return;
    }
    if (repasswordController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, "Enter Re-typeNew Password",
          type: SnackType.error);
      return;
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    changePasswordRepository
        .changePassword(newChangePasswordRequestMode, context)
        .then((response) {
      print(response.body);
      final result =
          NewChangePasswordResponseModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenView()),
        );
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);

        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  //////////////////////////////////////////////////////////////////
  MobileNumberRequestModel get mobileNumberRequestModel =>
      MobileNumberRequestModel(mobileNumber: mobileNumberController.text);

  Future<void> mobileNumberCheck(context) async {
    if (mobileNumberController.text.length == 10) {
      await mobileNumberRepo
          .mobileNumber(mobileNumberRequestModel, context)
          .then((response) {
        print(response.body);
        final result =
            MobileNumberResponseModel.fromJson(jsonDecode(response.body));
        if (response.statusCode == 200) {
          if (result.status == 404) {
            isLoginBtnEnabled = false;
            Utils.showPrimarySnackbar(context, result.message,
                type: SnackType.error);
          } else {
            isLoginBtnEnabled = true;

            Utils.showPrimarySnackbar(context, result.message,
                type: SnackType.success);
          }
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
      }).onError((error, stackTrace) {
        Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
      }).catchError(
        (Object e) {
          Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        },
        test: (Object e) {
          Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
          return false;
        },
      );
    }
  }
}
