import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class PricesCountRepo {
  Future<http.Response> pricesCount(token) async {
    try {
      print(Endpoint.hsPricesCount);
      return await http.get(Uri.parse(Endpoint.hsPricesCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
