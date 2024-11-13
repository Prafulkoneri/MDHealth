import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/payment/model/invoice_model.dart';
import 'package:md_health/network/end_point.dart';

class FoodInvoiceRepo {
  Future<http.Response> getFoodInvoice(
      InvoiceRequestModel reqModel, token) async {
    print(Endpoint.generateFoodInvoice);
    print(reqModel.toJson());

    try {
      return await http.post(Uri.parse(Endpoint.generateFoodInvoice),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
