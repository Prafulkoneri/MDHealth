import 'package:http/http.dart' as http;
import 'package:md_health/Screens/order_details/model/country_search_list_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class CountrySearchRepo {
  Future<http.Response> countrysearch(
      CountryListModelRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.orderCountrySearch));
    log("${reqModel.toJson()}");
    try {
      return await http.post(Uri.parse(Endpoint.orderCountrySearch),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
