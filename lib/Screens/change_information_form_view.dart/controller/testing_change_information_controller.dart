// import 'dart:convert';
// import 'dart:developer';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/auth/model/city_list_model.dart';
// import 'package:md_health/Screens/auth/model/country_list_model.dart';
// import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
// import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
// import 'package:md_health/Screens/change_information_form_view.dart/model/change_information_model.dart';
// import 'package:md_health/Screens/packages/view/packages_view.dart';
// import 'package:md_health/test_widget.dart';

// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:md_health/Screens/change_information_form_view.dart/model/get_change_model.dart';
// import 'package:md_health/Screens/change_information_form_view.dart/repository/change_information_repo.dart';
// import 'package:md_health/Screens/change_information_form_view.dart/repository/get_change_inforamtion_repo.dart';

// class ChnagePatientController extends ChangeNotifier {
//   GetChangeInformationRepo getchangeInformationRepo =
//       GetChangeInformationRepo();
//   UpdateChangeINformationRepo updateChangeINformationRepo =
//       UpdateChangeINformationRepo();
//   TextEditingController patientFullNameController = TextEditingController();
//   TextEditingController patientLastNameController = TextEditingController();
//   TextEditingController patientRelationController = TextEditingController();
//   TextEditingController patientNumberController = TextEditingController();
//   TextEditingController patientEmailController = TextEditingController();
//   TextEditingController BirthDateController = TextEditingController();
//   TextEditingController citySearchController = TextEditingController();
//   TextEditingController areaSearchController = TextEditingController();
//   // TextEditingController planToStartController = TextEditingController();
//   String selectedCountryId = "";
//   String selectedCityId = "";
//   String countryName = "";
//   String cityName = "";
//   String? packageId;
//   String? purchesId;
//   String? patientId;
//   String? type;

//   bool isLoading = true;
//   PatientInformation? patientInformation;

