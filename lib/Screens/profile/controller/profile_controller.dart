// // import 'dart:convert';
// // import 'dart:io';
// // import 'dart:developer';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
// // import 'package:md_health/Screens/home/view/home_view.dart';
// // import 'package:md_health/Screens/profile/model/get_profile_model.dart';
// // import 'package:md_health/Screens/profile/model/password_model.dart';
// // import 'package:md_health/Screens/profile/model/update_password_model.dart';
// // import 'package:md_health/Screens/profile/model/update_profile_model.dart';
// // import 'package:md_health/Screens/profile/repository/get_profile_repo.dart';
// // import 'package:md_health/Screens/profile/repository/passowrd_exist_repo.dart';
// // import 'package:md_health/Screens/profile/repository/password_update_repo.dart';
// // import 'package:md_health/Screens/profile/repository/update_profilre_repo.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:md_health/widget/loading_overlay.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:path/path.dart';
// // import 'package:async/async.dart';

// // class ProfileDetailController extends ChangeNotifier {
// //   TextEditingController firstNameController = TextEditingController();
// //   TextEditingController lastNameController = TextEditingController();
// //   TextEditingController phoneNumberController = TextEditingController();
// //   TextEditingController emailIdController = TextEditingController();
// //   TextEditingController addressController = TextEditingController();
// //   TextEditingController passwordContyroller = TextEditingController();
// //   TextEditingController newPasswordController = TextEditingController();
// //   TextEditingController re_TypePasswordContyroller = TextEditingController();
// //   final TextEditingController citySearchController = TextEditingController();
// //   final TextEditingController areaSearchController = TextEditingController();
// //   String selectedCountryId = "";
// //   String selectedCityId = "";
// //   String countryName = "";
// //   String cityName = "";

// //   AccountDetails? accountDetails;
// //   List<Country>? countries;
// //   List<City>? cities;

// //   GetProfileDetail registrationDataRepo = GetProfileDetail();
// //   PasswordExitRepo passwordRepo = PasswordExitRepo();

// //   UpdtaeProfileRepo getUpdateprofile = UpdtaeProfileRepo();
// //   bool isLoading = true;

// //   bool showValuePincodeField = false;
// //   bool showValueAreaField = false;
// //   bool showValueCityField = false;

// //   Future<void> initState(
// //     context,
// //   ) async {
// //     await getProfileDetails(context);
// //   }

// //   Future<void> onCitySelected(value) async {
// //     cityName = value;
// //     selectedCityId = cities
// //             ?.where((element) => element.cityName?.contains(value) ?? false)
// //             .toList()[0]
// //             .id
// //             .toString() ??
// //         "";
// //     notifyListeners();
// //   }

// //   Future<void> onAreaSelected(value) async {
// //     countryName = value.toString();
// //     selectedCountryId = countries
// //             ?.where((element) => element.countryName?.contains(value) ?? false)
// //             .toList()[0]
// //             .id
// //             .toString() ??
// //         "";
// //     notifyListeners();
// //   }

// //   CheckPasswordExitRequestModel get checkPasswordreqmodel =>
// //       CheckPasswordExitRequestModel(
// //         password: passwordContyroller.text,
// //       );
// //   Future<void> CheckPassword(context) async {
// //     // LoadingOverlay.of(context).show();
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     // getUpdateprofile
// //     passwordRepo
// //         .passwordExit(checkPasswordreqmodel, pref.getString("successToken"))
// //         .then((response) {
// //       print(response.body);
// //       final result =
// //           CheckPasswordExitRespModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.success);

