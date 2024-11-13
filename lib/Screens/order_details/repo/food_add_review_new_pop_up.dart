import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/submit_food_review.dart';
import 'package:md_health/network/end_point.dart';

class FoodAddReviewNewPopUpRepo {
  Future<http.Response> writeFoodReview(
      FoodAddReviewNewRequestModel reqModel, token) async {
    // print(reqModel.toJson());

    // print(Uri.parse(Endpoint.writeFoodReview));
    // log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.writeFoodReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
