import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/payment_details/model/disscount_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class DisscountRepo {
  Future<http.Response> disscountrepo(
      DisscountRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.updatePercetage));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.updatePercetage),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}