import 'package:http/http.dart' as http;
import 'package:md_health/Screens/auth/model/guest_login_model.dart';
import 'package:md_health/network/end_point.dart';

class CustomerGuestLoginInRepo {
  Future<http.Response> customerGuestLoginIn(
      GuestLoginRequest requestModel) async {
    print(requestModel.toJson());
    try {
      return await http.post(
        Uri.parse(Endpoint.guestLogin),
        body: requestModel.toJson(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
