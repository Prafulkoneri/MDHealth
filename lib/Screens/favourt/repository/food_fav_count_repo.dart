import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class FoodFavCountrepo {
  Future<http.Response> foodFavCount(token) async {
    try {
      print(Endpoint.foodfavCount);
      return await http.get(Uri.parse(Endpoint.foodfavCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
