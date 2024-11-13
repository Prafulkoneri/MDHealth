import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/transport_notes_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class TransportRepo {
  Future<http.Response> trasnportNoteRepo(
      TransportNOtesRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.transportationNOte));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.transportationNOte),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
