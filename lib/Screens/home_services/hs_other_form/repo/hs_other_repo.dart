import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/home_services/hs_other_form/model/hs_other_model.dart';
import 'package:md_health/network/end_point.dart';

class HsOtherFormRepo {
  Future<http.Response> hsother(HsOtherFormRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.hsOther));
    log("${reqModel.toJson()}");

    try {
      return await http
          .post(Uri.parse(Endpoint.hsOther), body: reqModel.toJson(), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
