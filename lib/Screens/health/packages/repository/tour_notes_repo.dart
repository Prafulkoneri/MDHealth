import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/tour_notes_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class TourNotesRepo {
  Future<http.Response> notesRepo(TourNOtesRequestModel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.tourNotes));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.tourNotes),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
