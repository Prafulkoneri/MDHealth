// class CardIncrementRequestModel {
//   String? productId;

//   CardIncrementRequestModel({
//     this.productId,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data["product_id"] = productId;
//     return data;
//   }
// }

// ///////////////////////////////////////////////
// class CardIncrementResponseModel {
//   int? status;
//   String? message;
//   int? cartTotalPrice;
//   int? productPrice;
//   int? shipingTotalPrice;
//   String? quantity;

//   CardIncrementResponseModel({
//     required this.status,
//     required this.message,
//     required this.cartTotalPrice,
//     required this.productPrice,
//     required this.shipingTotalPrice,
//     required this.quantity,
//   });
//   CardIncrementResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     cartTotalPrice = json["cart_total_price"];
//     quantity = json["quantity"];
//     productPrice = json["product_price"];
//     shipingTotalPrice = json["shipingTotalPrice"];
//   }
// }
class CardIncrementRequestModel {
  String? productId;

  CardIncrementRequestModel({
    this.productId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["product_id"] = productId;
    return data;
  }
}

class CardIncrementResponseModel {
  int? status;
  String? message;
  String? cartTotalPrice;
  String? productPrice;
  String? deliveryChargesTotal;
  String? quantity;

  CardIncrementResponseModel({
    required this.status,
    required this.message,
    required this.cartTotalPrice,
    required this.productPrice,
    required this.deliveryChargesTotal,
    required this.quantity,
  });

  CardIncrementResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    cartTotalPrice = json["cart_total_price"];
    deliveryChargesTotal = json["shipingTotalPrice"];
    quantity = json["quantity"];
    productPrice = json["product_price"];
  }
}
