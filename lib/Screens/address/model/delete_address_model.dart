class DeleteAddressResponseModel {
  String? message;
  String? success;

  DeleteAddressResponseModel({
    this.message,
    this.success,
  });
  DeleteAddressResponseModel.fromJson(Map<String, dynamic> json) {
    success = json["status"];
    message = json["message"];
  }
}

/////////////////////////////////////////////////////
class DeleteAddressRequestModel {
  String? id;

  DeleteAddressRequestModel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}
