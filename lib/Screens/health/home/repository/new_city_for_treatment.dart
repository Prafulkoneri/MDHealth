import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/home/model/new_city_for_treatment.dart';
import 'package:md_health/network/end_point.dart';

import 'dart:developer';

class NewCityforTreatmentRepo {
  Future<http.Response> newCityfortreatment(
      NewCityForRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.newCityforTreatment));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.newCityforTreatment),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
