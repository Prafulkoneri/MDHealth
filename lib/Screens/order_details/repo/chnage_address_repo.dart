import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/shop_order_change_address_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class ChangeAddressRepo {
  Future<http.Response> chnageAddress(
      ChangeAddresstRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.shopOrderAddressChange));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.shopOrderAddressChange),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
