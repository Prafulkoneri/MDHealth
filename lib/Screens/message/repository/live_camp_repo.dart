import 'package:http/http.dart' as http;
import 'package:md_health/Screens/message/model/live_cam_model.dart';
import 'package:md_health/Screens/message/model/videowShedule_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class LiveCallVideo {
  Future<http.Response> mdLivecamview(LiveRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.mdLivecam));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.mdLivecam),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
