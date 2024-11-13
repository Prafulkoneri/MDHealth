import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:md_health/Screens/address/model/add_address_model.dart';
import 'package:md_health/Screens/address/model/delete_address_model.dart';
import 'package:md_health/network/end_point.dart';

class DeleteAddressRepo {
  Future<http.Response> deleteaddress(
      DeleteAddressRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.deleteaddress));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.deleteaddress),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
