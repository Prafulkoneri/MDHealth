class ShopOwnerBannerResponseMOdel {
  int? status;
  String? message;
  SuperFeaturedProduct? superFeaturedProduct;

  ShopOwnerBannerResponseMOdel({
    required this.status,
    required this.message,
    required this.superFeaturedProduct,
  });
  ShopOwnerBannerResponseMOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    superFeaturedProduct = json['super_featured_product'] != null
        ? SuperFeaturedProduct.fromJson(json['super_featured_product'])
        : null;
  }
}

class SuperFeaturedProduct {
  int? id;
  int? vendorId;
  String? productName;
  int? productCategoryId;
  int? productSubcategoryId;
  String? productDescription;
  String? productPrice;
  String? shippingFee;
  String? freeShipping;
  String? discountPrice;
  String? salePrice;
  String? productImage;

  SuperFeaturedProduct({
    required this.id,
    required this.vendorId,
    required this.productName,
    required this.productCategoryId,
    required this.productSubcategoryId,
    required this.productDescription,
    required this.productPrice,
    required this.shippingFee,
    required this.freeShipping,
    required this.discountPrice,
    required this.salePrice,
    required this.productImage,
  });
  SuperFeaturedProduct.fromJson(Map<String, dynamic> json) {
    vendorId = json["vendor_id"];
    id = json["id"];
    productName = json["product_name"];
    productCategoryId = json["product_category_id"];
    productSubcategoryId = json["product_subcategory_id"];
    productDescription = json["product_description"];
    productPrice = json["product_price"];
    shippingFee = json["shipping_fee"];
    freeShipping = json["free_shipping"];
    discountPrice = json["discount_price"];
    salePrice = json["sale_price"];
    productImage = json["product_image"];
  }
}
