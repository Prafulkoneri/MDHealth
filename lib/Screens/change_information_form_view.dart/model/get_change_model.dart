class GetChangePatientRequestModel {
  String? packageId;
  String? purchesId;
  String? type;

  GetChangePatientRequestModel({
    this.packageId,
    this.purchesId,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = packageId;
    data["purchase_id"] = purchesId;
    data["type"] = type;
    return data;
  }
}

//////////////////////////////
class GetChangePatientResModel {
  int? status;
  String? message;
  PatientInformation? patientInformation;

  GetChangePatientResModel({
    required this.status,
    required this.message,
    required this.patientInformation,
  });
  GetChangePatientResModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    patientInformation = json['PatientInformation'] != null
        ? PatientInformation.fromJson(json['PatientInformation'])
        : null;
  }
}

class PatientInformation {
  int? patientId;
  String? patientUniqueId;
  int? customerId;
  int? packageId;
  String? patientFullName;
  String? patientBirthDate;
  String? patientLastName;
  String? patientRelation;
  String? patientEmail;
  String? patientContactNo;
  String? countryName;
  String? cityName;
  String? cityId;
  String? countryID;

  PatientInformation({
    required this.patientId,
    required this.patientUniqueId,
    required this.customerId,
    required this.packageId,
    required this.patientFullName,
    required this.patientLastName,
    required this.patientBirthDate,
    required this.patientRelation,
    required this.patientEmail,
    required this.patientContactNo,
    required this.countryName,
    required this.cityName,
    required this.cityId,
    required this.countryID,
  });
  PatientInformation.fromJson(Map<String, dynamic> json) {
    patientId = json["patient_id"];
    patientUniqueId = json["patient_unique_id"];
    customerId = json["customer_id"];
    packageId = json["package_id"];
    patientFullName = json["patient_first_name"];
    patientBirthDate = json["birth_date"];
    patientLastName = json["patient_last_name"];
    patientRelation = json["patient_relation"];
    patientEmail = json["patient_email"];
    patientContactNo = json["patient_contact_no"];
    cityName = json["city_name"];
    countryName = json["country_name"];
    cityId = json["patient_city_id"];
    countryID = json["patient_country_id"];
  }
}
