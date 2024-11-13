import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class DietBankListRepo {
  Future<http.Response> dietBankList(token) async {
    try {
      print(Endpoint.bankList);
      return await http.get(Uri.parse(Endpoint.bankList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
