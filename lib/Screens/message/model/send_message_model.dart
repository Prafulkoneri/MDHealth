import 'dart:convert';

class SendMessageRequestModel {
  String? senderType;
  String? conversationId;
  String? senderId;
  String? msgImgPath;

  SendMessageRequestModel({
    this.senderType,
    this.conversationId,
    this.senderId,
    this.msgImgPath,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sender_type'] = senderType;
    data['conversation_id'] = conversationId;
    data['senderId'] = senderId;
    data['media'] = msgImgPath;
    // data["media"] = msgImgPath != null ? jsonEncode(msgImgPath) : null;

    return data;
  }
}

class SendMessageResponseModel {
  String? status;
  String? message;
  String? imagenew;

  SendMessageResponseModel({
    this.status,
    this.imagenew,
    this.message,
  });

  SendMessageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // Correct the URL by replacing backslashes and decoding
    imagenew = json['attachment_path'];
  }
}

// class Notification {
//   String? title;
//   String? body;

//   Notification({
//     this.title,
//     this.body,
//   });

//   Notification.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     body = json['body'];
//   }
// }
