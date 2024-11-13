import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ShopCartCountRepo {
  Future<http.Response> cartCount(token) async {
    print(Uri.parse(Endpoint.cartCountProduct));

    try {
      return await http.get(Uri.parse(Endpoint.cartCountProduct), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
