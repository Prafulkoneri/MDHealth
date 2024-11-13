import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/search/model/add_to_favrt_model.dart';
import 'package:md_health/network/end_point.dart';

class AddToFavRepo {
  Future<http.Response> addAFav(
      AddToFavModelRequest requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.addTofav),
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
