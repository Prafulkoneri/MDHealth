import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/my_documents/model/my_documents_model.dart';
import 'dart:developer';
import 'package:md_health/network/end_point.dart';

class NotificationRepo {
  Future<http.Response> notificationlist(token) async {
    try {
      print(Endpoint.notificaationList);
      return await http.get(Uri.parse(Endpoint.notificaationList), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
