import 'package:http/http.dart' as http;
import 'package:md_health/Screens/review/model/reviw_model.dart';
import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class ReviewRepo {
  Future<http.Response> review(ReviewRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.reviewList));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.reviewList),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