// //         notifyListeners();
// //       } else {
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   GetProfileRequestModel get getprofileRequestModel => GetProfileRequestModel(
// //         phone: phoneNumberController.text,
// //         firstName: firstNameController.text,
// //         lastName: lastNameController.text,
// //         cityId: (selectedCityId),
// //         countryId: (selectedCountryId),
// //         address: addressController.text,
// //         email: emailIdController.text,
// //       );

// //   Future<void> UpdateProfile(context) async {
// //     // LoadingOverlay.of(context).show();
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     // getUpdateprofile
// //     getUpdateprofile
// //         .updateprofile(getprofileRequestModel, pref.getString("successToken"))
// //         .then((response) {
// //       print(response.body);
// //       final result =
// //           GetProfileResponseModel.fromJson(jsonDecode(response.body));

// //       if (response.statusCode == 200) {
// //         // LoadingOverlay.of(context).hide();
// //         // final read =
// //         //     Provider.of<NewMainScreenController>(context, listen: false);
// //         // read.onNavigation(
// //         //     0,
// //         //     const HomeView(
// //         //         // refresh: true,
// //         //         ),
// //         //     context);

// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.success);

// //         notifyListeners();
// //       } else {
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   Future<void> getProfileDetails(context) async {
// //     countryName = "";
// //     cityName = "";

// //     showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     print(pref.getString("successToken"));
// //     registrationDataRepo
// //         .getProfileData(pref.getString("successToken"))
// //         .then((response) {
// //       log(response.body);
// //       final result = GetProfileModel.fromJson(
// //         jsonDecode(response.body),
// //       );
// //       if (response.statusCode == 200) {
// //         if (result.status == 200) {
// //           accountDetails = result.accountDetails;
// //           countries = result.countries;
// //           cities = result.cities;

// //           firstNameController.text = accountDetails?.firstName ?? "";
// //           lastNameController.text = accountDetails?.lastName ?? "";
// //           phoneNumberController.text = accountDetails?.phone ?? "";
// //           emailIdController.text = accountDetails?.email ?? "";
// //           addressController.text = accountDetails?.address ?? "";
// //           selectedCountryId = accountDetails?.countryId ?? "";
// //           countryName = accountDetails?.countryName ?? "";
// //           cityName = accountDetails?.cityName ?? "";
// //           selectedCityId = accountDetails?.cityId ?? "";
// //           log("abcd${response.body}");

// //           print("object");
// //           print(addressController.text);
// //           print("object");
// //           //  .toString() ?? "";

// //           showLoader(false);
// //           Utils.showPrimarySnackbar(context, result.message,
// //               type: SnackType.success);
// //           notifyListeners();
// //         } else {
// //           Utils.showPrimarySnackbar(context, result.message,
// //               type: SnackType.error);
// //         }
// //       } else {
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   showLoader(value) {
// //     isLoading = value;
// //     notifyListeners();
// //   }

// //   PasswordUpdateRepo passwordupdateRepo = PasswordUpdateRepo();
// //   UpdatePasswordRequestmodel get updatepasswordRequestmodel =>
// //       UpdatePasswordRequestmodel(
// //         newPassword: newPasswordController.text,
// //         rTypePassword: re_TypePasswordContyroller.text,
// //       );

// //   Future<void> UpdatePassword(context) async {
// //     if (newPasswordController.text != re_TypePasswordContyroller.text) {
// //       Utils.showPrimarySnackbar(
// //           context, "New Password and Re-New Password Not Mached  ",
// //           type: SnackType.error);
// //       return;
// //     }
// //     if (newPasswordController.text.isEmpty) {
// //       Utils.showPrimarySnackbar(context, "enter New Password",
// //           type: SnackType.error);
// //       return;
// //     }
// //     if (re_TypePasswordContyroller.text.isEmpty) {
// //       Utils.showPrimarySnackbar(context, "enter Re-typeNew Password",
// //           type: SnackType.error);
// //       return;
// //     }
// //     // LoadingOverlay.of(context).show();
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     // getUpdateprofile
// //     passwordupdateRepo
// //         .passwordupdateRepo(
// //             updatepasswordRequestmodel, pref.getString("successToken"))
// //         .then((response) {
// //       print(response.body);
// //       final result = UpdatePasswordResmodel.fromJson(jsonDecode(response.body));

// //       if (response.statusCode == 200) {
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.success);

// //         notifyListeners();
// //       } else {
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }
// // }
// import 'dart:convert';
// import 'dart:io';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/auth/model/city_list_model.dart';
// import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
// import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';
// import 'package:md_health/Screens/profile/model/get_profile_model.dart';
// import 'package:md_health/Screens/profile/model/password_model.dart';
// import 'package:md_health/Screens/profile/model/update_password_model.dart';
// import 'package:md_health/Screens/profile/model/update_profile_model.dart';
// import 'package:md_health/Screens/profile/repository/get_profile_repo.dart';
// import 'package:md_health/Screens/profile/repository/passowrd_exist_repo.dart';
// import 'package:md_health/Screens/profile/repository/password_update_repo.dart';
// import 'package:md_health/Screens/profile/repository/update_profilre_repo.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/loading_overlay.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path/path.dart';
// import 'package:async/async.dart';

// class ProfileDetailController extends ChangeNotifier {
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController emailIdController = TextEditingController();
//   TextEditingController birthDateController = TextEditingController();
//   TextEditingController genderController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController passwordContyroller = TextEditingController();
//   TextEditingController newPasswordController = TextEditingController();
//   TextEditingController re_TypePasswordContyroller = TextEditingController();
//   final TextEditingController citySearchController = TextEditingController();
//   final TextEditingController areaSearchController = TextEditingController();
//   // String selectedCountryId = "";
//   // String selectedCityId = "";
//   String countryName = "";
//   String countryId = "";
//   String cityName = "";
//   String cityId = "";

//   AccountDetails? accountDetails;
//   List<Country>? countries;
//   // List<City>? cities;

//   GetProfileDetail registrationDataRepo = GetProfileDetail();
//   PasswordExitRepo passwordRepo = PasswordExitRepo();

//   UpdtaeProfileRepo getUpdateprofile = UpdtaeProfileRepo();
//   bool isLoading = true;
//   bool showValuePincodeField = false;
//   bool showValueAreaField = false;
//   bool showValueCityField = false;

//   Future<void> initState(
//     context,
//   ) async {
//     await getProfileDetails(context);
//   }

//   Future<void> onCitySelected(value) async {
//     cityName = value;
//     cityId = cityList
//             ?.where((element) => element.cityName?.contains(value) ?? false)
//             .toList()[0]
//             .id
//             .toString() ??
//         "";
//     notifyListeners();
//   }

//   Future<void> onAreaSelected(value, BuildContext context) async {
//     countryName = value.toString();
//     countryId = countries
//             ?.where((element) => element.countryName?.contains(value) ?? false)
//             .toList()[0]
//             .id
//             .toString() ??
//         "";
//     print('id');
//     print(countryId);
//     print(countryName);
//     print('id');
//     cityList = null;
//     cityName = '';
//     cityId = '';
//     await getCitiesList(context);
//     // notifyListeners();
//   }

//   CheckPasswordExitRequestModel get checkPasswordreqmodel =>
//       CheckPasswordExitRequestModel(
//         password: passwordContyroller.text,
//       );
//   Future<void> CheckPassword(context) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     passwordRepo
//         .passwordExit(checkPasswordreqmodel, pref.getString("successToken"))
//         .then((response) {
//       print(response.body);
//       final result =
//           CheckPasswordExitRespModel.fromJson(jsonDecode(response.body));
//       if (result.status == 200) {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);
//         notifyListeners();
//       } else {
//         if (result.status == 400) {
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.error);
//         } else {
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.error);
//         }
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   GetProfileRequestModel get getprofileRequestModel => GetProfileRequestModel(
//         birthDate: birthDateController.text,
//         gender: genderController.text,
//         phone: phoneNumberController.text,
//         firstName: firstNameController.text,
//         lastName: lastNameController.text,
//         cityId: (cityId),
//         countryId: (countryId),
//         address: addressController.text,
//         email: emailIdController.text,
//       );

//   Future<void> UpdateProfile(context) async {
//     if (firstNameController.text == '') {
//       Utils.showPrimarySnackbar(context, 'Please fill First Name',
//           type: SnackType.error);
//       notifyListeners();
//     }
//     if (lastNameController.text == '') {
//       Utils.showPrimarySnackbar(context, 'Please fill Last Name',
//           type: SnackType.error);
//       notifyListeners();
//     }
//     if (phoneNumberController.text == '') {
//       Utils.showPrimarySnackbar(context, 'Please fill Phone Number',
//           type: SnackType.error);
//       notifyListeners();
//     }

//     if (emailIdController.text == "") {
//       Utils.showPrimarySnackbar(context, "Please fill Email ID",
//           type: SnackType.error);
//       return;
//     }
//     bool email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
//         .hasMatch(emailIdController.text.trim());
//     print(email);
//     if (!email) {
//       Utils.showPrimarySnackbar(context, "Please fill Email ID",
//           type: SnackType.error);
//       return;
//     }

//     if (countryName == "") {
//       Utils.showPrimarySnackbar(context, 'Please select country',
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }
//     if (cityName == "") {
//       Utils.showPrimarySnackbar(context, 'Please select city',
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }

