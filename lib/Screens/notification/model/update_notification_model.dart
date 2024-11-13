class UpdateNotificationResponseModel {
  int? status;
  String? message;

  UpdateNotificationResponseModel({
    this.status,
    this.message,
  });
  UpdateNotificationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
