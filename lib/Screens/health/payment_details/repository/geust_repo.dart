import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class GeuestNumberRepo {
  Future<http.Response> geuestNumber(token) async {
    try {
      print(Endpoint.guestNumber);
      return await http.get(Uri.parse(Endpoint.guestNumber), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
