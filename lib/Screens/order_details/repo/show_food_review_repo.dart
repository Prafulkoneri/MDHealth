import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/show_food_review_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class ShowFoodreviewRepo {
  Future<http.Response> showfoodreview(
      ShowFoodOrderReviewRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.showfoodReview));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.showfoodReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
