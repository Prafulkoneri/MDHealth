class RegistrationRequestModel {
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? email;
  String? password;
  String? countryId;
  String? cityId;
  String? gender;
  String? birthDate;
  String? address;
  String? platformType;
  String? postalCode; // remove postal code from here if removed from website registration


  RegistrationRequestModel({
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.email,
    this.password,
    this.countryId,
    this.cityId,
    this.birthDate,
    this.gender,
    this.address,
    this.platformType,
    this.postalCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["phone"] = mobileNo;
    data["email"] = email;
    data["password"] = password;
    data["country_id"] = countryId;
    data["city_id"] = cityId;
    data["gender"] = gender;
    data["address"] = address;
    data["platform_type"] = platformType;
    data["date_of_birth"] = birthDate;
    data['postal_code'] = postalCode;
    return data;
  }
}

////////////////////////////////////////////////////////////////////////////////
class RegistrationResponseModel {
  int? status;
  String? message;
  RegistrationData? registrationdata;

  RegistrationResponseModel({
    required this.status,
    required this.message,
    required this.registrationdata,
  });
  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    // data = json['data'] != null ? Data.fromJson(json['data']) : null;
    registrationdata =
        json['data'] != null ? RegistrationData.fromJson(json['data']) : null;
  }
}

class RegistrationData {
  int? id;
  String? accessToken;

  RegistrationData({
    required this.id,
    required this.accessToken,
  });

  RegistrationData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    accessToken = json["access_token"];
  }
}
