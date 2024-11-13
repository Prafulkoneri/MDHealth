import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/show_hs_review_model.dart';
import 'package:md_health/Screens/order_details/model/show_shop_review_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class ShowShopReviewRepo {
  Future<http.Response> showShopreview(
      ShowShopOrderReviewRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.showShopReview));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.showShopReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
