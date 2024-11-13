import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/md_shop_home_page/model/sub_categories_model.dart';
import 'package:md_health/network/end_point.dart';

class SubCategoriesRepo {
  Future<http.Response> getSubCategories(
      SubCategoriesRequestModel reqModel, token) async {
    try {
      print(Endpoint.shopGetSubCategories);
      return await http.post(Uri.parse(Endpoint.shopGetSubCategories),
          // body: reqModel.toJson(),
          body: jsonEncode(reqModel),
          headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json',
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
