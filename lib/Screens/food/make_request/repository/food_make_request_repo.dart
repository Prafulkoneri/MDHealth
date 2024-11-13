import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/make_request/model/make_request_model.dart';
import 'package:md_health/Screens/person_information/model/fill_form_model.dart';
import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class FoodFormRequestRepo {
  Future<http.Response> foodRequest(
      FoodFormViewHomeRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.foodRequestForm));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.foodRequestForm),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
