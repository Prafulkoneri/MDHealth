import 'dart:io';

class FillFormViewHomeRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? country;
  String? contactNumber;
  String? treatmentName;
  String? priviousTreatment;
  String? details;
  String? whyNeedTreatment;
  String? travelVisa;
  List<File>? selectedFiles;
  FillFormViewHomeRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.country,
    this.treatmentName,
    this.priviousTreatment,
    this.details,
    this.whyNeedTreatment,
    this.travelVisa,
    this.selectedFiles,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["email"] = email;
    data["contact_no"] = contactNumber;
    data["country_id"] = country;
    data["treatment_name_for_request"] = treatmentName;
    data["details"] = details;
    data["why_do_you_need_treatment"] = whyNeedTreatment;
    data["previous_treatment"] = priviousTreatment;
    data["travel_visa"] = travelVisa;
    // data["treatment_image_name[]"] =
    //     selectedFiles?.map((file) => file.path).toList();
    // data["treatment_image_name[]"] =
    //     selectedFiles != null && selectedFiles!.isNotEmpty
    //         ? selectedFiles!.map((file) => file.path).toList()
    //         : [];
    return data;
  }
}

////////////////////////////////RESP{ONSE/////////////////////////////}
class FillFormResponseMOdelView {
  int? status;
  String? message;

  FillFormResponseMOdelView({
    required this.status,
    required this.message,
  });
  FillFormResponseMOdelView.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
