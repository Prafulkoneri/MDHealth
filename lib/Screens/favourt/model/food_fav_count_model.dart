class MdFoodCountResponseModel {
  int? status;
  String? message;
  int? foodfavouriteCount;

  MdFoodCountResponseModel({
    required this.status,
    required this.message,
    required this.foodfavouriteCount,
  });
  MdFoodCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    foodfavouriteCount = json["favourite_count"];
  }
}
