// import 'package:md_health/Screens/message/model/send_message_model.dart';
// import 'package:md_health/network/end_point.dart';
// import 'package:http/http.dart' as http;

// class SendMessageRepo {
//   Future<http.Response> sendMessage(
//       SendMessageRequestModel reqModel, token) async {
//     print('send msg request model ${reqModel.toJson()}');
//     print('endpoint send msg ${Endpoint.sendMessage}');

//     try {
//       return await http.post(Uri.parse(Endpoint.sendMessage),
//           body: reqModel.toJson(), headers: {"Authorization": "Bearer $token"});
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/message/model/send_message_model.dart';
import 'package:md_health/network/end_point.dart';

class SendMessageRepo {
  Future<http.Response> sendMessage(
      SendMessageRequestModel requestModel, token) async {
    try {
      print(requestModel.toJson());
      return await http.post(
        Uri.parse(Endpoint.sendMessage),
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
