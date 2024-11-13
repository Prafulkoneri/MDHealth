import 'package:md_health/network/end_point.dart';
import 'package:http/http.dart' as http;

class MessageStatusRepo {
  Future<http.Response> getMessageStatus(token) async {
    print(Uri.parse(Endpoint.getCheckMessageStatus));

    try {
      return await http
          .get(Uri.parse(Endpoint.getCheckMessageStatus), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
