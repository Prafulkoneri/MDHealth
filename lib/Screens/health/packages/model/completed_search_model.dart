// class CompletedSearchPackgeRequestModel {

//   String? packgeName;

//   CompletedSearchPackgeRequestModel({

//     this.packgeName,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};

//     data["package_name"] = packgeName;
//     return data;
//   }
// }
// /
class CompletedSearchPackgeRequestModel {
  // String? treatMentName;
  // String? cityName;
  String? packgeName;
  // String? compnyName;

  CompletedSearchPackgeRequestModel({
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
