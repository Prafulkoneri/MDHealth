import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:md_health/Screens/reports/model/report_list_details_model.dart';
import 'package:md_health/network/end_point.dart';

class ReportListDetailsRepo {
  Future<http.Response> reportListDetails(
      ReportListDetailsRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.reportListDetails));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.reportListDetails),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
