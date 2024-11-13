class HomeSortRequestModel {
  String? servicesName;
  String? cityName;
  String? otherServices;

  HomeSortRequestModel({
    this.servicesName,
    this.cityName,
    this.otherServices,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["home_service_name"] = servicesName;
    data["city_name"] = cityName;
    data["other_services"] = cityName;
    return data;
  }
}

/////////////////////////////////////
class HomeSortResponseModel {
  String? status;
  String? message;
  List<HomeSortList>? homeSortList;

  HomeSortResponseModel({
    this.status,
    this.message,
    this.homeSortList,
  });
  HomeSortResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json["data"] != null) {
      homeSortList = <HomeSortList>[];
      json["data"].forEach((v) {
        homeSortList!.add(HomeSortList.fromJson(v));
      });
    }
  }
}

class HomeSortList {
  String? id;
  String? favouriteCheck;
  String? packageUniqueNo;
  String? packageName;
  String? treatmentPeriodInDays;
  List<String>? otherServices;
  String? vehicleModelId;
  String? tourName;
  String? salePrice;
  String? packagePrice;
  String? packageDiscount;
  String? featuredStatus;
  String? productCategoryName;
  String? productSubCategoryName;
  String? cityName;
  String? ratingLabel;
  String? averageRating;
  String? reviewCount;
  String? verified;

  HomeSortList({
    this.id,
    this.favouriteCheck,
    this.packageUniqueNo,
    this.packageName,
    this.treatmentPeriodInDays,
    this.otherServices,
    this.vehicleModelId,
    this.tourName,
    this.salePrice,
    this.packagePrice,
    this.packageDiscount,
    this.featuredStatus,
    this.productCategoryName,
    this.productSubCategoryName,
    this.cityName,
    this.ratingLabel,
    this.averageRating,
    this.reviewCount,
    this.verified,
  });
  HomeSortList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageName = json["package_name"];
    favouriteCheck = json["favourite_check"];
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
