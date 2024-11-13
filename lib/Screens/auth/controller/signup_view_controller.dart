import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/model/country_list_model.dart';
import 'package:md_health/Screens/auth/model/guest_login_model.dart';
import 'package:md_health/Screens/auth/model/signup_response_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
import 'package:md_health/Screens/auth/repository/guest_login_repo.dart';
import 'package:md_health/Screens/auth/repository/signup_repository.dart';
import 'package:md_health/Screens/auth/view/otp_view.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/firebase_options.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupViewController extends ChangeNotifier {
  List<CountryList>? countryList;
  List<CityListData>? cityList;
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode mobFocusNode = FocusNode();
  FocusNode emailIdFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode repasswordFocusNode = FocusNode();
  FocusNode addresFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  SignupRepository registrationRepo = SignupRepository();
  CountryListRepository countryListRepo = CountryListRepository();
  CityListRepository cityListRepo = CityListRepository();
  CustomerGuestLoginInRepo customerGuestLoginInRepo =
      CustomerGuestLoginInRepo();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController countryIdController = TextEditingController();
  TextEditingController cityIdController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  int countryListId = 0;
  bool isChecked = false;
  bool isCheckedTwo = false;
  bool isCheckedThree = false;
  bool isCheckedFour = false;
  bool isCheckedFive = false;
  bool isCheckedSix = false;
  bool isCheckedSeven = false;
  bool isCheckedEight = false;
  bool isCheckedOne = false;
  String? selectedGender;
  String verificationCode = '';
  String? platfromType;
  bool? isSignupSuccessfull;
  int? cursorPosition;
  int? selectedCityId;
  int? cityListId;
  // String selectedCountryCode = 'IN'; // Default country code

  void getPlatform() {
    if (Platform.isIOS) {
      platfromType = 'ios';
    } else if (Platform.isAndroid) {
      platfromType = 'android';
    } else {
      platfromType = 'android';
    }
  }

  Future<void> initState(context) async {
    addressController.clear();
    cityIdController.clear();
    firstNameController.clear();
    lastNameController.clear();
    mobController.clear();
    passwordController.clear();
    repasswordController.clear();
    emailIdController.clear();
    mobController.clear();
    genderController.clear();
    birthDateController.clear();
    countryListId = 0;
    cityList = null;
    countryList = null;

    getCountry(context);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    firstNameFocusNode.requestFocus();

    notifyListeners();
  }

  void onFirstNameEditingComplete() {
    firstNameFocusNode.unfocus();
    lastNameFocusNode.requestFocus();
  }

  void onDateSelected(date) {
    birthDateController.text = date;
    notifyListeners();
  }

  void onLastNameEditingComplete() {
    lastNameFocusNode.unfocus();
    mobFocusNode.requestFocus();
  }

  void onMobEditingComplete() {
    mobFocusNode.unfocus();
    emailIdFocusNode.requestFocus();
  }

  void onEmailIdEditingComplete() {
    emailIdFocusNode.unfocus();
    passwordFocusNode.requestFocus();
  }

  void onPasswordEditingComplete() {
    passwordFocusNode.unfocus();
    repasswordFocusNode.requestFocus();
  }

  void onAddressEditingCompleted() {
    addresFocusNode.unfocus();
  }

  void onRepasswordEditingComplete() {
    repasswordFocusNode.unfocus();
    genderFocusNode.requestFocus();
  }

  void setVerificationCode(value) {
    verificationCode = value;
    notifyListeners();
  }

  Future<void> onSelectGender(value) async {
    selectedGender = value;
    print(selectedGender);
    notifyListeners();
  }

  Future<void> onSelectCountryType(int value) async {
    countryListId = value;
    cityList = null;
    print(countryListId);
    notifyListeners();
  }

  Future<void> onSelectCityType(int value) async {
    selectedCityId = value;
    print("controller" + selectedCityId.toString());
    notifyListeners();
  }

  void onChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }

  String selectedCountryCode = '+91'; // Default country code

  Future<void> sendOtpToFirebase(
      String phoneNumber, String countryCode, context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      // phoneNumber: '+91$phoneNumber',
      phoneNumber: '$countryCode$phoneNumber', // Use the dynamic country code

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
                    SignUpOtpView(verificationId: verificationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

//////////////////////NewRegistration/////////////////////////////////////////
  Future<void> NewRegistration(context) async {
    getPlatform();
    RegistrationRequestModel registrationRequestModel =
        RegistrationRequestModel(
      birthDate: birthDateController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      mobileNo: mobController.text,
      email: emailIdController.text,
      password: passwordController.text,
      countryId: countryListId.toString(),
      cityId: selectedCityId.toString(),
      gender: selectedGender,
      platformType: platfromType,
      address: addressController.text,
      postalCode:
          '987654', // remove postal code from here if removed from website registration
    );
    print("object");

    // if (registrationRequestModel.email == "") {
    //   Utils.showPrimarySnackbar(context, "Enter Email ID",
    //       type: SnackType.error);
    //   return;
    // }
    bool email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(emailIdController.text.trim());
    print(email);
    if (!email) {
      Utils.showPrimarySnackbar(context, "Enter Valid Email ID",
          type: SnackType.error);
      return;
    }

    if (passwordController.text.isEmpty || passwordController.text.length < 8) {
      Utils.showPrimarySnackbar(context, 'Enter 8 Digits Password',
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (repasswordController.text == '') {
      Utils.showPrimarySnackbar(context, 'Enter Re-Password',
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (registrationRequestModel.password != repasswordController.text) {
      Utils.showPrimarySnackbar(
          context, ' Password and Re-Password are not match',
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (countryListId == null) {
      Utils.showPrimarySnackbar(context, 'Select Country',
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (selectedCityId == null) {
      Utils.showPrimarySnackbar(context, 'Select City', type: SnackType.error);
      notifyListeners();
      return;
    }

    if (!isChecked) {
      Utils.showPrimarySnackbar(context, "Please agree our terms and condition",
          type: SnackType.error);
      notifyListeners();
      return;
    }

    SharedPreferences pref = await SharedPreferences.getInstance();
    registrationRepo
        .registration(registrationRequestModel, context)
        .then((response) {
      print(response.body);
      final result =
          RegistrationResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (result.status == 200) {
        print(response.body);
        pref.setString(
            "successToken", result.registrationdata?.accessToken ?? "");
        print(pref.getString("successToken"));

        // sendOtpToFirebase(registrationRequestModel.mobileNo!, context);

        pref.setString("userPassword", registrationRequestModel.password!);
        notifyListeners();
        isSignupSuccessfull = true;
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

  Future<void> getCountry(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    countryListRepo.getCountries(context).then((response) {
      print(response.body);
      final result = CountryListModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        countryList = result.countryList;
        print(countryList);
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

  CityListRequestModel get requestModel =>
      CityListRequestModel(countryId: countryListId.toString());

  Future<void> getCities(context) async {
    cityListRepo.getCityList(requestModel, context).then((response) {
      final result = CityListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          cityList = result.cityList;
          debugPrint(cityList?[1].toString());
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
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

  GuestLoginRequest get guestLoginRequest => GuestLoginRequest(name: "guest");

  Future<void> guestLogin(context) async {
    // LoadingOverlay.of(context).show();
    await customerGuestLoginInRepo
        .customerGuestLoginIn(guestLoginRequest)
        .then((response) async {
      print(response.body);
      final result = GuestLoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("successToken", result.successToken?.token ?? "");
        pref.setString("status", "guestLoggedIn");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewMainScreenView()),
        );
        // LoadingOverlay.of(context).hide();
        notifyListeners();
      } else {
        // LoadingOverlay.of(context).hide();
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // LoadingOverlay.of(context).hide();
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // LoadingOverlay.of(context).hide();
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        // LoadingOverlay.of(context).hide();
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }
  ////////////////////////////////////

  launchTermsAndConditionURL() async {
    final Uri url = Uri.parse(
        'https://projects.m-staging.in/md-health-testing/terms-and-conditions');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  launchPrivacyPolicyURL() async {
    final Uri url = Uri.parse(
        'https://projects.m-staging.in/md-health-testing/user-data-consent');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
