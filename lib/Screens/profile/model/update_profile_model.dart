class GetProfileRequestModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? email;
  String? phone;
  String? countryId;
  String? cityId;
  String? address;

  GetProfileRequestModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.email,
    this.phone,
    this.countryId,
    this.cityId,
    this.address,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["email"] = email;
    data["gender"] = gender;
    data["date_of_birth"] = birthDate;
    data["phone"] = phone;
    data["country_id"] = countryId;
    data["city_id"] = cityId;
    data["address"] = address;
    return data;
  }
}

////////////////////////////////RESP{ONSE/////////////////////////////}
class GetProfileResponseModel {
  int? status;
  String? message;

  GetProfileResponseModel({
    required this.status,
    required this.message,
  });
  GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
