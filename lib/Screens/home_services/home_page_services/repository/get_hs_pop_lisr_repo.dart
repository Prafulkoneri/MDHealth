import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class HSpopListRepo {
  Future<http.Response> homeservicesListRepo(token) async {
    try {
      print(Endpoint.hspopUpList);
      return await http.get(Uri.parse(Endpoint.hspopUpList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
