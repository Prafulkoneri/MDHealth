// import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/shop_product_view/model/shop_product_model.dart';
// import 'package:md_health/Screens/shop_product_view/model/shop_rating_model.dart';

// import 'dart:developer';

// import 'package:md_health/network/end_point.dart';

// class FollowVendorRepo {
//   Future<http.Response> followVendor(
//       ShopProductRevieeewRequestModel reqModel, token) async {
//     print(reqModel.toJson());

//     print(Uri.parse(Endpoint.shopProductReviewList));
//     log("${reqModel.toJson()}");

//     try {
//       return await http.post(Uri.parse(Endpoint.shopProductReviewList),
//           body: reqModel.toJson(),
//           headers: {
//             "Authorization": "Bearer $token",
//           });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_product_view/model/follw_vendor_model.dart';
// import 'package:md_health/Screens/shop/shop_product_view/model/shop_product_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class FollowVendorRepo {
  Future<http.Response> followVendor(
      FollowVendorRequestmodel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.followVendor));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.followVendor),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
