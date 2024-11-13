import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/completed_get_review_model.dart';
import 'package:md_health/network/end_point.dart';

class CompletedGetReviewRepo {
  Future<http.Response> getCompletedPkgReview(
      CompletedGetReviewRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.getCompletedPackageReview));

    try {
      return await http.post(Uri.parse(Endpoint.getCompletedPackageReview),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
