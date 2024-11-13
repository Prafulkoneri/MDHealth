// import 'dart:convert';

// CountryListModel countryListModelFromJson(String str) =>
//     CountryListModel.fromJson(json.decode(str));

// String countryListModelToJson(CountryListModel data) =>
//     json.encode(data.toJson());

// class CountryListModel {
//   int? status;
//   String? message;
//   List<CountryList>? countryList;
//   // String? country;
//   CountryListModel({
//     this.status,
//     this.message,
//     this.countryList,
//   });

//   factory CountryListModel.fromJson(Map<String, dynamic> json) =>
//       CountryListModel(
//         status: json["status"],
//         message: json["message"],
//         countryList: json["data"] == null
//             ? []
//             : List<CountryList>.from(
//                 json["data"]!.map((x) => CountryList.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": countryList == null
//             ? []
//             : List<dynamic>.from(countryList!.map((x) => x.toJson())),
//       };
// }

// class CountryList {
//   int? id;
//   String? countryName;

//   CountryList({
//     this.id,
//     this.countryName,
//   });

//   factory CountryList.fromJson(Map<String, dynamic> json) => CountryList(
//         id: json["id"],
//         countryName: json["country_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "country_name": countryName,
//       };
// }
class CountryListModel {
  int? status;
  String? message;
  List<CountryList>? countryList;

  CountryListModel({
    required this.status,
    required this.message,
    required this.countryList,
  });
  CountryListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      countryList = <CountryList>[];
      json["data"].forEach((v) {
        countryList!.add(CountryList.fromJson(v));
      });
    }
  }
}

class CountryList {
  int? id;
  String? countryName;

  CountryList({
    required this.id,
    required this.countryName,
  });
  CountryList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    countryName = json["country_name"];
  }
}
