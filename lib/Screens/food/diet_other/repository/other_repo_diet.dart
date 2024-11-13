import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/diet_other/model/diet_other_model.dart';
import 'package:md_health/network/end_point.dart';

class DietOtherRepo {
  Future<http.Response> otherDiet(DietOtherRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.mdFoodOtherform));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.mdFoodOtherform),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
