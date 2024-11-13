import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/download_invoices_model.dart';
import 'package:md_health/Screens/order_details/model/invoice_food_download_model.dart';
import 'package:md_health/Screens/order_details/model/invoices_hs_dowload_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class HSDonloadInvoiceRepo {
  Future<http.Response> hsdownloadIn(
      HSInvoicesdownloadrequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.hsdownloadInvoices));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.hsdownloadInvoices),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
