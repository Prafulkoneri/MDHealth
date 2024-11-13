import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/my_documents/model/my_documents_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class UpdateNotificationRepo {
  Future<http.Response> updatenotificationlist(token) async {
    try {
      print(Endpoint.notificationUpdate);
      return await http.get(Uri.parse(Endpoint.notificationUpdate), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
