import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class UserAppoinmnetrepo {
  Future<http.Response> appoinmentList(token) async {
    try {
      return await http.get(Uri.parse(Endpoint.userLiveappoinment), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      Utils.showPrimarySnackbar(token, e, type: SnackType.error);
      throw Exception(e);
    }
  }
}
