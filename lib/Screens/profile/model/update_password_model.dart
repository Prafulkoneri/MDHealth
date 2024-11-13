class UpdatePasswordRequestmodel {
  String? newPassword;
  String? rTypePassword;

  UpdatePasswordRequestmodel({
    this.newPassword,
    this.rTypePassword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["new_password"] = newPassword;
    data["retype_new_password"] = rTypePassword;
    return data;
  }
}

////////////////////////////////////////////////////////REQUEST/////////////////
class UpdatePasswordResmodel {
  int? status;
  String? message;

  UpdatePasswordResmodel({
    required this.status,
    required this.message,
  });
  UpdatePasswordResmodel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
