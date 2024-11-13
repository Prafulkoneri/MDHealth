import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/submit_hs_review_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class SubmitHSreviewRepo {
  Future<http.Response> submitHSreview(
      HSAddReviewNewRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.submitHsReview));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.submitHsReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
