class ShopCountResponseModel {
  int? status;
  String? message;
  int? shopOrderCount;
  ShopCountResponseModel({
    required this.status,
    required this.message,
    required this.shopOrderCount,
  });
  ShopCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    shopOrderCount = json["total_orders"];
  }
}
