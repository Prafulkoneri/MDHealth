import 'package:http/http.dart' as http;
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class CityListRepository {
  Future<http.Response> getCityList(
      CityListRequestModel requestModel, token) async {
    try {
      return await http.post(Uri.parse(Endpoint.mdCityList),
          body: requestModel.toJson());
    } catch (e) {
      Utils.showPrimarySnackbar(token, e, type: SnackType.error);
      throw Exception(e);
    }
  }
}
