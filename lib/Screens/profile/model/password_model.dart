class CheckPasswordExitRequestModel {
  String? password;

  CheckPasswordExitRequestModel({
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["password"] = password;

    return data;
  }
}

////////////////////////////////////Response///////////////////////////
class CheckPasswordExitRespModel {
  int? status;
  String? message;

  CheckPasswordExitRespModel({
    required this.status,
    required this.message,
  });
  CheckPasswordExitRespModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
