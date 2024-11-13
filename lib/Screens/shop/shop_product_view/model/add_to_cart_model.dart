class AddtoCartRequestModel {
  String? productId;
  String? quantity;

  AddtoCartRequestModel({
    this.productId,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["product_id"] = productId;
    data["quantity"] = quantity;
    return data;
  }
}

///////////////////////////////////////////////
class AddtoCartResponseModel {
  int? status;
  String? message;

  AddtoCartResponseModel({
    required this.status,
    required this.message,
  });
  AddtoCartResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
