import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ShopOrderListRepo {
  Future<http.Response> shoporderList(token) async {
    try {
      print(Endpoint.shopOrderList);
      return await http.get(Uri.parse(Endpoint.shopOrderList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
