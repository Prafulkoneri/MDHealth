import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class NewCityGetlistRepo {
  Future<http.Response> newGetlistCity(token) async {
    print(Uri.parse(Endpoint.mdGetCitylistNew));

    try {
      return await http.get(Uri.parse(Endpoint.mdGetCitylistNew), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
