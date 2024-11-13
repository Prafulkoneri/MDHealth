class GetTreatnentListNewResponse {
  int? status;
  String? message;
  List<NewCityList>? newCityList;

  GetTreatnentListNewResponse({
    required this.status,
    required this.message,
    required this.newCityList,
  });
  GetTreatnentListNewResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      newCityList = <NewCityList>[];
      json["data"].forEach((v) {
        newCityList!.add(NewCityList.fromJson(v));
      });
    }
  }
}

class NewCityList {
  int? id;
  String? cityName;

  NewCityList({
    required this.id,
    required this.cityName,
  });
  NewCityList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cityName = json["city_name"];
  }
}
