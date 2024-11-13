// class EditAddressListRequestModel {
//   String? id;

//   EditAddressListRequestModel({
//     this.id,
//   });
//   EditAddressListRequestModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//   }
// }
class EditAddressListRequestModel {
  // String? addressName;
  String? id;
  // String? address;
  // String? mobileNo;
  // String? countryId;
  // String? cityId;
  // String? postalCode;
  EditAddressListRequestModel({
    this.id,
    // this.addressName,
    // this.address,
    // this.mobileNo,
    // this.countryId,
    // this.cityId,
    // this.postalCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    // data["address_name"] = addressName;
    // data["phone_no"] = mobileNo;
    // data["country_id"] = countryId;
    // data["city_id"] = cityId;
    // data["postal_code"] = postalCode;
    // data["address"] = address;
    return data;
  }
}

///////////////////
// class EditaddressListResponeModel {
// String? addressName;
// String? address;
// String? mobileNo;
// String? countryId;
// String? cityId;
// String? postalCode;

//   EditaddressListResponeModel({
// this.addressName,
// this.address,
// this.mobileNo,
// this.countryId,
// this.cityId,
// this.postalCode,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
// data["address_name"] = addressName;
// data["phone_no"] = mobileNo;
// data["country_id"] = countryId;
// data["city_id"] = cityId;
// data["postal_code"] = postalCode;
// data["address"] = address;
//     return data;
//   }
// }

class EditaddressListResponeModel {
  String? status;
  String? message;
  EditAddressListData? editaddresslistdata;

  EditaddressListResponeModel({
    this.status,
    this.message,
    this.editaddresslistdata,
  });
  EditaddressListResponeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    editaddresslistdata = json['data'] != null
        ? EditAddressListData.fromJson(json['data'])
        : null;
  }
}

class EditAddressListData {
  int? id;
  String? customerId;
  String? addressName;
  String? address;

  String? postalCode;
  String? phoneNo;

  String? cityName;
  String? countryName;

  EditAddressListData({
    required this.id,
    required this.customerId,
    required this.addressName,
    required this.address,
    required this.postalCode,
    required this.phoneNo,
    required this.cityName,
    required this.countryName,
  });
  EditAddressListData.fromJson(Map<String, dynamic> json) {
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
