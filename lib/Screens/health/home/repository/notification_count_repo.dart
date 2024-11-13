import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class NotificationCountRepo {
  Future<http.Response> notifCount(token) async {
    print(Uri.parse(Endpoint.notificatCounts));

    try {
      return await http.get(Uri.parse(Endpoint.notificatCounts), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
