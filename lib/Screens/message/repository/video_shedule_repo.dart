import 'package:http/http.dart' as http;
import 'package:md_health/Screens/message/model/videowShedule_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class VideoSheduleRepo {
  Future<http.Response> videoShedule(
      VideowSheduleRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.videoShedule));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.videoShedule),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
