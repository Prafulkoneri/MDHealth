import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class CountryListRepository {
  Future<http.Response> getCountries(context) async {
    try {
      return await http.get(Uri.parse(Endpoint.mdCountryList));
    } catch (e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.error);
      throw Exception(e);
    }
  }
}
