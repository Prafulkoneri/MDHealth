class MyPackageDetailResponseModelReq {
  String? packageId;
  String? patientId;
  String? purchesId;
  String? type;

  MyPackageDetailResponseModelReq({
    this.packageId,
    this.patientId,
    this.purchesId,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["patient_id"] = patientId;
    data["purchase_id"] = purchesId;
    data["type"] = type;
    return data;
  }
}

class MyPackageDetailResponseModel {
  int? status;
  String? message;
  PatientInformation? patientInformation;
  TreatmentInformation? treatmentInformation;

  MyPackageDetailResponseModel({
    required this.status,
    required this.message,
    required this.patientInformation,
    required this.treatmentInformation,
  });
  MyPackageDetailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    patientInformation = json['PatientInformation'] != null
        ? PatientInformation.fromJson(json['PatientInformation'])
        : null;
    treatmentInformation = json['treatment_information'] != null
        ? TreatmentInformation.fromJson(json['treatment_information'])
        : null;
  }
}

class PatientInformation {
  int? id;
  String? patientFullName;
  String? patientFirstName;
  String? patientLastName;
  String? patientRelation;
  String? patientEmail;
  String? patientContactNo;
  String? cityName;
  String? countryName;

  PatientInformation({
    required this.id,
    required this.patientFullName,
    required this.patientFirstName,
    required this.patientLastName,
    required this.patientRelation,
    required this.patientEmail,
    required this.patientContactNo,
    required this.cityName,
    required this.countryName,
  });
  PatientInformation.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    patientFullName = json["patient_full_name"];
    patientFirstName = json["patient_first_name"];
    patientLastName = json["patient_last_name"];
    patientRelation = json["patient_relation"];
    patientEmail = json["patient_email"];
    patientContactNo = json["patient_contact_no"];
    cityName = json["city_name"];
    countryName = json["country_name"];
  }
}

class TreatmentInformation {
  int? id;
  String? packageUniqueNo;
  String? packageName;
  String? productCategoryName;
  String? productSubCategoryName;
  String? cityNames;
  String? countryNames;
  String? mobileNo;
  String? address;
  String? companyName;

  TreatmentInformation({
    required this.id,
    required this.packageUniqueNo,
    required this.packageName,
    required this.productCategoryName,
    required this.productSubCategoryName,
    required this.cityNames,
    required this.countryNames,
    required this.mobileNo,
    required this.address,
    required this.companyName,
  });
  TreatmentInformation.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageUniqueNo = json["package_unique_no"];
    packageName = json["package_name"];
    productCategoryName = json["product_category_name"];
    productSubCategoryName = json["product_sub_category_name"];
    cityNames = json["city_name"];
    countryNames = json["country_name"];
    mobileNo = json["mobile_no"];
    address = json["company_address"];
    companyName = json["company_name"];
  }
}
