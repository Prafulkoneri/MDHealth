import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class AddressListRepo {
  Future<http.Response> addresslist(token) async {
    try {
      print(Endpoint.addreddListnew);
      return await http.get(Uri.parse(Endpoint.addreddListnew), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
