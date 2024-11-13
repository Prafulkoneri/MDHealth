import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/review_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class WriteReviewRepo {
  Future<http.Response> writereview(
      WirteReviewRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.writeReview));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.writeReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
