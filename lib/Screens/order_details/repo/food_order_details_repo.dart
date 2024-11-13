import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/order_details_food_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class FoodOrderDetailsRepo {
  Future<http.Response> foodOrderDetails(
      OrderListDetailsRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.orderListFoodDetails));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.orderListFoodDetails),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
