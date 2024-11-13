import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/cancelled_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class DeleteActivePackaegRequestRepo {
  Future<http.Response> deletePackageActive(
      CancelledRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.cancelledActivePackages));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.cancelledActivePackages),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
////////////////////////
// class PaymentDetailsRepository {
//   Future<http.Response> getPaymentDetailsList(
//       PaymentDetailRequestModel reqModel, token) async {
//     print(reqModel.toJson());

//     print(Uri.parse(Endpoint.mdCustomerPackagePurchaseDetails));
//     log("${reqModel.toJson()}");

//     try {
//       return await http.post(
//           Uri.parse(Endpoint.mdCustomerPackagePurchaseDetails),
//           body: reqModel.toJson(),
//           headers: {
//             "Authorization": "Bearer $token",
//           });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }