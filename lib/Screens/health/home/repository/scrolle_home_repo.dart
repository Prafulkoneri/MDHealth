import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class HomeScrolleRepo {
  Future<http.Response> homeScrolle(token) async {
    print(Uri.parse(Endpoint.homeScroole));

    try {
      return await http.get(Uri.parse(Endpoint.homeScroole), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
