class HomeSSearchListResponseModel {
  String? status;
  String? message;
  int? verifiedCount;
  List<HomeServiceSearchDataList>? homeServicesSearchDataList;

  HomeSSearchListResponseModel({
    this.status,
    this.message,
    this.verifiedCount,
    this.homeServicesSearchDataList,
  });
  HomeSSearchListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    verifiedCount = json['verified_providers_count'];
    if (json["data"] != null) {
      homeServicesSearchDataList = <HomeServiceSearchDataList>[];
      json["data"].forEach((v) {
        homeServicesSearchDataList!.add(HomeServiceSearchDataList.fromJson(v));
      });
    }
  }
}

class HomeServiceSearchDataList {
  String? id;
  String? packageName;
  String? treatmentPeriodInDays;
  String? packagePrice;
  String? salePrice;
  String? packageDiscount;
  String? cityName;
  String? ratingLabel;
  String? averageRating;
  String? verified;
  String? featuredStatus;
  String? reviewCount;

  HomeServiceSearchDataList({
    this.id,
    this.packageName,
    this.treatmentPeriodInDays,
    this.packagePrice,
    this.salePrice,
    this.packageDiscount,
    this.cityName,
    this.ratingLabel,
    this.averageRating,
    this.verified,
    this.featuredStatus,
    this.reviewCount,
  });
  HomeServiceSearchDataList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageName = json["package_name"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
    packagePrice = json["package_price"];
    salePrice = json["sale_price"];
    packageDiscount = json["package_discount"];
    ratingLabel = json["rating_label"];
    averageRating = json["average_rating"];
    verified = json["verified"];
    featuredStatus = json["featured_status"];
    reviewCount = json["review_count"];
    cityName = json["city_name"];
  }
}

///////////////////////////////////////////////////////////////////
class HomeSSearchListRequestModel {
  String? servicesName;
  String? cityName;
  String? rating;
  String? services;
  String? prices;
  String? searchHS;
  String? servicesDate;
  String? verifiedCount;

  HomeSSearchListRequestModel({
    this.servicesName,
    this.cityName,
    this.rating,
    this.services,
    this.prices,
    required this.verifiedCount,
    required this.searchHS,
    required this.servicesDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["home_service_name"] = servicesName;
    data["city_name"] = cityName;
    data["ratings"] = rating;
    data["services"] = services;
    data["prices"] = prices;
    data["searchbyname"] = searchHS;
    data["services_date"] = servicesDate;
    data["verified_packages"] = verifiedCount;
    return data;
  }
}
