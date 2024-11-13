// import 'dart:developer';
// import 'package:md_health/Screens/home_services/hs_payment/model/hs_payment_purchase_model.dart';
// import 'package:md_health/Screens/home_services/hs_payment/model/testing_model.dart';
// import 'package:md_health/network/end_point.dart';
// import 'package:http/http.dart' as http;

// class NHsgetPurchaseInformationRepo {
//   Future<http.Response> hsGetPurchaseInformation(
//       NLastHsPurchaseDetailsRequestModel reqModel, token) async {
//     print(reqModel.toJson());
//     print(Uri.parse(Endpoint.hsGetPurchseInformation));
//     log("${reqModel.toJson()}");
//     try {
//       return await http.post(Uri.parse(Endpoint.hsGetPurchseInformation),
//           body: reqModel.toJson(),
//           headers: {
//             "Authorization": "Bearer $token",
//           });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
