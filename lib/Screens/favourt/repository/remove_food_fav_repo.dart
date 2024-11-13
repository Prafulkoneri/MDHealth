import 'package:http/http.dart' as http;
import 'package:md_health/Screens/favourt/model/remoe_food_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class RemoveFoodFromFavRepo {
  Future<http.Response> removeFoodFromFavRepo(
      RemoveFooodFavRequestmodel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.removeFood));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.removeFood),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
