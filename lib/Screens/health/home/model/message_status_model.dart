class MessageStatusResponseModel {
  String? status;
  String? readStatus;
  int? unreadMsgCount;

  MessageStatusResponseModel({
    required this.status,
    required this.readStatus,
    required this.unreadMsgCount,
  });

  MessageStatusResponseModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    readStatus = json['read_status'];
    unreadMsgCount = json['unread_messages_count'];
  }

}