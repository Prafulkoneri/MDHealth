import 'package:http/http.dart' as http;
import 'package:md_health/Screens/change_information_form_view.dart/model/change_information_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class UpdateChangeINformationRepo {
  Future<http.Response> updateChangeInforamtion(
      UpdateChangeRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.changePatientInforamtion));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.changePatientInforamtion),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
