class ShopAddReviewNewRequestModel {
  String? orderId;
  String? feedback;
  String? rating;
  String? recommendation;
  String? productId;

  ShopAddReviewNewRequestModel(
      {this.orderId,
      this.productId,
      this.rating,
      this.recommendation,
      this.feedback});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['rating'] = rating;
    data['recommendation'] = recommendation;
    data['feedback'] = feedback;
    return data;
  }
}

///////////////////////////////////////////////////////////////
class ShopAddReviewNewResponseModel {
  int? status;
  String? message;

  ShopAddReviewNewResponseModel({this.status, this.message});

  ShopAddReviewNewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
