import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/active_review_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class ThreeReviewRepo {
  Future<http.Response> threeReview(
      ActiveReviewRequestMOdel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.threeReview));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.threeReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
