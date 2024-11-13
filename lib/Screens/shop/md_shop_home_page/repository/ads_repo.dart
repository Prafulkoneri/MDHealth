import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class AdsRepo {
  Future<http.Response> ads(token) async {
    try {
      print(Endpoint.adsRepo);
      return await http.get(Uri.parse(Endpoint.adsRepo), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
