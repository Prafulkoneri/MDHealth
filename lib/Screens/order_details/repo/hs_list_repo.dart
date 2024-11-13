import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class HsOrderListrepo {
  Future<http.Response> hsorderList(token) async {
    try {
      print(Endpoint.hsorderList);
      return await http.get(Uri.parse(Endpoint.hsorderList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
