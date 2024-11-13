import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class TreatmentListRepository {
  Future<http.Response> getTreatmentList(token) async {
    print(Uri.parse(Endpoint.treatemntList));

    try {
      return await http.get(Uri.parse(Endpoint.treatemntList), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
