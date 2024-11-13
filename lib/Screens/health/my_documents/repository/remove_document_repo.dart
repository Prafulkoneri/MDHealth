import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/my_documents/model/remove_document_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class RemoveDocumentlist {
  Future<http.Response> removeDocument(
      RemoveDocumenbtRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.removeDocument));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.removeDocument),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
