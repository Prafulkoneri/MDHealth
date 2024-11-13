import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ReviewCountRepo {
  Future<http.Response> reviewCount(token) async {
    try {
      print(Endpoint.hsRatingCount);
      return await http.get(Uri.parse(Endpoint.hsRatingCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
