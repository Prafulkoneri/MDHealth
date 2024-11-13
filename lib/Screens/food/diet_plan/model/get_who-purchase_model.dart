class GetWhoPurchaseReponseModel {
  int? status;
  String? message;
  getWhoPurchaseData? whoPurhasedata;
  List<MealTypeWho>? mealTypeswho;

  GetWhoPurchaseReponseModel({
    required this.status,
    required this.message,
    required this.whoPurhasedata,
    required this.mealTypeswho,
  });
  GetWhoPurchaseReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    whoPurhasedata =
        json['data'] != null ? getWhoPurchaseData.fromJson(json['data']) : null;
    if (json["meal_types"] != null) {
      mealTypeswho = <MealTypeWho>[];
      json["meal_types"].forEach((v) {
        mealTypeswho!.add(MealTypeWho.fromJson(v));
      });
    }
  }
}

class getWhoPurchaseData {
  int? foodPackageId;
  List<String>? subscriptionType;
  String? salesPrice;
  String? foodType;
  String? calories;

  getWhoPurchaseData({
    required this.foodPackageId,
    required this.subscriptionType,
    required this.salesPrice,
    required this.foodType,
    required this.calories,
  });
  getWhoPurchaseData.fromJson(Map<String, dynamic> json) {
    foodPackageId = json["food_package_id"];
    subscriptionType = (json["subscription_type"] as String?)
        ?.split(',')
        .map((e) => e.trim())
        .toList();
    salesPrice = json["sales_price"];
    foodType = json["food_type"];
    calories = json["calories"];
  }
}

class MealTypeWho {
  int? id;
  String? mealType;

  MealTypeWho({
    required this.id,
    required this.mealType,
  });
  MealTypeWho.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    mealType = json["meal_type"];
  }
}
//////////////////////////Request MOdel/////////////////////////

class GetWhoPurchaseRequestModel {
  String? foodpackageId;
  String? foodType;

  GetWhoPurchaseRequestModel({
    this.foodpackageId,
    this.foodType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["food_package_id"] = foodpackageId ?? '';
    data['food_type'] = foodType;
    return data;
  }
}
