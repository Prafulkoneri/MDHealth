import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  int? status;
  String? message;
  String? mobileNumber;
  String? fullName;
  SuccessToken? successToken;

  LoginResponseModel({
    this.status,
    this.message,
    this.mobileNumber,
    this.fullName,
    this.successToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        message: json["message"],
        mobileNumber: json["mobile_number"],
        fullName: json["full_name"],
        successToken: json["success_token"] == null
            ? null
            : SuccessToken.fromJson(json["success_token"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "mobile_number": mobileNumber,
        "full_name": fullName,
        "success_token": successToken?.toJson(),
      };
}

class SuccessToken {
  String? token;

  SuccessToken({
    this.token,
  });

  factory SuccessToken.fromJson(Map<String, dynamic> json) => SuccessToken(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

///////////////////////////////////////////////////////////////////////////////////////

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  String? phone;
  String? platformType;
  String? password;
  String? fcmToken;

  LoginRequestModel({
    this.phone,
    this.password,
    this.platformType,
    this.fcmToken,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        phone: json["phone"],
        password: json["password"],
        platformType: json["platform_type"],
        fcmToken: json["fcm_token"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
        "platform_type": platformType,
        "fcm_token": fcmToken,
      };
}
