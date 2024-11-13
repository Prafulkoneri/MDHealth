import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/hote_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class HotelViewDetailsRepo {
  Future<http.Response> hotelView(HotelRequestMOdel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.acoomodation));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.acoomodation),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
// tourDetails