// /////////////////////////////
//   Future<void> initState(context, pId, purId, paId, pType) async {
//     print(patientId);
//     print("object");
//     this.patientId = paId;
//     await getChangeInforamtion(context, pId, purId, paId, pType);
//     getCountry(context);
//     getCities(context);
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   void onToDateSelected(date) {
//     BirthDateController.text = date;
//     notifyListeners();
//   }

//   GetChangePatientRequestModel get getChangePatientRequestModel =>
//       GetChangePatientRequestModel(
//         type: type,
//         packageId: packageId.toString(),
//         purchesId: purchesId.toString(),
//       );

//   Future<void> getChangeInforamtion(context, pId, purId, paId, pType) async {
//     packageId = pId;
//     purchesId = purId;
//     type = pType;
//     // patientId = paId;
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     getchangeInformationRepo
//         .getchnageInforamtion(
//             getChangePatientRequestModel, pref.getString("successToken"))
//         .then((response) {
//       log(response.body);
//       final result = GetChangePatientResModel.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         print("object");
//         print(patientInformation);
//         print("object");
//         if (result.status == 200) {
//           patientInformation = result.patientInformation;
//           print("object");
//           print(patientInformation);
//           print("object");
//           patientFullNameController.text =
//               patientInformation?.patientFullName ?? "";
//           ////
//           patientLastNameController.text =
//               patientInformation?.patientLastName ?? "";
//           BirthDateController.text = patientInformation?.patientBirthDate ?? "";
//           /////
//           patientRelationController.text =
//               patientInformation?.patientRelation ?? "";
//           patientNumberController.text =
//               patientInformation?.patientContactNo ?? "";
//           patientEmailController.text = patientInformation?.patientEmail ?? "";
//           cityName = patientInformation?.cityName ?? "";
//           countryName = patientInformation?.countryName ?? "";
//           patientId = patientInformation?.patientId.toString();
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

//   List<CountryList>? countryList;

//   Future<void> getCountry(context) async {
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

//   Future<void> onSelectCityType(int value) async {
//     selectedCityId = value.toString();
//     print("controller" + selectedCityId.toString());
//     notifyListeners();
//   }

//   CountryListRepository countryListRepo = CountryListRepository();
//   CityListRepository cityListRepo = CityListRepository();

//   List<CityListData>? cityList;
//   CityListRequestModel get cityListRequestModel =>
//       CityListRequestModel(countryId: selectedCountryId.toString());

//   Future<void> getCities(context) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     cityListRepo
//         .getCityList(cityListRequestModel, pref.getString("successToken"))
//         .then((response) {
//       print(response.body);
//       final result = CityListResponseModel.fromJson(jsonDecode(response.body));
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         print(response.body);
//         cityList = result.cityList;
//         print(cityList);
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

//   Future<void> onSelectCountryType(int value) async {
//     selectedCountryId = value.toString();
//     print(selectedCountryId);
//     notifyListeners();
//   }

//   UpdateChangeRequestModel get updateChangeRequestModel =>
//       UpdateChangeRequestModel(
//         type: type,
//         patientId: patientId,
//         purchesId: purchesId.toString(),
//         patientBirthDate: BirthDateController.text,
//         packageId: packageId,
//         platFormType: "android",
//         patientRelation: patientRelationController.text,
//         patientEmail: patientEmailController.text,
//         patientContactNumber: patientNumberController.text,
//         packageBuyFor: patientRelationController.text,
//         patientLastName: patientLastNameController.text,
//         patientFullName: patientFullNameController.text,
//         patientCityId: (selectedCityId),
//         patientCountryId: (selectedCountryId),
//       );

//   Future<void> updateChangeInfo(context) async {
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     updateChangeINformationRepo
//         .updateChangeInforamtion(
//             updateChangeRequestModel, pref.getString("successToken"))
//         .then((response) {
//       log(response.body);
//       final result = UpdateChanmgeInforamtionResmodel.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         if (result.status == 400) {
//           print("object");
//           print(patientInformation);
//           print("object");
//           Navigator.push(
//             context,
//             SlidePageRoute(
//               page: PackageSView(
//                 patientID: patientId.toString(),
//                 id: purchesId.toString(),
//                 packageId: packageId.toString(),
//               ),
//               direction: SlideDirection.right,
//               delay: Duration(milliseconds: 5000),
//             ),
//           );
//           notifyListeners();
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.success);
//         }
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);
//       } else if (result.status == 200) {
//         Utils.showPrimarySnackbar(
//             context, "You can't update the patient information.",
//             type: SnackType.error);
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

//   // Future<void> updateChangeInfo(
//   //   context,
//   // ) async {
//   //   showLoader(true);
//   //   SharedPreferences pref = await SharedPreferences.getInstance();
//   //   print(pref.getString("successToken"));
//   //   updateChangeINformationRepo
//   //       .updateChangeInforamtion(
//   //           updateChangeRequestModel, pref.getString("successToken"))
//   //       .then((response) {
//   //     log(response.body);
//   //     final result = UpdateChanmgeInforamtionResmodel.fromJson(
//   //       jsonDecode(response.body),
//   //     );
//   //     if (response.statusCode == 200) {
//   //       if (result.status == 200) {
//   //         print("object");
//   //         print(patientInformation);
//   //         print("object");
//   //         Navigator.push(
//   //           context,
//   //           SlidePageRoute(
//   //             page: PackageSView(
//   //               patientID: patientId.toString(),
//   //               id: purchesId.toString(),
//   //               packageId: packageId.toString(),
//   //             ),
//   //             direction:
//   //                 SlideDirection.right, // Specify the slide direction here
//   //             delay: Duration(milliseconds: 5000),
//   //           ),
//   //         );
//   //         notifyListeners();
//   //         Utils.showPrimarySnackbar(context, result.message,
//   //             type: SnackType.success);
//   //       }
//   //       Utils.showPrimarySnackbar(context, result.message,
//   //           type: SnackType.success);
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
// }
