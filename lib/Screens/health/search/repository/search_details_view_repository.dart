import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/search/model/search_model.dart';
import 'package:md_health/Screens/health/search/model/search_details_model.dart';
import 'package:md_health/network/end_point.dart';

class SearchDetailsViewRepository {
  Future<http.Response> getPackages(
      SearchDetailsListRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.mdPackageViewSearch),
        body: requestModel.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
    } catch (e) {
      print('I am a exception');
      print(e);
      throw Exception();
    }
  }
}
