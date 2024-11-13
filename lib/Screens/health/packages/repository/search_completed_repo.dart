import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/canceled_search_model.dart';
import 'package:md_health/Screens/health/packages/model/completed_search_model.dart';
import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class CompletedSearchRepo {
  Future<http.Response> completedSeacrh1(
      CompletedSearchPackgeRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.completedSearch));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.completedSearch),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
