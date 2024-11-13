import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/search/model/search_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class SearchViewRepository {
  Future<http.Response> getPackages(
      SearchListRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.mdCustomerPackageSearchFilter),
        body: requestModel.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("I am an Exception");
      throw Exception(e);
    }
  }
}
