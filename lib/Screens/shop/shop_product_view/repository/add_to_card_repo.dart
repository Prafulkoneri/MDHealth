import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_product_view/model/add_to_cart_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class AddToCardProductRepo {
  Future<http.Response> addToCart(AddtoCartRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.addToCart));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.addToCart),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
