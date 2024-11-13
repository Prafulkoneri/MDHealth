class DietViewReponseModelPayment {
  int? status;
  String? message;
  DietPaymentDetailsData? dietPaymentdetailsdata;
  CustomerList? customerList;

  DietViewReponseModelPayment({
    required this.status,
    required this.message,
    required this.dietPaymentdetailsdata,
    required this.customerList,
  });
  DietViewReponseModelPayment.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    dietPaymentdetailsdata = json['data'] != null
        ? DietPaymentDetailsData.fromJson(json['data'])
        : null;
    customerList = json['customer_list'] != null
        ? CustomerList.fromJson(json['customer_list'])
        : null;
  }
}

class CustomerList {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? countryName;
  String? cityName;
  String? address;
  String? postalCode;

  CustomerList({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.countryName,
    required this.cityName,
    required this.address,
    required this.postalCode,
  });
  CustomerList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    fullName = json["full_name"];
    countryName = json["country_name"];
    cityName = json["city_name"];
    address = json["address"];
    postalCode = json["postal_code"];
  }
}

class DietPaymentDetailsData {
  int? foodPackageId;
  String? uniqueId;
  String? subscriptionType;
  String? packageName;
  String? discountPrice;
  String? packagePrice;
  String? salesPrice;
  String? cityName;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  String? daysInWords;
  List<String>? mealTypes;

  DietPaymentDetailsData({
    required this.foodPackageId,
    required this.uniqueId,
    required this.subscriptionType,
    required this.packageName,
    required this.discountPrice,
    required this.packagePrice,
    required this.salesPrice,
    required this.cityName,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
    required this.daysInWords,
    required this.mealTypes,
  });
  DietPaymentDetailsData.fromJson(Map<String, dynamic> json) {
    foodPackageId = json["food_package_id"];
    uniqueId = json["unique_id"];
    subscriptionType = json["subscription_type"];
    packageName = json["package_name"];
    discountPrice = json["discount_price"];
    packagePrice = json["package_price"];
    salesPrice = json["sales_price"];
    cityName = json["city_name"];
    subscriptionStartDate = json["subscription_start_date"];
    subscriptionEndDate = json["subscription_end_date"];
    daysInWords = json["days_in_words"];
    mealTypes = json["meal_types"] != null
        ? List<String>.from(json["meal_types"]!.map((x) => x))
        : null;
  }
}

////////////////////////////////////////////////////////////////
class DietViewRequestModelPayment {
  String? foodpackageId;
  String? subscriptionDate;
  String? subscriptionType;
  String? patientId;
  String? salePrices;
  String? type;
  String? selectedAddress;

  DietViewRequestModelPayment({
    this.foodpackageId,
    this.subscriptionDate,
    this.subscriptionType,
    this.type,
    this.patientId,
    this.salePrices,
    this.selectedAddress,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["food_package_id"] = foodpackageId;
    data["subscription_start_date"] = subscriptionDate;
    data["subscription_type"] = subscriptionType;
    data["type"] = type;
    data["patient_id"] = patientId;
    data["sales_price"] = salePrices;
    data["user_address_id"] = selectedAddress ?? "";
    return data;
  }
}
