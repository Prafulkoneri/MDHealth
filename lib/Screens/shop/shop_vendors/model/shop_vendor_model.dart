class ShopVendorResponseModel {
  int? status;
  String? message;
  List<ShopVendorData>? productData;

  ShopVendorResponseModel({
    this.status,
    this.message,
    this.productData,
  });
  ShopVendorResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json["product_data"] != null) {
      productData = <ShopVendorData>[];
      json["product_data"].forEach((v) {
        productData!.add(ShopVendorData.fromJson(v));
      });
    }
  }
}

class ShopVendorData {
  String? productName;
  int? id;
  String? productUniqueId;
  String? productPrice;
  String? shippingFee;
  String? freeShipping;
  String? featured;
  String? superFeatured;
  String? featuredStatus;
  String? favouriteStatus;
  String? imagePath;
  String? discount;
  String? salePrice;
  String? isVerified;

  ShopVendorData({
    this.productName,
    this.id,
    this.productUniqueId,
    this.productPrice,
    this.shippingFee,
    this.freeShipping,
    this.featured,
    this.discount,
    this.salePrice,
    this.superFeatured,
    this.featuredStatus,
    this.favouriteStatus,
    this.imagePath,
    this.isVerified,
  });
  ShopVendorData.fromJson(Map<String, dynamic> json) {
    productName = json["product_name"];
    id = json["id"];
    productUniqueId = json["product_unique_id"];
    productPrice = json["product_price"];
    shippingFee = json["shipping_fee"];
    featured = json["featured"];
    freeShipping = json["free_shipping"];
    discount = json["discount"].toString();
    salePrice = json["sale_price"];
    superFeatured = json["super_featured"]; // Convert integer to string
    featuredStatus = json["featured_status"];
    favouriteStatus = json["favourite_status"];
    imagePath = json["image_path"];
    isVerified = json["is_verified"];
  }
}

///////////////////////////////////////////////////////////////////
class ShopVendorRequestModel {
  String? vedorId;

  ShopVendorRequestModel({
    this.vedorId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["vendor_id"] = vedorId;
    return data;
  }
}
