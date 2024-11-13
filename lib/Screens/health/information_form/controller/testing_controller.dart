// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/auth/model/city_list_model.dart';
// import 'package:md_health/Screens/auth/model/country_list_model.dart';
// import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
// import 'package:md_health/Screens/home/repository/city_list_repository.dart';
// import 'package:md_health/Screens/information_form/model/information_model.dart';
// import 'package:md_health/Screens/information_form/repository/information_repo.dart';
// import 'package:md_health/Screens/payment_details/view/payment_details_view.dart';
// import 'package:md_health/Screens/profile/model/get_profile_model.dart';
// import 'package:md_health/Screens/profile/repository/get_profile_repo.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/loading_overlay.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class InformationFormController extends ChangeNotifier {
//   TextEditingController patientFullNameController = TextEditingController();
//   TextEditingController patientLastNameController = TextEditingController();
//   TextEditingController patientRelationController = TextEditingController();
//   TextEditingController patientNumberController = TextEditingController();
//   TextEditingController patientEmailController = TextEditingController();
//   TextEditingController BirthDateController = TextEditingController();
//   final TextEditingController citySearchController = TextEditingController();
//   final TextEditingController areaSearchController = TextEditingController();
//   // final TextEditingController planToStartController = TextEditingController();

//   String? packageId;
//   Id? idpatientId;

//   void onToDateSelected(date) {
//     BirthDateController.text = date;
//     notifyListeners();
//   }

//   bool isLoading = true;

//   InformationRepository informationRepository = InformationRepository();
//   GetProfileDetail registrationDataRepo = GetProfileDetail();
//   Future<void> initState(context, packageId) async {
//     patientFullNameController.clear();
//     patientLastNameController.clear();
//     patientRelationController.clear();
//     patientNumberController.clear();
//     patientEmailController.clear();
//     BirthDateController.clear();
//     citySearchController.clear();
//     areaSearchController.clear();
//     this.packageId = packageId;
//     getCountry(context);
//     notifyListeners();
//   }

//   ////////////////////////////////////////////////////////////////////////
//   CountryListRepository countryListRepo = CountryListRepository();
//   CityListRepository cityListRepo = CityListRepository();

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   void onDateSelected(date) {
//     BirthDateController.text = date;
//     notifyListeners();
//   }

//   ////////////////////////////////////////////
//   List<CountryList>? countryList;
//   // int? countryListId;
//   int? selectedCountryId;
//   int? selectedCityId;
//   Future<void> onSelectCountryType(int value) async {
//     selectedCountryId = value;
//     print(selectedCountryId);
//     notifyListeners();
//   }

//   Future<void> getCountry(context) async {
//     // LoadingOverlay.of(context).show();

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     countryListRepo.getCountries(context).then((response) {
//       print(response.body);
//       final result = CountryListModel.fromJson(jsonDecode(response.body));
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         print(response.body);
//         countryList = result.countryList;
//         print(countryList);
//         // LoadingOverlay.of(context).hide();
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

// ////////////////////////////////////
//   List<CityListData>? cityList;
//   int? cityListId;

//   Future<void> onSelectCityType(int value) async {
//     selectedCityId = value;
//     print("controller" + selectedCityId.toString());
//     notifyListeners();
//   }

//   CityListRequestModel get requestModel =>
//       CityListRequestModel(countryId: selectedCountryId.toString());

//   // Future<void> getCities(context) async {
//   //   cityListRepo.getCityList(requestModel, context).then((response) {
//   //     final result = CityListResponseModel.fromJson(jsonDecode(response.body));
//   //     if (response.statusCode == 200) {
//   //       if (result.status == 200) {
//   //         cityList = result.cityList;
//   //         debugPrint(cityList?[1].toString());
//   //         notifyListeners();
//   //       } else {
//   //         Utils.showPrimarySnackbar(context, result.message,
//   //             type: SnackType.error);
//   //       }
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

//   String? cityListErrorMessage;

//   Future<void> getCities(context) async {
//     cityListRepo.getCityList(requestModel, context).then((response) {
//       final result = CityListResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           cityList = result.cityList;
//           if (cityList == null || cityList!.isEmpty) {
//             cityListErrorMessage = "No city found";
//           } else {
//             cityListErrorMessage = null;
//           }
//           debugPrint(cityList?.toString());
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

// ///////////////////////////////////////////
//   InformationRequestModel get informationRequestModel =>
//       InformationRequestModel(
//         patientLastName: patientLastNameController.text,
//         packageId: packageId.toString(),
//         platFormType: "android",
//         patientRelation: patientRelationController.text,
//         birthDate: BirthDateController.text,
//         patientFullName: patientFullNameController.text,
//         patientEmail: patientEmailController.text,
//         patientCityId: (selectedCityId.toString()),
//         patientCountryId: (selectedCountryId.toString()),
//         packageBuyFor: "Other",
//         patientContactNumber: patientNumberController.text,
//       );
//   Future<void> getInfotmationDetails(
//     context,
//   ) async {
//     if (patientFullNameController.text == "") {
//       Utils.showPrimarySnackbar(context, "Please Fill Patient First Name",
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }
//     if (patientLastNameController.text == "") {
//       Utils.showPrimarySnackbar(context, "Please Fill Patient Last Name",
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }

//     if (patientRelationController.text == "") {
//       Utils.showPrimarySnackbar(context, "Please Fill Relationship Detail",
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }
//     // if (patientEmailController.text.isEmpty) {
//     //   Utils.showPrimarySnackbar(context, "Enter Email ID",
//     //       type: SnackType.error);
//     //   return;
//     // }
//     // bool email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
//     //     .hasMatch(patientEmailController.text.trim());
//     // print(email);
//     // if (!email) {
//     //   Utils.showPrimarySnackbar(context, "Enter Valid Email ID",
//     //       type: SnackType.error);
//     //   return;
//     // }
//     if (patientNumberController.text == "" ||
//         patientNumberController.text.length < 10) {
//       Utils.showPrimarySnackbar(
//           context, "Please Fill  10 Digits Contact Number",
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }
//     if (BirthDateController.text == "") {
//       Utils.showPrimarySnackbar(context, "Please Fill Birth Date",
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }
// // BirthDateController
//     if (patientNumberController.text == "") {
//       Utils.showPrimarySnackbar(context, "Please Fill Contact Number",
//           type: SnackType.error);
//       notifyListeners();
//       return;
//     }

//     if (selectedCountryId == null) {
//       Utils.showPrimarySnackbar(context, "Please Select Country",
//           type: SnackType.error);
//       return;
//     }
//     if (selectedCityId == null) {
//       Utils.showPrimarySnackbar(context, "Please Select City",
//           type: SnackType.error);
//       return;
//     }
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     informationRepository
//         .patientRepo(informationRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result =
//           InformationResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         idpatientId = result.idpatientId;
//         print("${idpatientId?.patientId.toString()}teeeeee");
//         print("${packageId.toString()}uuu");
//         // return;
//         Navigator.push(
//           context,
//           SlidePageRoute(
//             page: PaymentDetailsView(
//               purchaseType: "other",
//               patientID: idpatientId?.patientId.toString(),
//               screenName: "infotmation",
//               packageId: packageId.toString(),
//               // watch.packageId
//             ),
//             direction: SlideDirection.right, // Specify the slide direction here
//             delay: Duration(milliseconds: 5000),
//           ),
//         );
//         notifyListeners();
//       } else {
//         log(response.body);
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
