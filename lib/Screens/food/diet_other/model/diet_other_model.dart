// class DietOtherRequestModel {
//   String? foodpackageId;
//   String? subscriptionType;
//   String? birthDate;
//   String? rpatientFullName;
//   String? rpatientEmail;
//   String? rpatientContactNumber;
//   String? rpatientCountryId;
//   String? rpatientCityId;
//   String? raddress;
//   String? rdiseases;
//   String? rnotes;
//   String? platFormType;
//   String? type;
//   String? postalCode;
//   String? salePrices;
//   String? relationToYou;

//   DietOtherRequestModel({
//     this.foodpackageId,
//     this.subscriptionType,
//     this.birthDate,
//     this.rpatientFullName,
//     this.rpatientEmail,
//     this.rpatientContactNumber,
//     this.rpatientCountryId,
//     this.rpatientCityId,
//     this.raddress,
//     this.rdiseases,
//     this.rnotes,
//     this.platFormType,
//     this.type,
//     this.postalCode,
//     this.salePrices,
//     this.relationToYou,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data["food_package_id"] = foodpackageId;
//     data["subscription_type"] = subscriptionType;
//     data["subscription_start_date"] = birthDate;
//     data["sales_price"] = salePrices;
//     data["gift_person_name"] = rpatientFullName;
//     data["gift_person_email"] = rpatientEmail;
//     data["gift_person_contact_no"] = rpatientContactNumber;
//     data["gift_person_country_id"] = rpatientCountryId;
//     data["gift_person_city_id"] = rpatientCityId;
//     data["address"] = raddress;
//     data["gift_person_diseases"] = rdiseases;
//     data["gift_note"] = rnotes;
//     data["platform_type"] = platFormType;
//     data["postal_code"] = postalCode;
//     data["type"] = type;
//     data["gift_person_relationtoyou"] = relationToYou;
//     return data;
//   }
// }

// ////////////////////////////////////
// class DietOtherResponseModel {
//   int? status;
//   String? message;
//   DietId? dietId;

//   DietOtherResponseModel({
//     required this.status,
//     required this.message,
//     required this.dietId,
//   });
//   DietOtherResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     dietId = json['id'] != null ? DietId.fromJson(json['id']) : null;
//   }
// }

// class DietId {
//   int? patientId;

//   DietId({
//     required this.patientId,
//   });
//   DietId.fromJson(Map<String, dynamic> json) {
//     patientId = json["patient_id"];
//   }
// }
class DietOtherRequestModel {
  String? foodpackageId;
  String? subscriptionType;
  String? birthDate;
  String? rpatientFullName;
  String? rpatientEmail;
  String? rpatientContactNumber;
  String? rpatientCountryId;
  String? rpatientCityId;
  String? raddress;
  String? rdiseases;
  String? rnotes;
  String? platFormType;
  String? type;
  String? postalCode;
  String? salePrices;
  String? relationToYou;

  DietOtherRequestModel({
    this.foodpackageId,
    this.subscriptionType,
    this.birthDate,
    this.rpatientFullName,
    this.rpatientEmail,
    this.rpatientContactNumber,
    this.rpatientCountryId,
    this.rpatientCityId,
    this.raddress,
    this.rdiseases,
    this.rnotes,
    this.platFormType,
    this.type,
    this.postalCode,
    this.salePrices,
    this.relationToYou,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["food_package_id"] = foodpackageId;
    data["subscription_type "] = subscriptionType;
    data["subscription_start_date "] = birthDate;
    data["sales_price "] = salePrices;
    data["gift_person_name"] = rpatientFullName;
    data["gift_person_email"] = rpatientEmail;
    data["gift_person_contact_no"] = rpatientContactNumber;
    data["gift_person_country_id"] = rpatientCountryId;
    data["gift_person_city_id"] = rpatientCityId;
    data["address "] = raddress;
    data["gift_person_diseases"] = rdiseases;
    data["gift_note"] = rnotes;
    data["platform_type"] = platFormType;
    data["postal_code"] = postalCode;
    data["type "] = type;
    data["gift_person_relationtoYou"] = relationToYou;
    return data;
  }
}

////////////////////////////////////
class DietOtherResponseModel {
  int? status;
  String? message;
  DietId? dietId;

  DietOtherResponseModel({
    required this.status,
    required this.message,
    required this.dietId,
  });
  DietOtherResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    dietId = json['id'] != null ? DietId.fromJson(json['id']) : null;
  }
}

class DietId {
  int? patientId;

  DietId({
    required this.patientId,
  });
  DietId.fromJson(Map<String, dynamic> json) {
    patientId = json["patient_id"];
  }
}
