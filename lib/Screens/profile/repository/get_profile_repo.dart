import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class GetProfileDetail {
  Future<http.Response> getProfileData(token) async {
    try {
      print(Endpoint.getProfileData);
      return await http.get(Uri.parse(Endpoint.getProfileData), headers: {
        "Authorization": "Bearer $token",
        // 'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
