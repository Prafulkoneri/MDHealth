import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/Vendro_food_list/model/vendor_list_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class FoodVendorListRepo {
  Future<http.Response> foodVendorlist(
      VendorFoodListRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.foodVendorList));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.foodVendorList),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
