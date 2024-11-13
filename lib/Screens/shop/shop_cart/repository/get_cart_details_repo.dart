// import 'package:http/http.dart' as http;
// import 'package:md_health/network/end_point.dart';

// class CartViewRepo {
//   Future<http.Response> cartView(CartDetailsViewRequestModel, token) async {
//     try {
//       print(Endpoint.cartView);
//       return await http.post(Uri.parse(Endpoint.cartView), headers: {
//         "Authorization": "Bearer $token",
//         'Content-Type': 'application/json',
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_cart/model/cart_decrement_model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/cart_view_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class CartViewRepo {
  Future<http.Response> cartView(
      CartDetailsViewRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.cartView));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.cartView),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
