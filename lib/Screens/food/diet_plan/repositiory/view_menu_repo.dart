// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/food/diet_plan/model/view_menu_model.dart';
// import 'package:md_health/network/end_point.dart';

// class MENUDietViewRepo {
//   Future<http.Response> mENUdietView(
//       ViewMenuRequestNModel reqModel, token) async {
//     print(reqModel.toJson());
//     print(Uri.parse(Endpoint.viewMenuClick));
//     log("${reqModel.toJson()}");

//     try {
//       return await http.post(Uri.parse(Endpoint.viewMenuClick),
//           body: reqModel.toJson(),
//           headers: {
//             "Authorization": "Bearer $token",
//           });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
