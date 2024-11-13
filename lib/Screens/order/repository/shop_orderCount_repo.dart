import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ShopCountOrderRepo {
  Future<http.Response> shopCountO(token) async {
    try {
      print(Endpoint.ShopOrderCount);
      return await http.get(Uri.parse(Endpoint.ShopOrderCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
// ShopOrderCount