import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class ReportsListRepository {
  Future<http.Response> getReportsList(token) async {
    print(Uri.parse(Endpoint.reportsList));

    try {
      return await http.get(Uri.parse(Endpoint.reportsList), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
