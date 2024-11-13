import 'package:http/http.dart' as http;
import 'package:md_health/Screens/home_services/search_details/model/add_to_fav_model.dart';
import 'package:md_health/Screens/home_services/search_details/model/search_details_hS_model.dart';
import 'package:md_health/network/end_point.dart';

class HsAddToFAvRepository {
  Future<http.Response> hsAddfav(
      HsAddFavRequestmodel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.hsAddFav),
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
