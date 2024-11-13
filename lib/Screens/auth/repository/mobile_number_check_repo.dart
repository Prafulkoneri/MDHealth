import 'package:http/http.dart' as http;
import 'package:md_health/Screens/auth/model/mobile_number_exits_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class MobileNumberRepo {
  Future<http.Response> mobileNumber(
      MobileNumberRequestModel requestModel, context) async {
    try {
      return await http.post(Uri.parse(Endpoint.numberCheck),
          body: requestModel.toJson());
    } catch (e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.error);
      throw Exception(e);
    }
  }
}
