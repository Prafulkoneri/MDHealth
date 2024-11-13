import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class MessagelistRepo {
  Future<http.Response> messageList(token) async {
    try {
      return await http.get(Uri.parse(Endpoint.getUserConversations), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      Utils.showPrimarySnackbar(token, e, type: SnackType.error);
      throw Exception(e);
    }
  }
}
