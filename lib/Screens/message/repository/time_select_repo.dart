import 'package:http/http.dart' as http;
import 'package:md_health/Screens/message/model/time_select_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class TimeSelectRepo {
  Future<http.Response> timeSelect(
      TimeActiveRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.timeSelect));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.timeSelect),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
