class MobileNumberRequestModel {
  String? mobileNumber;

  MobileNumberRequestModel({
    this.mobileNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["mobile_no"] = mobileNumber;
    return data;
  }
}

///////////////////////////////////////////////////////////////////////////////////////
class MobileNumberResponseModel {
  int? status;
  String? message;

  MobileNumberResponseModel({
    required this.status,
    required this.message,
  });
  MobileNumberResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
