import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/diet_plan%20_payment/model/diet_plan_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class DietPAymentDetailsRepo {
  Future<http.Response> dietPaymnet(
      DietViewRequestModelPayment reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.foodPayemtDetails));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.foodPayemtDetails),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
