// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/shop/shop_payment/model/shop_payment_model.dart';
// import 'package:md_health/network/end_point.dart';

// class PAymentDoneShopRepo {
//   Future<http.Response> paymentDoneShop(
//       ShopPaymentRequestModel requestModel, token) async {
//     log("${requestModel.toJson()}");

//     print(Uri.parse(Endpoint.shopPaymentDone));
//     print(ShopPaymentRequestModel);

//     try {
//       return await http.post(Uri.parse(Endpoint.shopPaymentDone), headers: {
//         "Authorization": "Bearer $token",
//         "Content-Type":
//             "application/json", // Ensure the content type is set to application/json
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_payment/model/shop_payment_model.dart';
import 'package:md_health/network/end_point.dart';

class PaymentDoneShopRepo {
  Future<http.Response> paymentDoneShop(
      ShopPaymentRequestModel requestModel, token) async {
    final uri = Uri.parse(Endpoint.shopPaymentDone);
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };
    final body = jsonEncode(requestModel.toJson());

    log("Request URL: $uri");
    log("Request Headers: $headers");
    log("Request Body: $body");

    try {
      final response = await http.post(uri, headers: headers, body: body);
      log("Response Status: ${response.statusCode}");
      log("Response Body: ${response.body}");
      return response;
    } catch (e) {
      throw Exception("Error making request: $e");
    }
  }
}
