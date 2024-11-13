import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/payment/model/payment_done_model.dart';
import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class PaymentDoneRepo {
  Future<http.Response> paymentdone(
      PaymentDoneRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.packagePaymentDone));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.packagePaymentDone),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
