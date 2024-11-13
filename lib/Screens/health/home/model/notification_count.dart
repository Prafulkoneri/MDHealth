class NotificationCountResponseModel {
  int? status;
  String? message;
  int? notificationCount;

  NotificationCountResponseModel({
    required this.status,
    required this.message,
    required this.notificationCount,
  });
  NotificationCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    notificationCount = json["notification_count"];
  }
}
