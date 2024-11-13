// class LiveConvertionListResponseModel {
//   String? status;
//   String? message;
//   List<LiveConverTionList>? lisveConvertionList;

//   LiveConvertionListResponseModel({
//     required this.status,
//     required this.message,
//     required this.lisveConvertionList,
//   });
// LiveConvertionListResponseModel.fromJson(Map<String, dynamic> json) {
//   status = json["status"];
//   message = json["message"];
//   if (json["data"] != null) {
//     lisveConvertionList = <LiveConverTionList>[];
//     json["data"].forEach((v) {
//       lisveConvertionList!.add(LiveConverTionList.fromJson(v));
//     });
//   }
// }
// }

// class LiveConverTionList {
//   String? id;
//   String? userId;
//   String? conversationSubject;
//   String? conversationDate;
//   String? conversationId;
//   String? selectedTime;
//   String? roomId;
//   String? conversationName;
//   String? logo;

//   LiveConverTionList({
//     required this.id,
//     required this.userId,
//     required this.conversationSubject,
//     required this.conversationDate,
//     required this.conversationId,
//     required this.selectedTime,
//     required this.roomId,
//     required this.conversationName,
//     required this.logo,
//   });
// LiveConverTionList.fromJson(Map<String, dynamic> json) {
//   id = json["id"];
//   userId = json["user_id"];
//   logo = json["logo"];
//   conversationSubject = json["conversation_subject"];
//   conversationDate = json["conversation_date"];
//   conversationId = json["conversation_id"];
//   selectedTime = json["selected_time"];
//   roomId = json["room_id"];
//   conversationName = json["conversation_name"];
// }
// }
class LiveConvertionListResponseModel {
  String? status;
  String? message;
  List<LiveConverTionList>? lisveConvertionList;
  LiveConvertionListResponseModel({
    required this.status,
    required this.message,
    required this.lisveConvertionList,
  });
  LiveConvertionListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      lisveConvertionList = <LiveConverTionList>[];
      json["data"].forEach((v) {
        lisveConvertionList!.add(LiveConverTionList.fromJson(v));
      });
    }
  }
}

class LiveConverTionList {
  String? userId;
  String? providerId;
  String? conversationSubject;
  String? conversationDate;
  String? conversationName;
  String? conversationId;
  String? roomId;
  String? logo;

  LiveConverTionList({
    required this.userId,
    required this.providerId,
    required this.conversationSubject,
    required this.conversationDate,
    required this.conversationName,
    required this.conversationId,
    required this.roomId,
    required this.logo,
  });
  LiveConverTionList.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    logo = json["logo"];
    conversationSubject = json["conversation_subject"];
    conversationDate = json["conversation_date"];
    conversationId = json["conversation_id"];
    roomId = json["room_id"];
    conversationName = json["conversation_name"];
  }
}
