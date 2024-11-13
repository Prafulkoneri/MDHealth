class GetHomeSerivesCityList {
  String? status;
  String? message;
  List<HomeListCityData>? homesCitydata;

  GetHomeSerivesCityList({
    this.status,
    this.message,
    this.homesCitydata,
  });
  GetHomeSerivesCityList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json["data"] != null) {
      homesCitydata = <HomeListCityData>[];
      json["data"].forEach((v) {
        homesCitydata!.add(HomeListCityData.fromJson(v));
      });
    }
  }
}

class HomeListCityData {
  String? id;
  String? cityName;

  HomeListCityData({
    this.id,
    this.cityName,
  });
  HomeListCityData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cityName = json["city_name"];
  }
}

///////////////////////////////////
class HsCityRequestModel {
  String? servicesName;

  HsCityRequestModel({
    this.servicesName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["home_service_name"] = servicesName;

    return data;
  }
}
