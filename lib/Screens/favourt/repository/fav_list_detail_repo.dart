import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class FavListDetailtRepo {
  Future<http.Response> favListdetails(token) async {
    try {
      print(Endpoint.favListDetail);
      return await http.get(Uri.parse(Endpoint.favListDetail), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
