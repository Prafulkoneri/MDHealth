import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
import 'package:md_health/network/end_point.dart';

class CalculationRepo {
  Future<http.Response> calcluationprice(
      CalculationRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.calculationPurches));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.calculationPurches),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
