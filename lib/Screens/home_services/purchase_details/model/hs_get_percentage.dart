class HsgetPercentengeResponseModel {
  int? status;
  String? message;
  List<Discount>? discounts;

  HsgetPercentengeResponseModel({
    this.status,
    this.message,
    this.discounts,
  });
  HsgetPercentengeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["discounts"] != null) {
      discounts = <Discount>[];
      json["discounts"].forEach((v) {
        discounts!.add(Discount.fromJson(v));
      });
    }
  }
}

class Discount {
  int? id;
  String? percentage;
  String? minimumDiscount;
  String? title;
  String? price;

  Discount({
    required this.id,
    required this.percentage,
    required this.minimumDiscount,
    required this.title,
    required this.price,
  });
  Discount.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    percentage = json["percentage"];
    minimumDiscount = json["minimum_discount"];
    title = json["title"];
    price = json["price"];
  }
}

/////////////////////////////////////////
class HsDisscountRequestModel {
  String? salePrice;
  String? packageId;

  HsDisscountRequestModel({
    this.salePrice,
    this.packageId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["sale_price"] = salePrice;
    data["package_id"] = packageId;
    return data;
  }
}
