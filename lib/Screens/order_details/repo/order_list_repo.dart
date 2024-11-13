import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class OrderListrepo {
  Future<http.Response> orderList(token) async {
    try {
      print(Endpoint.orderList);
      return await http.get(Uri.parse(Endpoint.orderList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
