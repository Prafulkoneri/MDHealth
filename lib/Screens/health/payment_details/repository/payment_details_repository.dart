import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/payment_details/model/payment_details_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class PaymentDetailsRepository {
  Future<http.Response> getPaymentDetailsList(
      PaymentDetailRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.mdCustomerPackagePurchaseDetails));
    log("${reqModel.toJson()}");

    try {
      return await http.post(
          Uri.parse(Endpoint.mdCustomerPackagePurchaseDetails),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
