import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class NotificationSeenRepo {
  Future<http.Response> notifSeen(token) async {
    print(Uri.parse(Endpoint.notificationSeenStatus));

    try {
      return await http
          .get(Uri.parse(Endpoint.notificationSeenStatus), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
