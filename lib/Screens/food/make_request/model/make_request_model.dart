import 'dart:convert';
import 'dart:math';

class FoodFormViewHomeRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? country;
  String? contactNumber;
  String? foodName;
  String? details;
  String? whyNeedFood;
  // String? foodImagePath;
  List<String> foodImagePaths;

  String? contactType;

  FoodFormViewHomeRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.country,
    this.foodName,
    this.whyNeedFood,
    this.details,
    required this.foodImagePaths,
    this.contactType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["email"] = email;
    data["contact_no"] = contactNumber;
    data["country_id"] = country;
    data["food_name_for_request"] = foodName;
    data["details"] = details;
    data["why_do_you_need_food_1"] = whyNeedFood;
    // data["food_image_name"] = foodImagePath;

    data["contact_type"] = contactType;
    data["food_image_name"] =
        foodImagePaths != null ? jsonEncode(foodImagePaths) : null;
    return data;
  }
}

////////////////////////////////RESP{ONSE/////////////////////////////}
class FoodFormResponseModelView {
  String? status;
  String? message;

  FoodFormResponseModelView({
    required this.status,
    required this.message,
  });
  FoodFormResponseModelView.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
