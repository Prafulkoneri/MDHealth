class NotificationSeenResponseModel {
  int? status;
  String? message;
  String? seenStatus;

  NotificationSeenResponseModel({
    required this.status,
    required this.message,
    required this.seenStatus,
  });
  NotificationSeenResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    seenStatus = json["seen_status"];
  }
}
