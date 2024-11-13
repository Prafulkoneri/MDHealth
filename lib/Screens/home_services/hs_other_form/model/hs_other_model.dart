class HsOtherFormRequestModel {
  String? packageId;
  String? patientFirstName;
  String? patientLastName;
  String? patientRelation;
  String? patientEmail;
  String? patientContactNumber;
  String? patientCountryId;
  String? patientCityId;
  String? platFormType;
  String? patientId;
  String? patientBirthdate;
  String? packagebuyfor;

  HsOtherFormRequestModel({
    required this.packageId,
    required this.patientFirstName,
    required this.patientLastName,
    required this.patientRelation,
    required this.patientEmail,
    required this.patientContactNumber,
    required this.patientCountryId,
    required this.patientCityId,
    required this.platFormType,
    required this.patientBirthdate,
    required this.packagebuyfor,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId; //
    data["patient_first_name"] = patientFirstName;
    data["patient_last_name"] = patientLastName;
    data["patient_relation"] = patientRelation; //
    data["patient_email"] = patientEmail;
    data["patient_contact_no"] = patientContactNumber; //
    data["patient_country_id"] = patientCountryId; //
    data["patient_city_id"] = patientCityId; //
    data["platform_type"] = platFormType; //
    data["birth_date"] = patientBirthdate; //
    data["package_buy_for"] = packagebuyfor; //
    return data;
  }
}

////////////////////////////////////
class HsOtherFormResponseModel {
  int? status;
  String? message;
  int? patientId;

  HsOtherFormResponseModel({
    required this.status,
    required this.message,
    required this.patientId,
  });
  HsOtherFormResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    patientId = json["patient_id"];
  }
}
