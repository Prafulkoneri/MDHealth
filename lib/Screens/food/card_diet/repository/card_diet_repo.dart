import 'package:http/http.dart' as http;
import 'package:md_health/Screens/food/card_diet/model/card_diet_payment_model.dart';
// import 'package:md_health/diet_plan%20_payment/model/diet_plan_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class DietCardPAymentRepo {
  Future<http.Response> cardDietPaymnet(
      CardDietPaymentRequest reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.mdPaymentDiet));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.mdPaymentDiet),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
