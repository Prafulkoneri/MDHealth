import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class MostUsedFoodRepo {
  Future<http.Response> mostFood(token) async {
    try {
      print(Endpoint.mostUsedProvider);
      return await http.get(Uri.parse(Endpoint.mostUsedProvider), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
