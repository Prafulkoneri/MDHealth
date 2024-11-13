class AccomodationResponseModel {
  String? status;
  String? message;
  List<AddressListData>? addressListData;

  AccomodationResponseModel({
    this.status,
    this.message,
    this.addressListData,
  });
  AccomodationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      addressListData = <AddressListData>[];
      json["data"].forEach((v) {
        addressListData!.add(AddressListData.fromJson(v));
      });
    }
  }
}

class AddressListData {
  int? id;
  String? customerId;
  String? addressName;
  String? address;
  String? postalCode;
  String? phoneNo;

  String? cityName;
  String? countryName;

  AddressListData({
    this.id,
    this.customerId,
    this.addressName,
    this.address,
    this.postalCode,
    this.phoneNo,
    this.cityName,
    this.countryName,
  });
  AddressListData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    customerId = json["customer_id"];
    addressName = json["address_name"];
    address = json["address"];
    postalCode = json["postal_code"];
    phoneNo = json["phone_no"];
    cityName = json["city_name"];
    countryName = json["country_name"];
  }
}
