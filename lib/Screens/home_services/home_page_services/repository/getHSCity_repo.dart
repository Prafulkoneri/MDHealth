// import 'package:http/http.dart' as http;
// import 'package:md_health/network/end_point.dart';

// class GetHSCityRepo {
//   Future<http.Response> hsCityRepo(token) async {
//     try {
//       print(Endpoint.hsCity);
//       return await http.get(Uri.parse(Endpoint.hsCity), headers: {
//         "Authorization": "Bearer $token",
//         'Content-Type': 'application/json',
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

import 'dart:developer';

import 'package:md_health/Screens/home_services/home_page_services/model/home_services_city_list_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:http/http.dart' as http;

class GetHSCityRepo {
  Future<http.Response> hsCityRepo(HsCityRequestModel reqModel, token) async {
    print(reqModel.toJson());

    print(Uri.parse(Endpoint.hsCity));
    log("${reqModel.toJson()}");

    try {
      return await http
          .post(Uri.parse(Endpoint.hsCity), body: reqModel.toJson(), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
