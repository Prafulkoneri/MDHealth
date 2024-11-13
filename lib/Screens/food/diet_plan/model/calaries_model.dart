class CaloriesResponseModel {
  int? status;
  String? message;
  List<CaloriesData>? caloriesData;

  CaloriesResponseModel({
    required this.status,
    required this.message,
    required this.caloriesData,
  });
  CaloriesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      caloriesData = <CaloriesData>[];
      json["data"].forEach((v) {
        caloriesData!.add(CaloriesData.fromJson(v));
      });
    }
  }
}

class CaloriesData {
  String? caloriesNumber;
  String? calories;

  CaloriesData({
    required this.caloriesNumber,
    required this.calories,
  });
  CaloriesData.fromJson(Map<String, dynamic> json) {
    caloriesNumber = json["calories_number"];
    calories = json["calories"];
  }
}
