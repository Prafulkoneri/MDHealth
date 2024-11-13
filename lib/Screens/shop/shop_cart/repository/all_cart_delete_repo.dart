import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class AllCartDelete {
  Future<http.Response> deleteall(token) async {
    try {
      print(Endpoint.deletedFullCart);
      return await http.get(Uri.parse(Endpoint.deletedFullCart), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
