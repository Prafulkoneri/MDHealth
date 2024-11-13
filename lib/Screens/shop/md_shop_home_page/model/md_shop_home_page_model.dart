class ShopHomeResmodel {
  int? status;
  String? message;
  List<FeaturedProduct>? featuredProducts;

  ShopHomeResmodel({
    required this.status,
    required this.message,
    required this.featuredProducts,
  });
  ShopHomeResmodel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["featured_products"] != null) {
      featuredProducts = <FeaturedProduct>[];
      json["featured_products"].forEach((v) {
        featuredProducts!.add(FeaturedProduct.fromJson(v));
      });
    }
  }
}

class FeaturedProduct {
  int? id;
  String? productUniqueId;
  String? productName;
  String? productImage;
  String? freeShipping;
  String? salePrice;
  String? status;
  String? verification;
  String? featuredStatus;
  String? shippingFee;
  String? favouriteStatus;

  FeaturedProduct({
    required this.id,
    required this.productUniqueId,
    required this.productName,
    required this.productImage,
    required this.freeShipping,
    required this.salePrice,
    required this.status,
    required this.verification,
    required this.featuredStatus,
    required this.favouriteStatus,
  });
  FeaturedProduct.fromJson(Map<String, dynamic> json) {
    productUniqueId = json["product_unique_id"];
    productName = json["product_name"];
    id = json["id"];
    productImage = json["product_image"];
    freeShipping = json["free_shipping"];
    salePrice = json["sale_price"];
    status = json["status"];
    verification = json["verified"];
    featuredStatus = json["featured_status"];
    shippingFee = json["shipping_fee"];
    shippingFee = json["shipping_fee"];
    favouriteStatus = json["is_favourite"];
  }
}
