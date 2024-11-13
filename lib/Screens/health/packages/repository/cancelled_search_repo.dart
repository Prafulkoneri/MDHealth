import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/canceled_search_model.dart';
import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class CanclledSearchRepo {
  Future<http.Response> cancelledSeach(
      CanceledSearchPackgeRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.canclledSearch));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.canclledSearch),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
