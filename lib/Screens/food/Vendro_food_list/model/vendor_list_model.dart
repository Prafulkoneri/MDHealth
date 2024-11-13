class VendorFoodListResponseModel {
  int? status;
  String? message;
  FoodVendorListData? foofvendorlistdata;

  VendorFoodListResponseModel({
    this.status,
    this.message,
    this.foofvendorlistdata,
  });
  VendorFoodListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json['data'] != null) {
      if (json['data'] is List) {
        // Handle list data
        foofvendorlistdata = FoodVendorListData(vendorfoodPackagesSearch: []);
        foofvendorlistdata!.vendorfoodPackagesSearch =
            List<VendorFoodPackagesSearch>.from(
          json['data'].map((model) => VendorFoodPackagesSearch.fromJson(model)),
        );
      } else if (json['data'] is Map<String, dynamic>) {
        // Handle map data
        foofvendorlistdata = FoodVendorListData.fromJson(json['data']);
      }
    }
  }
  // VendorFoodListResponseModel.fromJson(Map<String, dynamic> json) {
  //   status = json["status"];
  //   message = json["message"];
  //   foofvendorlistdata =
  //       json['data'] != null ? FoodVendorListData.fromJson(json['data']) : null;
  // }
}

class FoodVendorListData {
  List<VendorFoodPackagesSearch>? vendorfoodPackagesSearch;

  FoodVendorListData({
    this.vendorfoodPackagesSearch,
  });
  FoodVendorListData.fromJson(Map<String, dynamic> json) {
    if (json["food_packages_search"] != null) {
      vendorfoodPackagesSearch = <VendorFoodPackagesSearch>[];
      json["food_packages_search"].forEach((v) {
        vendorfoodPackagesSearch!.add(VendorFoodPackagesSearch.fromJson(v));
      });
    }
  }
}

class VendorFoodPackagesSearch {
  int? foodPackageId;
  String? uniqueId;
  String? subscriptionType;
  String? packageName;
  String? packagePrice;
  String? verified;
  String? discountPrice;
  String? salesPrice;
  dynamic monthlyPackagePrice;
  dynamic monthlySalesPrice;
  String? cityName;
  List<String>? mealTypes;
  String? isFavorite;
  String? foodType;
  String? image;
  String? featuredStatus;
  String? calories;

  VendorFoodPackagesSearch({
    this.foodPackageId,
    this.uniqueId,
    this.subscriptionType,
    this.packageName,
    this.packagePrice,
    this.verified,
    this.discountPrice,
    this.salesPrice,
    this.monthlyPackagePrice,
    this.monthlySalesPrice,
    this.cityName,
    this.mealTypes,
    this.isFavorite,
    this.foodType,
    this.image,
    this.featuredStatus,
    this.calories,
  });
  VendorFoodPackagesSearch.fromJson(Map<String, dynamic> json) {
    foodPackageId = json["food_package_id"];
    uniqueId = json["unique_id"];
    subscriptionType = json["subscription_type"];
    packageName = json["package_name"];
    packagePrice = json["package_price"];
    discountPrice = json["discount_price"];
    salesPrice = json["sales_price"];
    // monthlyPackagePrice = json["monthly_package_price"];
    // monthlySalesPrice = json["monthly_sales_price"];
    monthlyPackagePrice = _parseDouble(json["monthly_package_price"]);
    monthlySalesPrice = _parseDouble(json["monthly_sales_price"]);

    cityName = json["city_name"];
    mealTypes = json["meal_types"] != null
        ? List<String>.from(json["meal_types"]!.map((x) => x))
        : null;
    isFavorite = json["is_favorite"];
    foodType = json["food_type"];
    image = json["image"];
    featuredStatus = json["featured_status"];
    calories = json["calories"];
  }

  double? _parseDouble(dynamic value) {
    if (value == null || value is String && value.isEmpty) {
      return null;
    }
    return double.tryParse(value.toString());
  }
}

/////////////
class VendorFoodListRequestModel {
  String? foodVendorId;

  VendorFoodListRequestModel({
    this.foodVendorId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["food_vendor_id"] = foodVendorId;
    return data;
  }
}
// class VendorFoodPackagesSearch {
//   int? foodPackageId;
//   String? uniqueId;
//   String? subscriptionType;
//   String? images;
//   String? packageName;
//   String? packagePrice;
//   String? discountPrice;
//   String? salesPrice;
//   String? verified;
//   String? featuredStatus;
//   int? monthlyPackagePrice;
//   int? monthlySalesPrice;
//   String? cityName;
//   String? isFavorite;
//   String? foodType;
//   String? calories;
//   List<String>? mealTypes;

//   VendorFoodPackagesSearch({
//     required this.foodPackageId,
//     required this.uniqueId,
//     required this.images,
//     required this.subscriptionType,
//     required this.packageName,
//     required this.packagePrice,
//     required this.discountPrice,
//     required this.salesPrice,
//     required this.monthlyPackagePrice,
//     required this.monthlySalesPrice,
//     required this.cityName,
//     required this.verified,
//     required this.featuredStatus,
//     required this.mealTypes,
//     required this.isFavorite,
//     required this.calories,
//     required this.foodType,
//   });
//   VendorFoodPackagesSearch.fromJson(Map<String, dynamic> json) {
//     foodPackageId = json["food_package_id"];
//     uniqueId = json["unique_id"];
//     images = json["image"];
//     subscriptionType = json["subscription_type"];
//     calories = json["calories"];
//     packageName = json["package_name"];
//     packagePrice = json["package_price"];
//     discountPrice = json["discount_price"];
//     verified = json["verified"];
//     featuredStatus = json["featured_status"];
//     salesPrice = json["sales_price"];
//     monthlyPackagePrice = json["monthly_package_price"];
//     monthlySalesPrice = json["monthly_sales_price"];
//     cityName = json["city_name"];
//     isFavorite = json["is_favorite"];
//     foodType = json["food_type"];
    // mealTypes = json["meal_types"] != null
    //     ? List<String>.from(json["meal_types"]!.map((x) => x))
    //     : null;
//   }
// }