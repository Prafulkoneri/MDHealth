import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:md_health/Screens/address/model/add_address_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

// class AddAddressRepo {
//   Future<http.Response> addAddress(
//       AddressAddRequestModel reqModel,) async {
//     try {
//       print(reqModel.toJson());
//       return await http.post(Uri.parse(Endpoint.addnewAddress),
//           body: reqModel.toJson());
//     } catch (e) {
//       Utils.showPrimarySnackbar(, e, type: SnackType.error);
//       throw Exception(e);
//     }
//   }
// }
// class AddAddressRepo {
//   Future<http.Response> addAddress(
//       AddressAddRequestModel reqModel, token) async {
//     try {
//       print(Endpoint.addnewAddress);
//       return await http.post(Uri.parse(Endpoint.addnewAddress), headers: {
//         "Authorization": "Bearer $token",
//         'Content-Type': 'application/json',
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

class AddAddressRepo {
  Future<http.Response> addAddress(
      AddressAddRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.addnewAddress));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.addnewAddress),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
