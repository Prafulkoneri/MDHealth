import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class GetInviteLink {
  Future<http.Response> inviteLink(token) async {
    try {
      print(Endpoint.getInvitelink);
      return await http.get(Uri.parse(Endpoint.getInvitelink), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
