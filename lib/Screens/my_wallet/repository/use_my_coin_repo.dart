import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class UseMycoinRepo {
  Future<http.Response> useCoin(token) async {
    try {
      print(Endpoint.useMyCoinnew);
      return await http.get(Uri.parse(Endpoint.useMyCoinnew), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
