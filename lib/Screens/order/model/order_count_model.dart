class OrderCountResponseModel {
  int? status;
  String? message;
  int? orderCount;
  OrderCountResponseModel({
    required this.status,
    required this.message,
    required this.orderCount,
  });
  OrderCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderCount = json["order_count"];
  }
}
