import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/auth/model/login_model.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';

class LoginRepository {
  static Future<http.Response> loginUser(LoginRequestModel requestModel, context)async {
    try{
      print(requestModel.toJson());
      return await http.post(Uri.parse(Endpoint.mdCustomerLogin),body: requestModel.toJson());
    }catch(e){
      Utils.showPrimarySnackbar(context, e , type: SnackType.debugError);
      throw Exception();
    }
  }
}