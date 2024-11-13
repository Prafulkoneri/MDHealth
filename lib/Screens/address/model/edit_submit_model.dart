class EditSubmitRequestModel {
  String? addressName;
  String? id;
  String? address;
  String? mobileNo;
  String? countryId;
  String? cityId;
  String? postalCode;
  EditSubmitRequestModel({
    this.id,
    this.addressName,
    this.address,
    this.mobileNo,
    this.countryId,
    this.cityId,
    this.postalCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["address_name"] = addressName;
    data["phone_no"] = mobileNo;
    data["country_id"] = countryId;
    data["city_id"] = cityId;
    data["postal_code"] = postalCode;
    data["address"] = address;
    return data;
  }
}
/////////////////////////////////////////////////////

class EditSubmitResponseModel {
  String? status;
  String? message;

  EditSubmitResponseModel({
    this.status,
    this.message,
  });
  EditSubmitResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
