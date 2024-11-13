import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:md_health/Screens/address/model/add_address_model.dart';
import 'package:md_health/Screens/address/model/edit_list_address_model.dart';
import 'package:md_health/network/end_point.dart';

class EditAddAddressRepo {
  Future<http.Response> editaddAddress(
      EditAddressListRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.editadrressList));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.editadrressList),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
