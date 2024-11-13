import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/my_documents/model/upload_document_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class UploadDocumentRepo {
  Future<http.Response> documentUpload(
      UploadDocumentsRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.uploadDocument));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.uploadDocument),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
