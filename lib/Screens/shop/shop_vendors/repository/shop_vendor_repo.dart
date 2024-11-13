import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_cart/model/one_item_delete_model.dart';
import 'package:md_health/Screens/shop/shop_vendors/model/shop_vendor_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class ShopListVendorRepo {
  Future<http.Response> shopVendor(
      ShopVendorRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.shopVendorproduct));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.shopVendorproduct),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
