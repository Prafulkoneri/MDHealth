class AddressAddRequestModel {
  String? addressName;
  String? address;
  String? mobileNo;
  String? countryId;
  String? cityId;
  String? postalCode;

  AddressAddRequestModel({
    this.addressName,
    this.address,
    this.mobileNo,
    this.countryId,
    this.cityId,
    this.postalCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["address_name"] = addressName;
    data["phone_no"] = mobileNo;
    data["country_id"] = countryId;
    data["city_id"] = cityId;
    data["postal_code"] = postalCode;
    data["address"] = address;
    return data;
  }
}

//////////////////////////
class AddressAddResponseModel {
  String? status;
  String? message;

  AddressAddResponseModel({
    this.status,
    this.message,
  });
  AddressAddResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
