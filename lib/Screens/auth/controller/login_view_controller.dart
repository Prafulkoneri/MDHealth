import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/auth/model/login_model.dart';
import 'package:md_health/Screens/auth/repository/login_repository.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/firebase_options.dart';
import 'package:md_health/main.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewController extends ChangeNotifier {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobController = TextEditingController();
  String verificationCode = '';
  String? platfromType;
  String? mobileNumber;

  Future<void> initState(context) async {
    mobileNumber = "";
    mobController.clear();
    passwordController.clear();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    notifyListeners();
  }

  void getPlatform() {
    if (Platform.isIOS) {
      platfromType = 'ios';
    } else if (Platform.isAndroid) {
      platfromType = 'android';
    } else {
      platfromType = 'android';
    }
  }

  void setMobileNumber(number) {
    mobileNumber = number;
    notifyListeners();
  }

  void setVerificationCode(String code) {
    verificationCode = code;
    notifyListeners();
  }

  Future<void> userLogin(context) async {
    getPlatform();
    var pref = await SharedPreferences.getInstance();
    LoginRequestModel requestModel = LoginRequestModel(
        fcmToken: fcmToken,
        password: passwordController.text,
        // phone: "+91${mobileNumber}",
        phone: mobileNumber,
        platformType: platfromType);

    if (requestModel.phone == '') {
      Utils.showPrimarySnackbar(context, 'Mobile Number is empty',
          type: SnackType.error);

      notifyListeners();
      return;
    }
    if (requestModel.password == '' || passwordController.text.length < 8) {
      Utils.showPrimarySnackbar(context, 'Enter atleast 8 Digits Password',
          type: SnackType.error);

      notifyListeners();
      return;
    }

    try {
      LoginRepository.loginUser(requestModel, context).then((response) {
        LoginResponseModel responseModel =
            LoginResponseModel.fromJson(jsonDecode(response.body));
        if (response.statusCode == 200) {
          if (responseModel.status == 200) {
            pref.setString(
                'successToken', responseModel.successToken?.token ?? '');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NewMainScreenView()),
            );

            Utils.showPrimarySnackbar(context, responseModel.message,
                type: SnackType.success);
          } else {
            Utils.showPrimarySnackbar(context, responseModel.message,
                type: SnackType.error);
          }
        } else {
          Utils.showPrimarySnackbar(context, responseModel.message,
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
    } catch (e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      throw Exception(e);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////
