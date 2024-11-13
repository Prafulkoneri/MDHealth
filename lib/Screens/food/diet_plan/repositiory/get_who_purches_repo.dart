import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/diet_plan/model/get_who-purchase_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/view_menu_model.dart';
import 'package:md_health/network/end_point.dart';

class GetwhoPurchaseRepo {
  Future<http.Response> whopurchase(
      GetWhoPurchaseRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.getwhoPurchase));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.getwhoPurchase),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
