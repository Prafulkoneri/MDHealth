import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class HsFavCountlistRepo {
  Future<http.Response> hsfavCount(token) async {
    try {
      print(Endpoint.hsfavCount);
      return await http.get(Uri.parse(Endpoint.hsfavCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
