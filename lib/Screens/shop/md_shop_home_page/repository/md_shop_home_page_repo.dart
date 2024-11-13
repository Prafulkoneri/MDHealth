import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ShopHomePageRepo {
  Future<http.Response> shopHomepage(token) async {
    try {
      print(Endpoint.shopHomePage);
      return await http.get(Uri.parse(Endpoint.shopHomePage), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}