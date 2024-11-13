import 'dart:developer';

import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/model/search_list_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:http/http.dart' as http;

class HSSearchListRepo {
  Future<http.Response> hSearchlist(
      HomeSSearchListRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.hssearchlist));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.hssearchlist),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
