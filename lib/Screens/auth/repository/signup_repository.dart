import 'package:http/http.dart' as http;
import 'package:md_health/Screens/auth/model/signup_response_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class SignupRepository {
  Future<http.Response> registration(
      RegistrationRequestModel reqModel, context) async {
    try {
      print(reqModel.toJson());
      return await http.post(Uri.parse(Endpoint.mdCustomerRegister),
          body: reqModel.toJson());
    } catch (e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.error);
      throw Exception(e);
    }
  }
}
