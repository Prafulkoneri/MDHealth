class CanceledSearchPackgeRequestModel {
  // String? treatMentName;
  // String? cityName;
  String? packgeName;
  // String? compnyName;

  CanceledSearchPackgeRequestModel({
    // this.treatMentName,
    // this.cityName,
    this.packgeName,
    // this.compnyName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    // data["treatment_name"] = treatMentName;
    // data["city_name"] = cityName;
    data["package_name"] = packgeName;
    // data["company_name"] = compnyName;
    return data;
  }
}
