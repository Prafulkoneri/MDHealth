import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class MdCoinRepo {
  Future<http.Response> mdCoinWallet(token) async {
    try {
      print(Endpoint.walletCoin);
      return await http.get(Uri.parse(Endpoint.walletCoin), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
