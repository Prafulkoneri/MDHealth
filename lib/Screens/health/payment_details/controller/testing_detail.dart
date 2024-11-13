// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/payment_details/model/disscount_model.dart';
// import 'package:md_health/Screens/payment_details/model/payment_details_model.dart';
// import 'package:md_health/Screens/payment_details/repository/disscount_repository.dart';
// import 'package:md_health/Screens/payment_details/repository/payment_details_repository.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PaymentDetailsController extends ChangeNotifier {
//   PaymentDetailsRepository paymentDetailRepository = PaymentDetailsRepository();
//   DisscountRepo disscountRepo = DisscountRepo();
//   PurchaseDetails? purchaseDetails;
//   List<OtherService>? otherServices;
//   // List<Discount>? discounts;
//   List<Discount>? discounts;
//   String packageId = '';
//   // String radioGrpValue = "1";
//   String salePrice = "";
//   bool? value;
//   String radioGrpValue = "1";
//   String selectedPlanId = "0";
//   String selectedIndex = "0";
//   String selectedPrice = "0";
//   String selectedPercetage = "0";
//   List<bool> radioValue = [true];
//   List amountList = [];
//   bool isLoading = false;
//   List<bool> selectAddonServicesList = [true];
//   List selectedAddOnServicesId = [];
//   Future<void> initState(context, pId) async {
//     await getPaymentDetailsList(context, pId);
//     getDisscountamount(context);
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   DisscountRequestModel get disscountRequestModel => DisscountRequestModel(
//         salePrice: salePrice,
//         packageId: packageId.toString(),
//       );
//   void onRadioBtnChanged(value, id, price) {
//     int selectedIndex =
//         discounts?.indexWhere((discount) => discount?.id == id) ?? -1;
//     if (selectedIndex != -1) {
//       for (int i = 0; i < radioValue.length; i++) {
//         radioValue[i] = (i == selectedIndex);
//       }
//       selectedPrice = discounts?[selectedIndex].price ?? "";
//       selectedPercetage = discounts?[selectedIndex].percentage ?? "";
//       selectedPlanId = id.toString();
//       notifyListeners();
//     }
//   }

//   void onAddOnOtherServicesSelected(index, id, price, context) {
//     selectAddonServicesList[index] = !selectAddonServicesList[index];
//     if (selectAddonServicesList[index]) {
//       selectedAddOnServicesId.removeWhere((item) => item == id);
//       selectedAddOnServicesId.insert(0, id);
//       salePrice =
//           (double.parse(salePrice) + double.parse(price.toString())).toString();
//     } else {
//       selectedAddOnServicesId.removeWhere((item) => item == id);
//       salePrice =
//           (double.parse(salePrice) - double.parse(price.toString())).toString();
//     }
//     print(selectedAddOnServicesId);
//     getDisscountamount(context);
//     notifyListeners();
//   }

//   PaymentDetailRequestModel get paymentdetailRequestModel =>
//       PaymentDetailRequestModel(packageId: packageId.toString());
//   Future<void> getPaymentDetailsList(context, pId) async {
//     packageId = pId;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     paymentDetailRepository
//         .getPaymentDetailsList(
//             paymentdetailRequestModel, pref.get('successToken'))
//         .then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result =
//           PaymentDetailReponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         purchaseDetails = result.purchaseDetails;
//         otherServices = result.otherServices;
//         // discounts = result.discounts;

//         print(otherServices?.length);
//         salePrice = result.purchaseDetails?.salePrice ?? "";
//         selectAddonServicesList =
//             List<bool>.filled(otherServices?.length ?? 0, true, growable: true);

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
//   /////////////////////////////

//   Future<void> getDisscountamount(context) async {
//     // salePrice = pId;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     disscountRepo
//         .disscountrepo(disscountRequestModel, pref.get('successToken'))
//         .then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result = DisscountResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         discounts = result.discounts;
//         // purchaseDetails = result.purchaseDetails;
//         // otherServices = result.otherServices;
//         // // discounts = result.discounts;

//         // print(otherServices?.length);
//         // salePrice = result.purchaseDetails?.salePrice ?? "";
//         // selectAddonServicesList =
//         //     List<bool>.filled(otherServices?.length ?? 0, true, growable: true);

//         int length = discounts?.length ?? 0;
//         radioValue.clear();
//         for (int i = 0; i < length; i++) {
//           radioValue
//               .add(false); // Assuming all radio buttons start as unselected
//         }
//         radioValue[0] = true;

//         // for (int i = 0; i < length; i++) {
//         //   amountList.add(discounts?[i].price);
//         // }

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
