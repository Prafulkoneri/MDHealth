import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class OrderCountRepo {
  Future<http.Response> orderCount(token) async {
    try {
      print(Endpoint.orderCount);
      return await http.get(Uri.parse(Endpoint.orderCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
// ShopOrderCount