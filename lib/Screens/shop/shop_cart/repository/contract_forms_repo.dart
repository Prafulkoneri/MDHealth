import 'package:http/http.dart' as http;
import 'package:md_health/Screens/shop/shop_cart/model/contract_forms_model.dart';
import 'package:md_health/network/end_point.dart';

class ContractFormsRepo {
  Future<http.Response> getContractAndFormsInfo(
      ContractFormsRequestModel reqModel, token) async {
    print(Endpoint.contractAndForms);
    try {
      return await http.post(Uri.parse(Endpoint.contractAndForms),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
