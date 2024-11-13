import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/package_detail_view_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class PackageDetailViewRepo {
  Future<http.Response> packageDetails(
      PackageDetailViewRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.packageDetailsView));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.packageDetailsView),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
