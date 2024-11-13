import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_cart/model/cart_decrement_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class CartCountDecreaseRepo {
  Future<http.Response> cartdecrement(
      CardDecrementRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.cartdecrement));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.cartdecrement),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
