class FoodResponseModel {
  int? status;
  String? message;
  List<FoodList>? foodData;

  FoodResponseModel({
    required this.status,
    required this.message,
    required this.foodData,
  });
  FoodResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      foodData = <FoodList>[];
      json["data"].forEach((v) {
        foodData!.add(FoodList.fromJson(v));
      });
    }
  }
}

class FoodList {
  int? id;
  String? foodType;

  FoodList({
    required this.id,
    required this.foodType,
  });
  FoodList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    foodType = json["food_type"];
  }
}
