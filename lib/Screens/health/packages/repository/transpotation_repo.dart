import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/packages/model/hote_model.dart';
import 'package:md_health/Screens/health/packages/model/transportation_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class TransportationRepo {
  Future<http.Response> transPortation(
      TransportationRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.transportationDetails));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.transportationDetails),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
