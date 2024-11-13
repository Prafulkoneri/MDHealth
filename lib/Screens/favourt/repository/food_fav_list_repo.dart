import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class FoodFavListRepo {
  Future<http.Response> foodFavlist(token) async {
    try {
      print(Endpoint.mdFoodFavList);
      return await http.get(Uri.parse(Endpoint.mdFoodFavList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