//     if (addressController.text == '') {
//       Utils.showPrimarySnackbar(context, 'Please fill Address',
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }

//     // LoadingOverlay.of(context).show();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // getUpdateprofile
//     getUpdateprofile
//         .updateprofile(getprofileRequestModel, pref.getString("successToken"))
//         .then((response) {
//       print(response.body);
//       final result =
//           GetProfileResponseModel.fromJson(jsonDecode(response.body));

//       if (response.statusCode == 200) {
//         Navigator.push(
//           context,
//           SlidePageRoute(
//             page: NewMainScreenView(
//                 // patientID: patientId.toString(),
//                 // id: purchesId.toString(),
//                 // packageId: packageId.toString(),
//                 ),
//             direction: SlideDirection.right, // Specify the slide direction here
//             delay: Duration(milliseconds: 5000),
//           ),
//         );
//         // getCitiesList(context)/
//         // LoadingOverlay.of(context).hide();
//         // final read =
//         //     Provider.of<NewMainScreenController>(context, listen: false);
//         // read.onNavigation(
//         //     0,
//         //     const HomeView(
//         //         // refresh: true,
//         //         ),
//         //     context);

//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);

//         notifyListeners();
//       } else {
//         // Utils.showPrimarySnackbar(context, result.message,
//         //     type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   Future<void> getProfileDetails(context) async {
//     countryName = "";
//     cityName = "";

