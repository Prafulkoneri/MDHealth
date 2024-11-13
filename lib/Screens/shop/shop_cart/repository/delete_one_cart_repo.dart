import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_cart/model/one_item_delete_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class DeleteOneCartItemRepo {
  Future<http.Response> deletoneCartitem(
      CardOneItemDeleteRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.deletCartitem));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.deletCartitem),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
