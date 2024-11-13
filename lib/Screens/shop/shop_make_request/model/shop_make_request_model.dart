class ShopFormViewHomeRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? country;
  String? contactNumber;
  String? shopName;
  String? details;
  String? whyNeedShop;
  String? shopImagePath;

  ShopFormViewHomeRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.country,
    this.shopName,
    this.whyNeedShop,
    this.details,
    this.shopImagePath,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["email"] = email;
    data["contact_no"] = contactNumber;
    data["country_id"] = country;
    data["shop_name_for_request"] = shopName;
    data["details"] = details;
    data["why_do_you_need_shop"] = whyNeedShop;
    data["shop_image_name"] = shopImagePath;

    return data;
  }
}

////////////////////////////////RESP{ONSE/////////////////////////////}
class ShopFormResponseModelView {
  String? status;
  String? message;

  ShopFormResponseModelView({
    required this.status,
    required this.message,
  });
  ShopFormResponseModelView.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
