import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class NetWorlRepo {
  Future<http.Response> netWork(token) async {
    try {
      print(Endpoint.netWorkRepo);
      return await http.get(Uri.parse(Endpoint.netWorkRepo), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
