class CalculationMealResponseModel {
  int? status;
  String? message;
  CalculationData? calculationdata;

  CalculationMealResponseModel({
    required this.status,
    required this.message,
    required this.calculationdata,
  });
  CalculationMealResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    calculationdata =
        json['data'] != null ? CalculationData.fromJson(json['data']) : null;
  }
}

class CalculationData {
  int? salePrices;

  CalculationData({
    required this.salePrices,
  });
  CalculationData.fromJson(Map<String, dynamic> json) {
    salePrices = json["sales_price"];
  }
}

///////////////////////RequestModel//////////////////////////////////

class CalculationRequestModel {
  String? salePrice;
  String? mealType;
  String? foodpackageId;
  String? subscriptionType;
  String? status;

  CalculationRequestModel({
    this.salePrice,
    this.mealType,
    this.foodpackageId,
    this.subscriptionType,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["sales_price"] = salePrice;
    data["meal_type"] = mealType;
    data["food_package_id"] = foodpackageId;
    data["subscription_type"] = subscriptionType;
    data["status"] = status;
    return data;
  }
}
