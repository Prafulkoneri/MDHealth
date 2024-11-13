import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/diet_plan/model/diet_view_model.dart';
import 'package:md_health/network/end_point.dart';

class DietViewRepo {
  Future<http.Response> dietView(DietViewRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.foodPacakgeSearchViewDetails));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.foodPacakgeSearchViewDetails),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
