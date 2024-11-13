import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/information_form/model/information_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class InformationRepository {
  Future<http.Response> patientRepo(
      InformationRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.patientInforamtion));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.patientInforamtion),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
