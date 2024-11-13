import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ActivePackageRepo {
  Future<http.Response> activePackage(token) async {
    try {
      print(Endpoint.activePackageList);
      return await http.get(Uri.parse(Endpoint.activePackageList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
