import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/shop/shop_product_view/model/follw_vendor_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_add_fav_model.dart';
// import 'package:md_health/Screens/shop/shop_product_view/model/shop_product_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class ShopProductAddToFavRepo {
  Future<http.Response> shopProductaddfav(
      ShopProductAddToFavRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.shopProductAddToFav));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.shopProductAddToFav),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
