import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/active_search_model.dart';
import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class SearchActiveListRepo {
  Future<http.Response> searchActive(
      ActiveSearchPackgeRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.activeSearchPackageList));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.activeSearchPackageList),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
