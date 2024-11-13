import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class UserNameRepo {
  Future<http.Response> userName(token) async {
    print(Uri.parse(Endpoint.userName));

    try {
      return await http.get(Uri.parse(Endpoint.userName), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
