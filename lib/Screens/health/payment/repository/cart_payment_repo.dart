import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/payment/model/payment_purches_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class PaymentDetailslastRepository {
  Future<http.Response> getPaymentDetailsList(
      PurchaseDetailsRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.getPurchesInformation));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.getPurchesInformation),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
