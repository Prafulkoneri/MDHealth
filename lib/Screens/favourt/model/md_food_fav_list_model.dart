class FoodFavListResponseModel {
  int? status;
  String? message;
  List<FoodFavListData>? foodFavListdata;

  FoodFavListResponseModel({
    required this.status,
    required this.message,
    required this.foodFavListdata,
  });
  FoodFavListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      foodFavListdata = <FoodFavListData>[];
      json["data"].forEach((v) {
        foodFavListdata!.add(FoodFavListData.fromJson(v));
      });
    }
  }
}

class FoodFavListData {
  int? id;
  String? treatmentPeriodInDays;
  String? treatmentName;
  String? cityName;
  String? packageName;
  String? packagePrice;
  int? packageId;

  FoodFavListData({
    required this.id,
    required this.treatmentPeriodInDays,
    required this.treatmentName,
    required this.cityName,
    required this.packageName,
    required this.packagePrice,
    required this.packageId,
  });
  FoodFavListData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
    treatmentName = json["treatment_name"];
    cityName = json["city_name"];
    packageName = json["package_name"];
    packagePrice = json["package_price"];
    packageId = json["package_id"];
  }
}
