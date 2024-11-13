import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

// class TopProviderlistHomeServicesRepo {
//   Future<http.Response> servicesPackage(token) async {
//     print(Uri.parse(Endpoint.hsTopProvider));

//     try {
//       return await http.get(Uri.parse(Endpoint.hsTopProvider), headers: {
//         "Authorization": "Bearer $token",
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

class TopProviderlistHomeServicesRepo {
  Future<http.Response> servicesPackage(token) async {
    try {
      print(Endpoint.hsTopProvider);
      return await http.get(Uri.parse(Endpoint.hsTopProvider), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
