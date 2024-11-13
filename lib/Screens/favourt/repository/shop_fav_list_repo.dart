import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ShopFavListRepo {
  Future<http.Response> shopFavList(token) async {
    try {
      print(Endpoint.shopFavList);
      return await http.get(Uri.parse(Endpoint.shopFavList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
