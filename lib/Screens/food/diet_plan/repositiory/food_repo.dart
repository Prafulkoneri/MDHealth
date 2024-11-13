import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class GetFoodRepo {
  Future<http.Response> getfood(token) async {
    try {
      print(Endpoint.mdFoodType);
      return await http.get(Uri.parse(Endpoint.mdFoodType), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
