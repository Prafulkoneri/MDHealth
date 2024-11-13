import 'dart:developer';
import 'package:md_health/Screens/home_services/hs_payment/model/hs_payment_purchase_model.dart';
import 'package:md_health/Screens/home_services/hs_payment/model/payment_done_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:http/http.dart' as http;

class HsPaymentDoneRepo {
  Future<http.Response> hspaymentDone(
      HSPaymentDoneRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.hsorderidNumberDone));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.hsorderidNumberDone),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
