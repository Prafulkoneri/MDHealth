import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ShopFavCountlistRepo {
  Future<http.Response> shopfavCount(token) async {
    try {
      print(Endpoint.shopFavCount);
      return await http.get(Uri.parse(Endpoint.shopFavCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
