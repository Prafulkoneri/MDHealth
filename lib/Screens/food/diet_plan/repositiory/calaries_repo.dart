import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class CaloriesRepo {
  Future<http.Response> calariesData(token) async {
    try {
      print(Endpoint.mdFoodCalories);
      return await http.get(Uri.parse(Endpoint.mdFoodCalories), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
