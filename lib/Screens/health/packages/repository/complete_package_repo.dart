import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class CompletedPackageRepo {
  Future<http.Response> completedPackage(token) async {
    try {
      print(Endpoint.completedPackageList);
      return await http.get(Uri.parse(Endpoint.completedPackageList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
