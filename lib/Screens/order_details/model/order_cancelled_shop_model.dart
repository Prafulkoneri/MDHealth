class OrderCancelledRequestModelShop {
  String? shopOrderId;
  String? cancelledReasom;
  OrderCancelledRequestModelShop({
    this.shopOrderId,
    this.cancelledReasom,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["order_id"] = shopOrderId;
    data["cancellation_reason"] = cancelledReasom;

    return data;
  }
}

class OrderCancelledResponseModelShop {
  int? status;
  String? message;

  OrderCancelledResponseModelShop({
    required this.status,
    required this.message,
  });
  OrderCancelledResponseModelShop.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
