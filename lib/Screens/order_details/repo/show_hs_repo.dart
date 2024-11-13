import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/show_hs_review_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class ShowHSreviewRepo {
  Future<http.Response> showHSreview(
      ShowHSOrderReviewRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.showHsReview));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.showHsReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
