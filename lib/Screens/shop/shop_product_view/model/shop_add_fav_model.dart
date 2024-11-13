class ShopProductAddToFavRequestModel {
  String? productId;
  String? shopType;

  ShopProductAddToFavRequestModel({
    this.productId,
    this.shopType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["product_id"] = productId;
    data["shop_type"] = shopType;
    return data;
  }
}

///////////////////////////////////////////////////
class ShopProductAddToFavResponseModel {
  String? status;
  String? favStatus;
  String? message;

  ShopProductAddToFavResponseModel({
    required this.status,
    required this.favStatus,
    required this.message,
  });
  ShopProductAddToFavResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    favStatus = json["fav_status"];
    message = json["message"];
  }
}
