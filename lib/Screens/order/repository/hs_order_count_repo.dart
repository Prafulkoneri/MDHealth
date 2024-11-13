import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class HsOrderCountRepo {
  Future<http.Response> hsorderCount(token) async {
    try {
      print(Endpoint.hsOrderCount);
      return await http.get(Uri.parse(Endpoint.hsOrderCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
// ShopOrderCount