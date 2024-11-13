// import 'dart:convert';

// class GetConversationsResponseModel {
//   int? status;
//   String? message;
//   List<Conversation>? conversations;
//   int? userId;
//   String? providerId;
//   String? conversationId;

//   GetConversationsResponseModel({
//     this.status,
//     this.message,
//     this.conversations,
//     this.userId,
//     this.providerId,
//     this.conversationId,
//   });

//   factory GetConversationsResponseModel.fromJson(Map<String, dynamic> json) => GetConversationsResponseModel(
//     status: json["status"],
//     message: json["message"],
//     conversations: json["conversations"] == null ? [] : List<Conversation>.from(json["conversations"]!.map((x) => Conversation.fromJson(x))),
//     userId: json["user_id"],
//     providerId: json["provider_id"],
//     conversationId: json["conversation_id"],
//   );

//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "conversations": conversations == null ? [] : List<dynamic>.from(conversations!.map((x) => x.toJson())),
//     "user_id": userId,
//     "provider_id": providerId,
//     "conversation_id": conversationId,
//   };
// }

// class Conversation {
//   String? writtenBy;
//   String? converstionId;
//   String? logo;
//   bool? latestMessage;
//   bool? isLatestMessage;

//   Conversation({
//     this.writtenBy,
//     this.converstionId,
//     this.logo,
//     this.latestMessage,
//     this.isLatestMessage,
//   });

//   factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
//     writtenBy: json["written_by"],
//     converstionId: json["converstion_id"],
//     logo: json["logo"],
//     latestMessage: json["latest_message"],
//     isLatestMessage: json["is_latest_message"],
//   );

//   Map<String, dynamic> toJson() => {
//     "written_by": writtenBy,
//     "converstion_id": converstionId,
//     "logo": logo,
//     "latest_message": latestMessage,
//     "is_latest_message": isLatestMessage,
//   };
// }
class ConversionListModel {
  int? status;
  String? message;
  int? userId;
  String? providerId;
  String? conversationId;
  List<Conversation>? conversations;

  ConversionListModel({
    required this.status,
    required this.message,
    required this.conversations,
    required this.userId,
    required this.providerId,
    required this.conversationId,
  });
  ConversionListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    userId = json["user_id"];
    providerId = json["provider_id"];
    conversationId = json["conversation_id"];

    if (json["conversations"] != null) {
      conversations = <Conversation>[];
      json["conversations"].forEach((v) {
        conversations!.add(Conversation.fromJson(v));
      });
    }
  }
}

class Conversation {
  String? writtenBy;
  String? converstionId;
  String? providerName;
  String? logo;
  String? latestMessage;
  String? isLatestMessage;
  String? userId;
  String? orderId;
  String? packageUniqueNo;

  Conversation({
    required this.writtenBy,
    required this.converstionId,
    required this.providerName,
    required this.logo,
    required this.latestMessage,
    required this.isLatestMessage,
    required this.userId,
    required this.orderId,
    required this.packageUniqueNo,
  });
  Conversation.fromJson(Map<String, dynamic> json) {
    writtenBy = json["written_by"];
    converstionId = json["converstion_id"];
    providerName = json["provider_name"];
    packageUniqueNo = json["package_unique_no"];
    logo = json["logo"];
    latestMessage = json["latest_message"];
    isLatestMessage = json["is_latest_message"];
    userId = json["user_id"];
    orderId = json["order_id"];
    orderId = json["order_id"];
  }
}
