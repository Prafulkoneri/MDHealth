import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_cart/model/cart_increment_%20model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class CartCountIncreaseRepo {
  Future<http.Response> cartIncrement(
      CardIncrementRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.cartIncrement));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.cartIncrement),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
