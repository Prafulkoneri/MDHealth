// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/home_services/hs_payment/model/hs_payment_purchase_model.dart';
// import 'package:md_health/Screens/home_services/hs_payment/model/testing_model.dart';
// import 'package:md_health/Screens/home_services/hs_payment/repo/bank_payment_repo.dart';
// import 'package:md_health/Screens/home_services/hs_payment/repo/wallet_payment_repo.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TestingHsPaymentLastController extends ChangeNotifier {
//   Future<void> initState(context, sPrice, pId, percent, purId,patientID
//       // sPrice, priceP, percentagePrices,
//       //     oServices, purchesId, patientID, purcType, pName, type
//       ) async {
//     print("objectttt");
//     await hsgetPaymentDetailsList(context, sPrice, pId, percent, purId,patientID
//         //  sPrice, pId, percentagePrices,
//         //     purcType, type, priceP, oServices
//         );
//     notifyListeners();
//   }

//   String? purchaseType = ''; //
//   String? purchaseId = ''; ////
//   String? paymentType = ''; //
//   String? packageId = ''; ////
//   String? salePrice = ''; ////
//   String? price = ''; //
//   String? percentage = ''; ////
//   String? patientID = ''; ////
//   List<String>? otherService;
//   NLastHsPurchaseDetailsRequestModel get nlastHsPurchaseDetailsRequestModel =>
//       NLastHsPurchaseDetailsRequestModel(patientID:patientID,
//         salePrice: salePrice,
//         packageId: packageId.toString(),
//         percentage: percentage,
//         purchesId: purchaseId.toString() ?? '',
//         // percentage: percentage,
//         // paymentType: paymentType,
//         // purchaseType: purchaseType.toString(),
//         // packageId: packageId.toString(),
//         // price: price,
//         // otherService: otherService,
//       );
//   NHsgetPurchaseInformationRepo hsgetPurchaseInformationRepo =
//       NHsgetPurchaseInformationRepo();
//   // PurchaseDetailsDataLast? purchaseDetailsDataLast;
//   // List<OtherService>? otherServices;
//   Future<void> hsgetPaymentDetailsList(context, sPrice, pId, percent, purId
//       //  sPrice, pId, percentagePrices,
//       //     purcType, type, priceP, oServices
//       ) async {
//     salePrice = sPrice.toString();
//     packageId = pId.toString();

//     // price = priceP;
//     percentage = percent;
//     purchaseId = purId;
//     // otherService = oServices;
//     // purchaseType = purcType;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     hsgetPurchaseInformationRepo
//         .hsGetPurchaseInformation(
//             nlastHsPurchaseDetailsRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       // print(response.body);
//       debugPrint('/////////////');
//       final result = NHsLastPurchaseDetailsResponseModel.fromJson(
//           jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         print(response.body);
//         // purchaseDetailsDataLast = result.purchaseDetailsDataLast;
//         // otherServices = result.otherServices;
//         notifyListeners();
//       } else {
//         print(response.body);
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
