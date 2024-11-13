class UpdateChangeRequestModel {
  String? packageId;
  String? purchesId;
  String? patientId;
  String? patientFullName;
  String? patientBirthDate;
  String? patientLastName;
  String? patientRelation;
  String? patientEmail;
  String? patientContactNumber;
  String? patientCountryId;
  String? patientCityId;
  String? packageBuyFor;
  String? platFormType;
  String? type;

  UpdateChangeRequestModel({
    this.packageId,
    this.purchesId,
    this.patientFullName,
    this.patientBirthDate,
    this.patientLastName,
    this.patientRelation,
    this.patientEmail,
    this.patientContactNumber,
    this.patientCountryId,
    this.patientCityId,
    this.packageBuyFor,
    this.platFormType,
    this.patientId,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["purchase_id"] = purchesId;
    data["patient_id"] = patientId;
    data["patient_first_name"] = patientFullName;
    data["patient_last_name"] = patientLastName;
    data["birth_date"] = patientBirthDate;
    data["patient_relation"] = patientRelation;
    data["patient_email"] = patientEmail;
    data["patient_contact_no"] = patientContactNumber;
    data["patient_country_id"] = patientCountryId;
    data["patient_city_id"] = patientCityId;
    data["package_buy_for"] = packageBuyFor;
    data["platform_type"] = platFormType;
    data["type"] = type;
    return data;
  }
}

////////////////////////////////////
class UpdateChanmgeInforamtionResmodel {
  int? status;
  String? message;

  UpdateChanmgeInforamtionResmodel({
    required this.status,
    required this.message,
  });
  UpdateChanmgeInforamtionResmodel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
