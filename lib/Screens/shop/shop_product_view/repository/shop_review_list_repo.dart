import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/shop/shop_product_view/model/shop_product_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_rating_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class ShopProductReviewRepo {
  Future<http.Response> shopProductReView(
      ShopProductReviewRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.shopProductReviewList));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.shopProductReviewList),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
