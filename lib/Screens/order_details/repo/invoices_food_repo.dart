import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/download_invoices_model.dart';
import 'package:md_health/Screens/order_details/model/invoice_food_download_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class FoodDonloadInvoiceRepo {
  Future<http.Response> fooddownloadIn(
      FoodInvoicesdownloadrequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.fooddownloadInvoices));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.fooddownloadInvoices),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
