import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ServicesCountRepo {
  Future<http.Response> servicesCount(token) async {
    try {
      print(Endpoint.hsServicesCount);
      return await http.get(Uri.parse(Endpoint.hsServicesCount), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
