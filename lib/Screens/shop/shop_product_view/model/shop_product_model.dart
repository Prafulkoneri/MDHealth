class ShopProductViewRequestModel {
  String? id;

  ShopProductViewRequestModel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}

////////////////////////////RESPONSEMODEl//////////////////////
class ShopProductViewResponseModel {
  int? status;
  String? message;
  int? followersCount;
  ProductData? productData;
  List? productGallery;
  String? followingStatus;

  // List<OtherProduct>? otherProducts;

  ShopProductViewResponseModel({
    required this.status,
    required this.message,
    required this.productData,
    required this.productGallery,
    required this.followersCount,
    this.followingStatus,

    // required this.otherProducts,
  });
  ShopProductViewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    followersCount = json["followers_count"];
    followingStatus = json["following_status"];

    productData = json['product_data'] != null
        ? ProductData.fromJson(json['product_data'])
        : null;

    if (json["product_gallery"] != null) {
      productGallery = [];
      json["product_gallery"].forEach((v) {
        productGallery!.add((v));
      });
    }
  }
}

class ProductData {
  int? id;
  int? vendorId;
  String? vendorName;
  String? productName;
  String? productCategoryName;
  String? productSubCategoryName;
  String? productDescrition;
  String? shippingFee;
  String? freeShipping;
  String? salePrice;
  int? productCategoryId;
  int? productsubCategoryId;
  String? productsubCategoryName;
  String? productPrice;
  String? featured;
  int? totalReviews;
  int? reviews;
  String? discount;
  String? favouriteStatus;
  // String? followingStatus;
  String? verified;

  ProductData({
    this.id,
    this.vendorId,
    this.vendorName,
    this.productName,
    this.productCategoryName,
    this.productSubCategoryName,
    this.productDescrition,
    this.shippingFee,
    this.freeShipping,
    this.salePrice,
    this.productCategoryId,
    this.productsubCategoryId,
    this.productsubCategoryName,
    this.productPrice,
    this.featured,
    this.totalReviews,
    this.reviews,
    this.discount,
    this.favouriteStatus,
    // this.followingStatus,
    this.verified,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    productName = json["product_name"];
    productCategoryId = json["product_category_id"];
    productCategoryName = json["product_category_name"];
    productsubCategoryId = json["product_sub_category_id"];
    productsubCategoryName = json["product_sub_category_name"];
    productDescrition = json["product_descrition"];
    productPrice = json["product_price"];
    shippingFee = json["shipping_fee"];
    freeShipping = json["free_shipping"];
    discount = json["discount"].toString(); // Convert integer to string
    salePrice = json["sale_price"];
    featured = json["featured_status"];
    vendorId = json["vendor_id"]; // Correct assignment
    vendorName = json["vendor_name"]; // Correct assignment
    // Assign remaining fields as needed
    totalReviews = json["total_reviews"];
    reviews = json["reviews"];
    favouriteStatus = json["favourite_status"];
    verified = json["verified"];
    // followingStatus = json["following_status"];
  }
}
