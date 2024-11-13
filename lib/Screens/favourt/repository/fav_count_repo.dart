import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class FavCountlistRepo {
  Future<http.Response> favCount(token) async {
    try {
      print(Endpoint.favCountList);
      return await http.get(Uri.parse(Endpoint.favCountList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
