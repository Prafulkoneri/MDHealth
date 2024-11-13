class UserReponseModel {
  int? status;
  String? message;
  String? fullName;

  UserReponseModel({
    required this.status,
    required this.message,
    required this.fullName,
  });
  UserReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    fullName = json["full_name"];
  }
}