//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     registrationDataRepo
//         .getProfileData(pref.getString("successToken"))
//         .then((response) {
//       log(response.body);
//       final result = GetProfileModel.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           accountDetails = result.accountDetails;
//           countries = result.countries;
//           // cities = result.cities;

//           firstNameController.text = accountDetails?.firstName ?? "";
//           lastNameController.text = accountDetails?.lastName ?? "";
//           phoneNumberController.text = accountDetails?.phone ?? "";
//           genderController.text = accountDetails?.gender ?? '';
//           birthDateController.text = accountDetails?.birthDate ?? '';
//           emailIdController.text = accountDetails?.email ?? "";
//           addressController.text = accountDetails?.address ?? "";
//           countryName = accountDetails?.countryId ?? "";
//           cityName = accountDetails?.cityId ?? "";
//           log("abcd${response.body}");

//           print("object");
//           print(addressController.text);
//           print("object");
//           //  .toString() ?? "";

//           showLoader(false);
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.success);
//           notifyListeners();
//         } else {
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.error);
//         }
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   // Future<void> getCitiesList(context) async {
//   //   LoadingOverlay.of(context).show();
//   //   SharedPreferences pref = await SharedPreferences.getInstance();
//   //   registrationDataRepo
//   //       .getProfileData(pref.getString("successToken"))
//   //       .then((response) {
//   //     final result = GetProfileModel.fromJson(jsonDecode(response.body));
//   //     if (response.statusCode == 200) {
//   //       cities = result.cities;
//   //       var contain =
//   //           cities?.where((element) => element.id.toString() == cityName);
//   //       if (contain?.isNotEmpty ?? false) {
//   //         showValueAreaField = true;
//   //       } else {
//   //         showValueAreaField = false;
//   //       }
//   //       if (result.cities!.isEmpty) {
//   //         Utils.showPrimarySnackbar(context, "No Area Found",
//   //             type: SnackType.error);
//   //       }
//   //       LoadingOverlay.of(context).hide();
//   //       notifyListeners();
//   //     } else {
//   //       Utils.showPrimarySnackbar(context, result.message,
//   //           type: SnackType.error);
//   //     }
//   //   }).onError((error, stackTrace) {
//   //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//   //   }).catchError(
//   //     (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //     },
//   //     test: (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //       return false;
//   //     },
//   //   );
//   // }

//   CityListRequestModel get requestModel =>
//       CityListRequestModel(countryId: countryId.toString());
//   CityListRepository cityListRepo = CityListRepository();
//   List<CityListData>? cityList;

//   Future<void> getCitiesList(BuildContext context) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();

//     cityListRepo
//         .getCityList(requestModel, pref.getString("successToken"))
//         .then((response) {
//       final result = CityListResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           cityList = result.cityList;
//           debugPrint(cityList?[1].toString());
//           notifyListeners();
//         } else {
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.error);
//         }
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       // test: (Object e) {
//       //   Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       //   return false;
//       // },
//     );
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   PasswordUpdateRepo passwordupdateRepo = PasswordUpdateRepo();
//   UpdatePasswordRequestmodel get updatepasswordRequestmodel =>
//       UpdatePasswordRequestmodel(
//         newPassword: newPasswordController.text,
//         rTypePassword: re_TypePasswordContyroller.text,
//       );

