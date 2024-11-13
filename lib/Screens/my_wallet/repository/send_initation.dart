import 'package:http/http.dart' as http;
import 'package:md_health/Screens/my_wallet/model/send_invite_link_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class sendinitelinkRepo {
  Future<http.Response> sendInvite(
      SendInviteLinkRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.sendInvite));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.sendInvite),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
