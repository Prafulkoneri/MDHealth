import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/shop_product_view/model/follw_vendor_model.dart';
// import 'package:md_health/Screens/shop_product_view/model/shop_product_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/unfollow_vendor_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class UNfollowVendorRepo {
  Future<http.Response> unfollowVendor(
      UnfollowVendorRequestmodel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.unfollowVendor));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.unfollowVendor),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
