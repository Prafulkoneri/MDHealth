import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/diet_plan/model/add_to_fav_food_repo.dart';
import 'package:md_health/network/end_point.dart';

class addToFavFood {
  Future<http.Response> foodAddFav(
      AddFavFooDRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.mdFoodAddtoFavorite));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.mdFoodAddtoFavorite),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
