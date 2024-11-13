class InformationRequestModel {
  String? packageId;
  String? birthDate;
  String? patientFullName;
  String? patientRelation;
  String? patientEmail;
  String? patientContactNumber;
  String? patientCountryId;
  String? patientCityId;
  String? packageBuyFor;
  String? platFormType;
  String? patientLastName;

  InformationRequestModel({
    this.packageId,
    this.birthDate,
    this.patientFullName,
    this.patientRelation,
    this.patientEmail,
    this.patientContactNumber,
    this.patientCountryId,
    this.patientCityId,
    this.packageBuyFor,
    this.platFormType,
    this.patientLastName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["birth_date"] = birthDate;
    data["patient_first_name"] = patientFullName;
    data["patient_relation"] = patientRelation;
    data["patient_email"] = patientEmail;
    data["patient_contact_no"] = patientContactNumber;
    data["patient_country_id"] = patientCountryId;
    data["patient_city_id"] = patientCityId;
    data["package_buy_for"] = packageBuyFor;
    data["platform_type"] = platFormType;
    data["patient_last_name"] = patientLastName;
    return data;
  }
}

////////////////////////////////////

class InformationResponseModel {
  int? status;
  String? message;
  Id? idpatientId;

  InformationResponseModel({
    required this.status,
    required this.message,
    required this.idpatientId,
  });
  InformationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    idpatientId = json['id'] != null ? Id.fromJson(json['id']) : null;
  }
}

class Id {
  int? patientId;

  Id({
    required this.patientId,
  });
  Id.fromJson(Map<String, dynamic> json) {
    patientId = json["patient_id"];
  }
}
