class DietViewRequestModel {
  String? foodType;
  String? calories;
  String? subscriptionType;
  String? searchFood;
  String? userPincode;
  String? mealtypef;
  String? prices;
  String? rating;
  String? verifiedCount;

  DietViewRequestModel({
    this.foodType,
    this.calories,
    this.subscriptionType,
    this.userPincode,
    required this.searchFood,
    required this.rating,
    required this.mealtypef,
    required this.prices,
    required this.verifiedCount,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["subscription_type"] = subscriptionType;
    data["food_type"] = foodType ?? '';
    data["calories"] = calories;
    data["food_name"] = searchFood;
    data["user_pincode"] = userPincode;
    data["ratings"] = rating;
    data["mealtype"] = mealtypef;
    data["price"] = prices;
    data['verified'] = verifiedCount;
    return data;
  }
}

/////////////////////////////////////////////////////////////////////////////
class DietViewReponseModel {
  int? status;
  String? message;
  DietViewListData? dietviewdata;
  PriceRange? priceRange;
  MealTypeCounts? mealTypeCounts;
  RatingCounts? ratingCounts;
  int? verifiedProviderCount;

  DietViewReponseModel({
    required this.status,
    required this.message,
    required this.dietviewdata,
    required this.priceRange,
    required this.mealTypeCounts,
    required this.ratingCounts,
    required this.verifiedProviderCount,
  });
  DietViewReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    dietviewdata =
        json['data'] != null ? DietViewListData.fromJson(json['data']) : null;
    // if (json['data'] != null) {
    //   if (json['data'] is List) {
    //     // Handle list data
    //     dietviewdata = DietViewListData(foodPackagesSearch: []);
    //     dietviewdata!.foodPackagesSearch = List<FoodPackagesSearch>.from(
    //       json['data'].map((model) => FoodPackagesSearch.fromJson(model)),
    //     );
    //   } else if (json['data'] is Map<String, dynamic>) {
    //     // Handle map data
    //     dietviewdata = DietViewListData.fromJson(json['data']);
    //   }
    // }

    // whoPurhasedata =         // just for reference
    // json['data'] != null ? getWhoPurchaseData.fromJson(json['data']) : null;

    priceRange = json['price_range'] != null
        ? PriceRange.fromJson(json['price_range'])
        : null;

    mealTypeCounts = json['mealTypeCounts'] != null
        ? MealTypeCounts.fromJson(json['mealTypeCounts'])
        : null;

    ratingCounts = json['ratingCounts'] != null
        ? RatingCounts.fromJson(json['ratingCounts'])
        : null;

    verifiedProviderCount = json['verified_providers_count'];
  }
}

class MealTypeCounts {
  // int? allMealType;
  int? breakfast;
  int? lunch;
  int? dinner;
  int? noGluten;
  int? zeroSugarD;

  MealTypeCounts({
    // this.allMealType,
    this.breakfast,
    this.lunch,
    this.dinner,
    this.noGluten,
    this.zeroSugarD,
  });

  MealTypeCounts.fromJson(Map<String, dynamic> json) {
    // allMealType = json[''];
    breakfast = json['Breakfast'];
    lunch = json['Lunch'];
    dinner = json['Dinner'];
    noGluten = json['No-Gluten'];
    zeroSugarD = json['Zero Sugar Dessert'];
  }
}

class PriceRange {
  int? firstPrice;
  int? secondPrice;
  int? thirdPrice;
  int? fourthPrice;
  int? fifthPrice;
  int? sixthPrice;

  PriceRange({
    required this.firstPrice,
    required this.secondPrice,
    required this.thirdPrice,
    required this.fourthPrice,
    required this.fifthPrice,
    required this.sixthPrice,
  });

  PriceRange.fromJson(Map<String, dynamic> json) {
    firstPrice = json['0-500'];
    secondPrice = json['501-1000'];
    thirdPrice = json['1001-3000'];
    fourthPrice = json['3001-5000'];
    fifthPrice = json['5001-10000'];
    sixthPrice = json['Over 10000'];
  }
}

class RatingCounts {
  int? firstRCount;
  int? secondRCount;
  int? thirdRCount;
  int? fourthRCount;
  int? fifthRCount;

  RatingCounts({
    required this.firstRCount,
    required this.secondRCount,
    required this.thirdRCount,
    required this.fourthRCount,
    required this.fifthRCount,
  });