//   Future<void> UpdatePassword(context) async {
//     if (newPasswordController.text != re_TypePasswordContyroller.text) {
//       Utils.showPrimarySnackbar(context, "Enter---- Correct Password",
//           type: SnackType.error);
//       return;
//     }
//     if (newPasswordController.text.isEmpty) {
//       Utils.showPrimarySnackbar(context, "Enter New Password",
//           type: SnackType.error);
//       return;
//     }
//     if (re_TypePasswordContyroller.text.isEmpty) {
//       Utils.showPrimarySnackbar(context, "Enter Re-typeNew Password",
//           type: SnackType.error);
//       return;
//     }
//     // LoadingOverlay.of(context).show();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // getUpdateprofile
//     passwordupdateRepo
//         .passwordupdateRepo(
//             updatepasswordRequestmodel, pref.getString("successToken"))
//         .then((response) {
//       print(response.body);
//       final result = UpdatePasswordResmodel.fromJson(jsonDecode(response.body));

//       if (response.statusCode == 200) {
//         // CheckPassword(context);
//         Navigator.push(
//           context,
//           SlidePageRoute(
//             page: NewMainScreenView(
//                 // patientID: patientId.toString(),
//                 // id: purchesId.toString(),
//                 // packageId: packageId.toString(),
//                 ),
//             direction: SlideDirection.right, // Specify the slide direction here
//             delay: Duration(milliseconds: 5000),
//           ),
//         );
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);

//         notifyListeners();
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }
// }
// import 'dart:convert';
// import 'dart:io';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';
// import 'package:md_health/Screens/profile/model/get_profile_model.dart';
// import 'package:md_health/Screens/profile/model/password_model.dart';
// import 'package:md_health/Screens/profile/model/update_password_model.dart';
// import 'package:md_health/Screens/profile/model/update_profile_model.dart';
// import 'package:md_health/Screens/profile/repository/get_profile_repo.dart';
// import 'package:md_health/Screens/profile/repository/passowrd_exist_repo.dart';
// import 'package:md_health/Screens/profile/repository/password_update_repo.dart';
// import 'package:md_health/Screens/profile/repository/update_profilre_repo.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/loading_overlay.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path/path.dart';
// import 'package:async/async.dart';

// class ProfileDetailController extends ChangeNotifier {
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController emailIdController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController passwordContyroller = TextEditingController();
//   TextEditingController newPasswordController = TextEditingController();
//   TextEditingController re_TypePasswordContyroller = TextEditingController();
//   final TextEditingController citySearchController = TextEditingController();
//   final TextEditingController areaSearchController = TextEditingController();
//   String selectedCountryId = "";
//   String selectedCityId = "";
//   String countryName = "";
//   String cityName = "";

//   AccountDetails? accountDetails;
//   List<Country>? countries;
//   List<City>? cities;

//   GetProfileDetail registrationDataRepo = GetProfileDetail();
//   PasswordExitRepo passwordRepo = PasswordExitRepo();

//   UpdtaeProfileRepo getUpdateprofile = UpdtaeProfileRepo();
//   bool isLoading = true;

//   bool showValuePincodeField = false;
//   bool showValueAreaField = false;
//   bool showValueCityField = false;

//   Future<void> initState(
//     context,
//   ) async {
//     await getProfileDetails(context);
//   }

//   Future<void> onCitySelected(value) async {
//     cityName = value;
//     selectedCityId = cities
//             ?.where((element) => element.cityName?.contains(value) ?? false)
//             .toList()[0]
//             .id
//             .toString() ??
//         "";
//     notifyListeners();
//   }

//   Future<void> onAreaSelected(value) async {
//     countryName = value.toString();
//     selectedCountryId = countries
//             ?.where((element) => element.countryName?.contains(value) ?? false)
//             .toList()[0]
//             .id
//             .toString() ??
//         "";
//     notifyListeners();
//   }

//   CheckPasswordExitRequestModel get checkPasswordreqmodel =>
//       CheckPasswordExitRequestModel(
//         password: passwordContyroller.text,
//       );
//   Future<void> CheckPassword(context) async {
//     // LoadingOverlay.of(context).show();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // getUpdateprofile
//     passwordRepo
//         .passwordExit(checkPasswordreqmodel, pref.getString("successToken"))
//         .then((response) {
//       print(response.body);
//       final result =
//           CheckPasswordExitRespModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);

