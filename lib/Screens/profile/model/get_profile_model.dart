class GetProfileModel {
  int? status;
  String? message;
  AccountDetails? accountDetails;
  List<Country>? countries;
  // List<City>? cities;

  GetProfileModel({
    required this.status,
    required this.message,
    required this.accountDetails,
    required this.countries,
    // required this.cities,
  });
  GetProfileModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    accountDetails = json['account_details'] != null
        ? AccountDetails.fromJson(json['account_details'])
        : null;
    /////////////////////
    if (json["countries"] != null) {
      countries = <Country>[];
      json["countries"].forEach((v) {
        countries!.add(Country.fromJson(v));
      });
    }
    // if (json["cities"] != null) {
    //   cities = <City>[];
    //   json["cities"].forEach((v) {
    //     cities!.add(City.fromJson(v));
    //   });
    // }
  }
}

class AccountDetails {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phone;
  String? gender;
  String? birthDate;
  // String? cityName;
  String? countryId;
  String? cityId;
  String? address;
  String? password;

  AccountDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthDate,
    // required this.cityName,
    required this.countryId,
    required this.cityId,
    required this.address,
    required this.password,
  });
  AccountDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    fullName = json["full_name"];
    email = json["email"];
    phone = json["phone"];
    gender = json["gender"];
    birthDate = json["date_of_birth"];
    // cityName = json["city_name"];
    countryId = json["country_name"];
    cityId = json["city_name"];
    address = json["address"];
    password = json["password"];
  }
}

// class City {
//   int? id;
//   String? cityName;

//   City({
//     required this.id,
//     required this.cityName,
//   });
//   City.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     cityName = json["city_name"];
//   }
// }

class Country {
  int? id;
  String? countryName;

  Country({
    required this.id,
    required this.countryName,
  });
  Country.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    countryName = json["country_name"];
  }
}
