// //////////////////////////////////Request Model//////////////////
// class ChangeAddresstRequestModel {
//   String? address;
//   String? countryId;
//   String? cityId;
//   ChangeAddresstRequestModel({
//     this.address,
//     this.countryId,
//     this.cityId,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data["address"] = address;
//     data["country_id"] = countryId;
//     data["city_id"] = cityId;

//     return data;
//   }
// }
class ChangeAddresstRequestModel {
  String? address;
  String? countryId;
  String? cityId;
  String? oId;
  ChangeAddresstRequestModel({
    this.address,
    this.countryId,
    this.cityId,
    required this.oId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["address"] = address;
    data["country_id"] = countryId;
    data["city_id"] = cityId;
    data['order_id'] = oId;

    return data;
  }
}

class ChangeAddresstResponseModel {
  int? status;
  String? message;

  ChangeAddresstResponseModel({
    required this.status,
    required this.message,
  });

  ChangeAddresstResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
