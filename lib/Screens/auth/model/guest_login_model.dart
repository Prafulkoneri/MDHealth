class GuestLoginResponse {
  int? status;
  String? message;
  SuccessToken? successToken;

  GuestLoginResponse({
    required this.status,
    required this.message,
    required this.successToken,
  });
  GuestLoginResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    successToken = json['success_token'] != null
        ? SuccessToken.fromJson(json['success_token'])
        : null;
  }
}

class SuccessToken {
  String? token;

  SuccessToken({
    required this.token,
  });
  SuccessToken.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }
}

///////////////////////////////////////////
class GuestLoginRequest {
  String? name;
  GuestLoginRequest({
    this.name,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["name"] = name;
    return data;
  }
}
