// class CountryListModel {
//   int? status;
//   String? message;
//   List<CountryList>? countryList;

//   CountryListModel({
//     required this.status,
//     required this.message,
//     required this.countryList,
//   });
//   CountryListModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     if (json["data"] != null) {
//       countryList = <CountryList>[];
//       json["data"].forEach((v) {
//         countryList!.add(CountryList.fromJson(v));
//       });
//     }
//   }
// }

// class CountryList {
//   int? id;
//   String? countryName;

//   CountryList({
//     required this.id,
//     required this.countryName,
//   });
//   CountryList.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     countryName = json["country_name"];
//   }
// }

class CountryListModelRequestModel {
  String? searcchCity;
  CountryListModelRequestModel({
    this.searcchCity,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["search"] = searcchCity;

    return data;
  }
}
