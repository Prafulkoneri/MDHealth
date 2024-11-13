import 'package:http/http.dart' as http;
import 'package:md_health/Screens/change_information_form_view.dart/model/get_change_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class GetChangeInformationRepo {
  Future<http.Response> getchnageInforamtion(
      GetChangePatientRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.getChangePatientInforamtion));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.getChangePatientInforamtion),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
