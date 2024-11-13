// import 'dart:convert';

// ChangePasswordResponseModel changePasswordResponseModelFromJson(String str) => ChangePasswordResponseModel.fromJson(json.decode(str));

// String changePasswordResponseModelToJson(ChangePasswordResponseModel data) => json.encode(data.toJson());

// class ChangePasswordResponseModel {
//   int? status;
//   String? message;

//   ChangePasswordResponseModel({
//     this.status,
//     this.message,
//   });

//   factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) => ChangePasswordResponseModel(
//     status: json["status"],
//     message: json["message"],
//   );

//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//   };
// }

// ////////////////////////////////////////////////////////////////////////////////

// ChangePasswordRequestModel changePasswordRequestModelFromJson(String str) => ChangePasswordRequestModel.fromJson(json.decode(str));

// String changePasswordRequestModelToJson(ChangePasswordRequestModel data) => json.encode(data.toJson());

// class ChangePasswordRequestModel {
//   String? newPassword;
//   String? retypeNewPassword;

//   ChangePasswordRequestModel({
//     this.newPassword,
//     this.retypeNewPassword,
//   });

//   factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) => ChangePasswordRequestModel(
//     newPassword: json["new_password"],
//     retypeNewPassword: json["retype_new_password"],
//   );

//   Map<String, dynamic> toJson() => {
//     "new_password": newPassword,
//     "retype_new_password": retypeNewPassword,
//   };
// }
class NChangePasswordRequestModel {
  String? mobileNumber;
  String? newPassword;
  String? reNewPassword;

  NChangePasswordRequestModel({
    this.mobileNumber,
    this.newPassword,
    this.reNewPassword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["password"] = newPassword;
    data["mobile_no"] = mobileNumber;
    data["retype_password"] = reNewPassword;
    return data;
  }
}

//////////////////////////////////////////////
class NewChangePasswordResponseModel {
  int? status;
  String? message;

  NewChangePasswordResponseModel({
    required this.status,
    required this.message,
  });
  NewChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
