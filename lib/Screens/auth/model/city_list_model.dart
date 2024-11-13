// class CityListRequestModel {
//   String? countryId;

//   CityListRequestModel({
//     this.countryId,
//   });

//   CityListRequestModel.fromJson(Map<String, dynamic> json) {
//     countryId = json["country_id"];
//   }

//   Map<String, dynamic> toJson() => {
//         "country_id": countryId,
//       };
// }
class CityListRequestModel {
  String? countryId;

  CityListRequestModel({
    this.countryId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["country_id"] = countryId;
    return data;
  }
}

///////////////////////////////////////////////////////////////////////////////////////
class CityListResponseModel {
  int? status;
  String? message;
  List<CityListData>? cityList;

  CityListResponseModel({
    required this.status,
    required this.message,
    required this.cityList,
  });
  CityListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      cityList = <CityListData>[];
      json["data"].forEach((v) {
        cityList!.add(CityListData.fromJson(v));
      });
    }
  }
}

class CityListData {
  int? id;
  String? cityName;

  CityListData({
    required this.id,
    required this.cityName,
  });
  CityListData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cityName = json["city_name"];
  }
}

// class CityListResponseModel {
//   int? status;
//   String? message;
  // List<CityListData>? cityList;

//   CityListResponseModel({
//     this.status,
//     this.message,
//     this.cityList,
//   });

//   CityListResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     if (json["data"] != null) {
//       cityList = <CityListData>[];
//       json["data"].forEach((v) {
//         cityList!.add(CityListData.fromJson(v));
//       });
//     }
//   }
// }

// class CityListData {
//   int? id;
//   String? cityName;

//   CityListData({
//     this.id,
//     this.cityName,
//   });

  // CityListData.fromJson(Map<String, dynamic> json) {
  //   id = json["id"];
  //   cityName = json["city_name"];
  // }
// }
