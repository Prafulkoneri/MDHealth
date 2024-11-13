// // import 'package:http/http.dart' as http;
// // import 'package:md_health/Screens/shop/shop_product_list/model/shop_product_list_model.dart';
// // import 'dart:developer';
// // import 'package:md_health/network/end_point.dart';

// // class ShopProductLIstRepo {
// //   Future<http.Response> shopProductLisst(
// //       ShopProductListRequestModel reqModel, token) async {
// //     print(reqModel.toJson());

// //     print(Uri.parse(Endpoint.shopProductList));
// //     log("${reqModel.toJson()}");
// //     try {
// //       return await http.post(Uri.parse(Endpoint.shopProductList),
// //           body: reqModel.toJson(),
// //           headers: {
// //             "Authorization": "Bearer $token",
// //           });
// //     } catch (e) {
// //       throw Exception(e);
// //     }
// //   }
// // }
// import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/shop/shop_product_list/model/shop_product_list_model.dart';

// import 'dart:developer';

// import 'package:md_health/network/end_point.dart';

// class ShopProductLIstRepo {
//   Future<http.Response> shopProductLisst(
//       ShopProductListRequestModel reqModel, token) async {
//     print(reqModel.toJson());

//     print(Uri.parse(Endpoint.shopProductList));
//     log("${reqModel.toJson()}");

//     try {
//       return await http.post(Uri.parse(Endpoint.shopProductList),
//           body: reqModel.toJson(),
//           headers: {
//             "Authorization": "Bearer $token",
//           });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/search/model/search_model.dart';
import 'package:md_health/Screens/shop/shop_product_list/model/shop_product_list_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class ShopProductLIstRepo {
  Future<http.Response> productsshop(
      ShopProductListRequestModel requestModel, token) async {
    try {
      print('request model ***************************** ');
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.shopProductList),
        body: requestModel.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("I am an Excdwsasfeption");
      throw Exception(e);
    }
  }
}
