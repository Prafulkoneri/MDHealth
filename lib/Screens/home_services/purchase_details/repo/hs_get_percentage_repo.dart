import 'dart:developer';

import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/model/search_list_model.dart';
import 'package:md_health/Screens/home_services/purchase_details/model/he_purchase_details.dart';
import 'package:md_health/Screens/home_services/purchase_details/model/hs_get_percentage.dart';
import 'package:md_health/network/end_point.dart';
import 'package:http/http.dart' as http;

class HSgetPercentageRepo {
  Future<http.Response> hsgetpercentage(
      HsDisscountRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.hsgethspercentage));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.hsgethspercentage),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
