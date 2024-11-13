import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/hs_list_details_model.dart';
import 'package:md_health/Screens/order_details/model/shop_order_change_address_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class HsDetailsRepo {
  Future<http.Response> hsDetails(
      HsOrderListRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.hsorderListdetails));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.hsorderListdetails),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
