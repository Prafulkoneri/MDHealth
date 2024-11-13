class CardDecrementRequestModel {
  String? productId;

  CardDecrementRequestModel({
    this.productId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["product_id"] = productId;
    return data;
  }
}

///////////////////////////////////////////////
class CardDecrementResponseModel {
  int? status;
  String? message;
  String? cartTotalPrice;
  String? productPrice;
  String? deliveryChargesTotal;
  String? quantity;

  CardDecrementResponseModel({
    required this.status,
    required this.message,
    required this.cartTotalPrice,
    required this.productPrice,
    required this.deliveryChargesTotal,
    required this.quantity,
  });
  CardDecrementResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    cartTotalPrice = json["cart_total_price"];
    deliveryChargesTotal = json["shipingTotalPrice"];
    quantity = json["quantity"];
    productPrice = json["product_price"];
  }
}
