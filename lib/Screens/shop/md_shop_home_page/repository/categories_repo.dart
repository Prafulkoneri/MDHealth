import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class CategoriesRepo {
  Future<http.Response> getCategories(token) async {
    try {
      print(Endpoint.shopGetCategories);
      return await http.get(Uri.parse(Endpoint.shopGetCategories), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
