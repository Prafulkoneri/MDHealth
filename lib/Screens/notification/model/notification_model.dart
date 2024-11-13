class NotificationResponseModel {
  int? status;
  String? message;
  List<NotificationData>? notifications;

  NotificationResponseModel({
    this.status,
    this.message,
    this.notifications,
  });
  NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];

    if (json["notifications"] != null) {
      notifications = <NotificationData>[];
      json["notifications"].forEach((v) {
        notifications!.add(NotificationData.fromJson(v));
      });
    }
  }
}

class NotificationData {
  int? id;
  String? notificationDescription;
  String? readAt;
  String? createdAt;

  NotificationData({
    this.id,
    this.notificationDescription,
    this.readAt,
    this.createdAt,
  });
  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    notificationDescription = json["notification_description"];
    readAt = json["read_at"];
    createdAt = json["created_at"];
  }
}