  RatingCounts.fromJson(Map<String, dynamic> json) {
    firstRCount = json['5'];
    secondRCount = json['4'];
    thirdRCount = json['3'];
    fourthRCount = json['2'];
    fifthRCount = json['1'];
  }
}

class DietViewListData {
  List<FoodPackagesSearch>? foodPackagesSearch;

  DietViewListData({
    required this.foodPackagesSearch,
  });
  DietViewListData.fromJson(Map<String, dynamic> json) {
    if (json["food_packages_search"] != null) {
      foodPackagesSearch = <FoodPackagesSearch>[];
      json["food_packages_search"].forEach((v) {
        foodPackagesSearch!.add(FoodPackagesSearch.fromJson(v));
      });
    }
  }
}

class FoodPackagesSearch {
  int? foodPackageId;
  String? uniqueId;
  String? subscriptionType;
  String? images;
  String? packageName;
  String? packagePrice;
  String? discountPrice;
  String? salesPrice;
  String? verified;
  String? featuredStatus;
  int? monthlyPackagePrice;
  int? monthlySalesPrice;
  String? cityName;
  String? deliveryStatus;
  String? isFavorite;
  String? foodType;
  String? calories;
  String? avgRating;
  String? ratingLabel;
  int? reviewsCount;
  List<String>? mealTypes;
  List<MenuList>? menuList;
  List<ReviewList>? reviewList;

  FoodPackagesSearch({
    required this.foodPackageId,
    required this.uniqueId,
    required this.images,
    required this.subscriptionType,
    required this.packageName,
    required this.packagePrice,
    required this.discountPrice,
    required this.salesPrice,
    required this.monthlyPackagePrice,
    required this.monthlySalesPrice,
    required this.cityName,
    required this.verified,
    required this.featuredStatus,
    this.reviewList,
    required this.mealTypes,
    required this.isFavorite,
    required this.calories,
    required this.foodType,
    required this.avgRating,
    required this.ratingLabel,
    required this.reviewsCount,
    required this.deliveryStatus,
    this.menuList,
  });
  FoodPackagesSearch.fromJson(Map<String, dynamic> json) {
    foodPackageId = json["food_package_id"];
    uniqueId = json["unique_id"];
    images = json["image"];
    subscriptionType = json["subscription_type"];
    calories = json["calories"];
    packageName = json["package_name"];
    packagePrice = json["package_price"];
    discountPrice = json["discount_price"];
    verified = json["verified"];
    featuredStatus = json["featured_status"];
    salesPrice = json["sales_price"];
    monthlyPackagePrice = json["monthly_package_price"];
    monthlySalesPrice = json["monthly_sales_price"];
    cityName = json["city_name"];
    isFavorite = json["is_favorite"];
    foodType = json["food_type"];
    deliveryStatus = json["delivery_status"];
    avgRating = json['avg_rating'];
    ratingLabel = json['rating_label'];
    reviewsCount = json['reviews_count'];
    if (json['review_list'] != null) {
      reviewList = <ReviewList>[];
      json['review_list'].forEach((v) {
        reviewList!.add(ReviewList.fromJson(v));
      });
    }
    mealTypes = json["meal_types"] != null
        ? List<String>.from(json["meal_types"]!.map((x) => x))
        : null;
    if (json["menu_details"] != null) {
      menuList = <MenuList>[];
      json["menu_details"].forEach((v) {
        menuList!.add(MenuList.fromJson(v));
      });
    }
  }
}

class ReviewList {
  String? customerName;
  int? rating;
  String? feedback;
  String? reviewDate;

  ReviewList({
    this.customerName,
    this.rating,
    this.feedback,
    this.reviewDate,
  });

  ReviewList.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    rating = json['rating'];
    feedback = json['feedback'];
    reviewDate = json['review_date'];
  }
}

class MenuList {
  int? id;
  String? category;
  List<MealTypen>? mealTypen;

  MenuList({
    this.id,
    this.category,
    this.mealTypen,
  });

  MenuList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    category = json["category"];
    if (json["mealType"] != null) {
      mealTypen = <MealTypen>[];
      json["mealType"].forEach((v) {
        mealTypen!.add(MealTypen.fromJson(v));
      });
    }
  }
}

class MealTypen {
  String? meal;
  List<String>? mealName;

  MealTypen({
    this.meal,
    this.mealName,
  });

  MealTypen.fromJson(Map<String, dynamic> json) {
    meal = json["meal"];
    mealName = json["mealName"] != null
        ? List<String>.from(json["mealName"]!.map((x) => x))
        : null;
  }
}
