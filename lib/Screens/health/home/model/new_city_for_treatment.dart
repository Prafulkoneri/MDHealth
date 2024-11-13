class NewCityForRequestModel {
  String? treatmentName;

  NewCityForRequestModel({
    this.treatmentName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["treatment_name"] = treatmentName;

    return data;
  }
}