//         notifyListeners();
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   GetProfileRequestModel get getprofileRequestModel => GetProfileRequestModel(
//         phone: phoneNumberController.text,
//         firstName: firstNameController.text,
//         lastName: lastNameController.text,
//         cityId: (selectedCityId),
//         countryId: (selectedCountryId),
//         address: addressController.text,
//         email: emailIdController.text,
//       );

//   Future<void> UpdateProfile(context) async {
//     // LoadingOverlay.of(context).show();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // getUpdateprofile
//     getUpdateprofile
//         .updateprofile(getprofileRequestModel, pref.getString("successToken"))
//         .then((response) {
//       print(response.body);
//       final result =
//           GetProfileResponseModel.fromJson(jsonDecode(response.body));

//       if (response.statusCode == 200) {
//         // LoadingOverlay.of(context).hide();
//         // final read =
//         //     Provider.of<NewMainScreenController>(context, listen: false);
//         // read.onNavigation(
//         //     0,
//         //     const HomeView(
//         //         // refresh: true,
//         //         ),
//         //     context);

//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);

//         notifyListeners();
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   Future<void> getProfileDetails(context) async {
//     countryName = "";
//     cityName = "";

//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     registrationDataRepo
//         .getProfileData(pref.getString("successToken"))
//         .then((response) {
//       log(response.body);
//       final result = GetProfileModel.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           accountDetails = result.accountDetails;
//           countries = result.countries;
//           cities = result.cities;

//           firstNameController.text = accountDetails?.firstName ?? "";
//           lastNameController.text = accountDetails?.lastName ?? "";
//           phoneNumberController.text = accountDetails?.phone ?? "";
//           emailIdController.text = accountDetails?.email ?? "";
//           addressController.text = accountDetails?.address ?? "";
//           selectedCountryId = accountDetails?.countryId ?? "";
//           countryName = accountDetails?.countryName ?? "";
//           cityName = accountDetails?.cityName ?? "";
//           selectedCityId = accountDetails?.cityId ?? "";
//           log("abcd${response.body}");

//           print("object");
//           print(addressController.text);
//           print("object");
//           //  .toString() ?? "";

//           showLoader(false);
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.success);
//           notifyListeners();
//         } else {
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.error);
//         }
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   PasswordUpdateRepo passwordupdateRepo = PasswordUpdateRepo();
//   UpdatePasswordRequestmodel get updatepasswordRequestmodel =>
//       UpdatePasswordRequestmodel(
//         newPassword: newPasswordController.text,
//         rTypePassword: re_TypePasswordContyroller.text,
//       );

//   Future<void> UpdatePassword(context) async {
//     if (newPasswordController.text != re_TypePasswordContyroller.text) {
//       Utils.showPrimarySnackbar(
//           context, "New Password and Re-New Password Not Mached  ",
//           type: SnackType.error);
//       return;
//     }
//     if (newPasswordController.text.isEmpty) {
//       Utils.showPrimarySnackbar(context, "enter New Password",
//           type: SnackType.error);
//       return;
//     }
//     if (re_TypePasswordContyroller.text.isEmpty) {
//       Utils.showPrimarySnackbar(context, "enter Re-typeNew Password",
//           type: SnackType.error);
//       return;
//     }
//     // LoadingOverlay.of(context).show();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // getUpdateprofile
//     passwordupdateRepo
//         .passwordupdateRepo(
//             updatepasswordRequestmodel, pref.getString("successToken"))
//         .then((response) {
//       print(response.body);
//       final result = UpdatePasswordResmodel.fromJson(jsonDecode(response.body));

//       if (response.statusCode == 200) {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);

//         notifyListeners();
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/health/home/view/home_view.dart';
import 'package:md_health/Screens/profile/model/get_profile_model.dart';
import 'package:md_health/Screens/profile/model/password_model.dart';
import 'package:md_health/Screens/profile/model/update_password_model.dart';
import 'package:md_health/Screens/profile/model/update_profile_model.dart';
import 'package:md_health/Screens/profile/repository/get_profile_repo.dart';
import 'package:md_health/Screens/profile/repository/passowrd_exist_repo.dart';
import 'package:md_health/Screens/profile/repository/password_update_repo.dart';
import 'package:md_health/Screens/profile/repository/update_profilre_repo.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:md_health/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

