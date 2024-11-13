import 'package:http/http.dart' as http;
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class CityListRepository {
  Future<http.Response> getCityList(
      CityListRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.mdCityList));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.mdCityList),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
