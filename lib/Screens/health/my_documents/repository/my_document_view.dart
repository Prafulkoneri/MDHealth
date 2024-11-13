import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/my_documents/model/my_documents_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

// class DocumentListViewRepo {
//   Future<http.Response> documentList(
//       PackageDetailViewRequestModel reqModel, token) async {
//     print(reqModel.toJson());

//     print(Uri.parse(Endpoint.documentList));
//     log("${reqModel.toJson()}");

//     try {
//       return await http.post(Uri.parse(Endpoint.documentList),
//           body: reqModel.toJson(),
//           headers: {
//             "Authorization": "Bearer $token",
//           });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

import 'dart:developer';

class DocumentListViewRepo {
  Future<http.Response> documentList(
      DocumentsRequestListModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.listDocument));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.listDocument),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
