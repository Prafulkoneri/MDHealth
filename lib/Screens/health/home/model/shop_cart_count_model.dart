class ShopCartCountModel {
  int? status;
  String? message;
  int? cartCount;

  ShopCartCountModel({
    required this.status,
    required this.message,
    required this.cartCount,
  });
  ShopCartCountModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    cartCount = json["cart_count"];
  }
}
