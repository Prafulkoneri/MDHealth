import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/my_details/model/my_detail_model.dart';
import 'package:md_health/Screens/health/packages/model/package_detail_view_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class MyPackageDetailViewRepo {
  Future<http.Response> mypackageDetails(
      MyPackageDetailResponseModelReq reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.myPackageDetailView));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.myPackageDetailView),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
