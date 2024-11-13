import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:md_health/Screens/auth/model/change_password_model.dart';
import 'package:md_health/network/end_point.dart';
// import 'package:md_health/Screens/auth/model/change_password_model.dart';
// import 'package:md_health/network/end_point.dart';
// import 'package:md_health/utils/utils.dart';

// class ChangePasswordRepository {
//   static Future<http.Response> changePassword(
//       ChangePasswordRequestModel requestModel, context) async {
//     try {
//       print(requestModel.toJson());
//       return await http.post(Uri.parse(Endpoint.mdUpdateCustomerPassword),
//           body: requestModel.toJson());
//     } catch (e) {
//       Utils.showPrimarySnackbar(context, e, type: SnackType.error);
//       throw Exception(e);
//     }
//   }
// }

class ChangePasswordRepository {
  Future<http.Response> changePassword(
      NChangePasswordRequestModel reqModel, context) async {
    print(Uri.parse(Endpoint.mdNewForgotPassword));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.mdNewForgotPassword),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $context",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
