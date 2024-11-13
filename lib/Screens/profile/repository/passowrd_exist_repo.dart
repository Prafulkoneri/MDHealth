import 'package:http/http.dart' as http;
import 'package:md_health/Screens/profile/model/password_model.dart';
import 'dart:developer';

import 'package:md_health/Screens/profile/model/update_profile_model.dart';
import 'package:md_health/network/end_point.dart';

class PasswordExitRepo {
  Future<http.Response> passwordExit(
      CheckPasswordExitRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.passwordExist));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.passwordExist),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
