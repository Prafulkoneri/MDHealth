import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/submit_shop_review_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class SubmitShopreviewRepo {
  Future<http.Response> submitshopreview(
      ShopAddReviewNewRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.shopSubmitReview));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.shopSubmitReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
