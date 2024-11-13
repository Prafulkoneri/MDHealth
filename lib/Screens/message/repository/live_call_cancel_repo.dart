import 'package:http/http.dart' as http;
import 'package:md_health/Screens/message/model/liveCall_cancelled_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class CancelledLiveCallVideo {
  Future<http.Response> cancelledMdLivecamview(
      CaLiveRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.mdLiveCancel));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.mdLiveCancel),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
