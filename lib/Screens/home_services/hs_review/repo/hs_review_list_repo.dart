import 'package:http/http.dart' as http;
import 'package:md_health/Screens/home_services/hs_review/model/hs_review_list_model.dart';
import 'package:md_health/network/end_point.dart';

class HsReViewRepository {
  Future<http.Response> hslistReview(
      HomeServicesReViewlistRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.hslistReview),
        body: requestModel.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
    } catch (e) {
      print('I am a exception');
      print(e);
      throw Exception();
    }
  }
}
