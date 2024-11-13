import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ReviewPopUpRepository {
  Future<http.Response> reviewpopUP(token) async {
    print(Uri.parse(Endpoint.reviewStatus));

    try {
      return await http.get(Uri.parse(Endpoint.reviewStatus), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
