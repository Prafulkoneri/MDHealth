import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/packages/model/download_invoices_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class DonloadInvoiceRepo {
  Future<http.Response> downloadIn(
      InvoicesdownloadrequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.downloadInvoices));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.downloadInvoices),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
