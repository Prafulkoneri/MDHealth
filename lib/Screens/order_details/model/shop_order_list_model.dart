class ShopOrderListResponseModel {
  int? status;
  String? message;
  List<ShopOrderListModel>? shopOrderList;

  ShopOrderListResponseModel({
    required this.status,
    required this.message,
    required this.shopOrderList,
  });
  ShopOrderListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      shopOrderList = <ShopOrderListModel>[];
      json["data"].forEach((v) {
        shopOrderList!.add(ShopOrderListModel.fromJson(v));
      });
    }
  }
}

class ShopOrderListModel {
  String? orderId;
  String? totalPayment;
  int? productCount;
  String? productNames;
  String? orderStatus;
  String? customerName;
  String? productImagePath;

  ShopOrderListModel({
    required this.orderId,
    required this.totalPayment,
    required this.productCount,
    required this.productNames,
    required this.orderStatus,
    required this.customerName,
    required this.productImagePath,
  });
  ShopOrderListModel.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    totalPayment = json["total_payment"];
    productCount = json["product_count"];
    productNames = json["product_names"];
    orderStatus = json["order_status"];
    customerName = json["customer_name"];
    productImagePath = json["product_image_path"];
  }
}
