import 'package:http/http.dart' as http;
import 'package:md_health/Screens/person_information/model/fill_form_model.dart';
import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class FillFormViewRepo {
  Future<http.Response> homeFillForm(
      FillFormViewHomeRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.makeHomeRequestForm));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.makeHomeRequestForm),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
