import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:md_health/Screens/profile/model/update_profile_model.dart';
import 'package:md_health/network/end_point.dart';

class UpdtaeProfileRepo {
  Future<http.Response> updateprofile(
      GetProfileRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.upadteProfile));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.upadteProfile),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
