class ShopProductListRequestModel {
  String? minPrice;
  String? freeShipping;
  String? verifiedProvidersCount;
  String? rating;
  String? categoryId;
  String? subCategoryId;
  String? productName;
  String? userPincode;

  ShopProductListRequestModel({
    this.minPrice,
    this.freeShipping,
    this.verifiedProvidersCount,
    this.rating,
    this.categoryId,
    this.subCategoryId,
    this.productName,
    this.userPincode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["minPrice"] = minPrice;
    data["freeShipping"] = freeShipping;
    data["verified_providers_count"] = verifiedProvidersCount;
    data["rating"] = rating;
    data["category_id"] = categoryId;
    data["sub_category_id"] = subCategoryId;
    data["product_name"] = productName;
    data["user_pincode"] = userPincode;
    return data;
  }
}

//////////////////////////////////////////////////////////////////////////////////
// class ShopProductListResponseModel {
//   String? status;
//   String? message;
//   List<Product>? products;

//   ShopProductListResponseModel({
//     this.status,
//     this.message,
//     this.products,
//   });
//   ShopProductListResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     if (json["products"] != null) {
//       products = <Product>[];
//       json["products"].forEach((v) {
//         products!.add(Product.fromJson(v));
//       });
//     }
//   }
// }

// class Product {
//   int? id;
//   String? name;
//   String? description;
//   String? price;
//   String? shippingFee;
//   String? deliveryStatus;
//   int? averageRating;
//   int? reviewCount;
//   String? favouriteStatus;
//   String? verified;
//   String? imageUrl;

//   Product({
//     this.id,
//     this.name,
//     this.description,
//     this.price,
//     this.shippingFee,
//     this.deliveryStatus,
//     this.averageRating,
//     this.reviewCount,
//     this.favouriteStatus,
//     this.verified,
//     this.imageUrl,
//   });
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     description = json["description"];
//     price = json["price"];
//     shippingFee = json["shipping_fee"];
//     deliveryStatus = json["delivery_status"];
//     averageRating = json["average_rating"];
//     reviewCount = json["review_count"];
//     favouriteStatus = json["favourite_status"];
//     verified = json["verified"];
//     imageUrl = json["image_url"];
//   }
// }
class ShopProductListResponseModel {
  String? status;
  String? message;
  List<Product>? products;

  ShopProductListResponseModel({
    this.status,
    this.message,
    this.products,
  });

  factory ShopProductListResponseModel.fromJson(Map<String, dynamic> json) {
    return ShopProductListResponseModel(
      status: json["status"],
      message: json["message"],
      products: json["products"] != null
          ? (json["products"] as List).map((i) => Product.fromJson(i)).toList()
          : [],
    );
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  String? shippingFee;
  String? deliveryStatus;
  int? averageRating;
  int? reviewCount;
  String? favouriteStatus;
  String? featuredStatus;
  String? verified;
  String? imageUrl;
  String? freeShipping;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.shippingFee,
    this.deliveryStatus,
    this.averageRating,
    this.reviewCount,
    this.favouriteStatus,
    this.verified,
    this.imageUrl,
    this.featuredStatus,
    this.freeShipping,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      shippingFee: json["shipping_fee"],
      deliveryStatus: json["delivery_status"],
      averageRating: json["average_rating"],
      reviewCount: json["review_count"],
      favouriteStatus: json["favourite_status"],
      verified: json["verified"],
      imageUrl: json["image_url"],
      featuredStatus: json["featured_status"],
      freeShipping: json["free_shipping"],
    );
  }
}