class ProfileDetailController extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordContyroller = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController re_TypePasswordContyroller = TextEditingController();
  final TextEditingController citySearchController = TextEditingController();
  final TextEditingController areaSearchController = TextEditingController();
  // String selectedCountryId = "";
  // String selectedCityId = "";
  String countryName = "";
  String countryId = "";
  String cityName = "";
  String cityId = "";

  AccountDetails? accountDetails;
  List<Country>? countries;
  // List<City>? cities;

  GetProfileDetail registrationDataRepo = GetProfileDetail();
  PasswordExitRepo passwordRepo = PasswordExitRepo();

  UpdtaeProfileRepo getUpdateprofile = UpdtaeProfileRepo();
  bool isLoading = true;
  bool showValuePincodeField = false;
  bool showValueAreaField = false;
  bool showValueCityField = false;

  Future<void> initState(
    context,
  ) async {
    countryListId = 0;
    await getProfileDetails(context);
  }

  Future<void> onCitySelected(value) async {
    cityName = value;
    cityId = cityList
            ?.where((element) => element.cityName?.contains(value) ?? false)
            .toList()[0]
            .id
            .toString() ??
        "";
    notifyListeners();
  }

  Future<void> onAreaSelected(value, BuildContext context) async {
    countryName = value.toString();
    countryId = countries
            ?.where((element) => element.countryName?.contains(value) ?? false)
            .toList()[0]
            .id
            .toString() ??
        "";
    print('id');
    print(countryId);
    print(countryName);
    print('id');
    cityList = null;
    cityName = '';
    cityId = '';
    await getCitiesList(context);
    notifyListeners();
  }

  CheckPasswordExitRequestModel get checkPasswordreqmodel =>
      CheckPasswordExitRequestModel(
        password: passwordContyroller.text,
      );
  Future<void> CheckPassword(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    passwordRepo
        .passwordExit(checkPasswordreqmodel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      final result =
          CheckPasswordExitRespModel.fromJson(jsonDecode(response.body));
      if (result.status == 200) {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
        notifyListeners();
      } else {
        if (result.status == 400) {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
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

  int countryListId = 0;

  Future<void> onSelectCountryType(int value) async {
    countryListId = value;
    cityList = null;
    cityName = '';
    cityId = '';
    print(countryListId);
    notifyListeners();
  }

  int? selectedCityId;
  int? cityListId;
  Future<void> onSelectCityType(int value) async {
    selectedCityId = value;
    print("controller" + selectedCityId.toString());
    notifyListeners();
  }

  GetProfileRequestModel get getprofileRequestModel => GetProfileRequestModel(
        birthDate: birthDateController.text,
        gender: genderController.text,
        phone: phoneNumberController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        cityId: selectedCityId.toString(),
        countryId: (countryListId.toString()),
        address: addressController.text,
        email: emailIdController.text,
      );

  Future<void> UpdateProfile(context) async {
    if (firstNameController.text == '') {
      Utils.showPrimarySnackbar(context, 'Please fill First Name',
          type: SnackType.error);
      notifyListeners();
    }
    if (lastNameController.text == '') {
      Utils.showPrimarySnackbar(context, 'Please fill Last Name',
          type: SnackType.error);
      notifyListeners();
    }
    if (phoneNumberController.text == '') {
      Utils.showPrimarySnackbar(context, 'Please fill Phone Number',
          type: SnackType.error);
      notifyListeners();
    }

    if (emailIdController.text == "") {
      Utils.showPrimarySnackbar(context, "Please fill Email ID",
          type: SnackType.error);
      return;
    }
    bool email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(emailIdController.text.trim());
    print(email);
    if (!email) {
      Utils.showPrimarySnackbar(context, "Please fill Email ID",
          type: SnackType.error);
      return;
    }

    if (countryListId == "") {
      Utils.showPrimarySnackbar(context, 'Please select country',
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (selectedCityId == "") {
      Utils.showPrimarySnackbar(context, 'Please select city',
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (addressController.text == '') {
      Utils.showPrimarySnackbar(context, 'Please fill Address',
          type: SnackType.error);
      notifyListeners();
      return;
    }

    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    // getUpdateprofile
    getUpdateprofile
        .updateprofile(getprofileRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      final result =
          GetProfileResponseModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        LoadingOverlay.of(context).hide();
        Navigator.push(
          context,
          SlidePageRoute(
            page: NewMainScreenView(
                // patientID: patientId.toString(),
                // id: purchesId.toString(),
                // packageId: packageId.toString(),
                ),
            direction: SlideDirection.right, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );
        // getCitiesList(context)/
        // LoadingOverlay.of(context).hide();
        // final read =
        //     Provider.of<NewMainScreenController>(context, listen: false);
        // read.onNavigation(
        //     0,
        //     const HomeView(
        //         // refresh: true,
        //         ),
        //     context);

        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);

        notifyListeners();
      } else {
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  Future<void> getProfileDetails(context) async {
    countryName = "";
    cityName = "";

    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    registrationDataRepo
        .getProfileData(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = GetProfileModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          accountDetails = result.accountDetails;
          countries = result.countries;
          // cities = result.cities;

          firstNameController.text = accountDetails?.firstName ?? "";
          lastNameController.text = accountDetails?.lastName ?? "";
          phoneNumberController.text = accountDetails?.phone ?? "";
          genderController.text =
              (accountDetails?.gender?[0].toUpperCase() ?? '') +
                  (accountDetails?.gender?.substring(1).toLowerCase() ?? '');

          birthDateController.text = accountDetails?.birthDate ?? '';
          emailIdController.text = accountDetails?.email ?? "";
          addressController.text = accountDetails?.address ?? "";
          countryName = accountDetails?.countryId ?? "";
          cityName = accountDetails?.cityId ?? "";
          log("abcd${response.body}");

          print("object");
          print(addressController.text);
          print("object");
          //  .toString() ?? "";

          showLoader(false);
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.success);
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

  // Future<void> getCitiesList(context) async {
  //   LoadingOverlay.of(context).show();
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   registrationDataRepo
  //       .getProfileData(pref.getString("successToken"))
  //       .then((response) {
  //     final result = GetProfileModel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       cities = result.cities;
  //       var contain =
  //           cities?.where((element) => element.id.toString() == cityName);
  //       if (contain?.isNotEmpty ?? false) {
  //         showValueAreaField = true;
  //       } else {
  //         showValueAreaField = false;
  //       }
  //       if (result.cities!.isEmpty) {
  //         Utils.showPrimarySnackbar(context, "No Area Found",
  //             type: SnackType.error);
  //       }
  //       LoadingOverlay.of(context).hide();
  //       notifyListeners();
  //     } else {
  //       Utils.showPrimarySnackbar(context, result.message,
  //           type: SnackType.error);
  //     }
  //   }).onError((error, stackTrace) {
  //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
  //   }).catchError(
  //     (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //     },
  //     test: (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //       return false;
  //     },
  //   );
  // }

  CityListRequestModel get requestModel =>
      CityListRequestModel(countryId: countryListId.toString());
  CityListRepository cityListRepo = CityListRepository();
  List<CityListData>? cityList;

  Future<void> getCitiesList(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    cityListRepo
        .getCityList(requestModel, pref.getString("successToken"))
        .then((response) {
      final result = CityListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          cityList = result.cityList;
          debugPrint(cityList?[1].toString());
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, result.message,
          //     type: SnackType.error);
        }
      } else {
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      // test: (Object e) {
      //   Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      //   return false;
      // },
    );
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  PasswordUpdateRepo passwordupdateRepo = PasswordUpdateRepo();
  UpdatePasswordRequestmodel get updatepasswordRequestmodel =>
      UpdatePasswordRequestmodel(
        newPassword: newPasswordController.text,
        rTypePassword: re_TypePasswordContyroller.text,
      );

  Future<void> UpdatePassword(context) async {
    if (newPasswordController.text != re_TypePasswordContyroller.text) {
      Utils.showPrimarySnackbar(context, "Enter---- Correct Password",
          type: SnackType.error);
      return;
    }
    if (newPasswordController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, "Enter New Password",
          type: SnackType.error);
      return;
    }
    if (re_TypePasswordContyroller.text.isEmpty) {
      Utils.showPrimarySnackbar(context, "Enter Re-typeNew Password",
          type: SnackType.error);
      return;
    }
    // LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    // getUpdateprofile
    passwordupdateRepo
        .passwordupdateRepo(
            updatepasswordRequestmodel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      final result = UpdatePasswordResmodel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        // CheckPassword(context);
        Navigator.push(
          context,
          SlidePageRoute(
            page: NewMainScreenView(
                // patientID: patientId.toString(),
                // id: purchesId.toString(),
                // packageId: packageId.toString(),
                ),
            direction: SlideDirection.right, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
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
}
