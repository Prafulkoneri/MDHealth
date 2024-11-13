import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ShopBannerRepo {
  Future<http.Response> shopBanner(token) async {
    try {
      print(Endpoint.shopFirstBanner);
      return await http.get(Uri.parse(Endpoint.shopFirstBanner), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
