import 'dart:developer';

import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/bank_transfer/model/bank_detai_model.dart';
import 'package:md_health/Screens/health/bank_transfer/model/bank_detai_model.dart';
import 'package:md_health/network/end_point.dart';

class BankListDetailRepo {
  Future<http.Response> bankListdetail(
      BankListRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.bankDetails));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.bankDetails),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
