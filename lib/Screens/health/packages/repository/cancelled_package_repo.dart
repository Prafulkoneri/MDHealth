import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class CancelledPackageRepo {
  Future<http.Response> cancelledPackage(token) async {
    try {
      print(Endpoint.canclledPackageList);
      return await http.get(Uri.parse(Endpoint.canclledPackageList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
