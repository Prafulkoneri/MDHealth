class ServicesCountResponseModel {
  int? status;
  String? message;
  // List<ServicesCountData>? servicesCountData;
  ServicesCountData? servicesCountData;

  ServicesCountResponseModel({
    this.status,
    this.message,
    this.servicesCountData,
  });
  ServicesCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    servicesCountData =
        json['data'] != null ? ServicesCountData.fromJson(json['data']) : null;
  }
}

class ServicesCountData {
  int? personalcare;
  int? companionship;
  int? mealplanningHousecaring;
  int? privatedutynursingcare;
  int? physicaltherapy;
  int? babysitting;
  int? onlyTreatment;
  int? fullPackage;

  ServicesCountData({
    this.personalcare,
    this.companionship,
    this.mealplanningHousecaring,
    this.privatedutynursingcare,
    this.physicaltherapy,
    this.babysitting,
    this.onlyTreatment,
    this.fullPackage,
  });
  ServicesCountData.fromJson(Map<String, dynamic> json) {
    personalcare = json["personalcare"];
    companionship = json["companionship"];
    mealplanningHousecaring = json["mealplanning&housecaring"];
    privatedutynursingcare = json["privatedutynursingcare"];
    babysitting = json["babysitting"];
    physicaltherapy = json["physicaltherapy"];
    onlyTreatment = json["only_treatment"];
    fullPackage = json["full_package"];
  }
}
