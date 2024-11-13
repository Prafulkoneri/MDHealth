import 'package:http/http.dart' as http;
import 'package:md_health/Screens/favourt/model/hs_remove_package_model.dart';
import 'package:md_health/Screens/favourt/model/remove_fav_packge_model.dart';

import 'dart:developer';

import 'package:md_health/network/end_point.dart';

class HsRemovePackgeFromFavRepo {
  Future<http.Response> hsremovePackgeFromFav(
      HsRemoveFavRequestmodel reqModel, token) async {
    print(reqModel.toJson());
    print(Uri.parse(Endpoint.hsRemovePackage));
    log("${reqModel.toJson()}");

    try {
      return await http.post(Uri.parse(Endpoint.hsRemovePackage),
          body: reqModel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
