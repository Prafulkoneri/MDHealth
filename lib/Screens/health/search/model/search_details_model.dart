class SearchDetailsListRequestModel {
  String? id;

  SearchDetailsListRequestModel({
    this.id,
  });

  SearchDetailsListRequestModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

////////////////////////////////////////////////////////////////////////////////

class SearchDetailsListResponseModel {
  int? status;
  String? message;
  PackagesDetails? packagesDetails;
  List<String>? providerGallery;
  List<String>? packageGallery;

  SearchDetailsListResponseModel({
    this.status,
    this.message,
    this.packagesDetails,
    this.providerGallery,
    this.packageGallery,
  });

  SearchDetailsListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    packagesDetails = json["packages_details"] != null
        ? PackagesDetails.fromJson(json["packages_details"])
        : null;
    providerGallery = json["provider_gallery"] != null
        ? List<String>.from(json["provider_gallery"]!.map((x) => x))
        : null;
    packageGallery = json["PackagesMultipleImages"] != null
        ? List<String>.from(json["PackagesMultipleImages"]!.map((x) => x))
        : null;
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "packages_details": packagesDetails?.toJson(),
        "provider_gallery": providerGallery == null
            ? []
            : List<String>.from(providerGallery!.map((x) => x)),
        "PackagesMultipleImages": packageGallery == null
            ? []
            : List<String>.from(packageGallery!.map((x) => x)),
      };
}

class PackagesDetails {
  int? id; //
  String? packageUniqueNo;
  int? cityId;
  int? reviewStars;
  int? totalReviews;
  String? verboseReview;
  String? treatmentName;
  String? overview;
  String? packageName; //
  int? treatmentCategoryId;
  int? treatmentId;
  List<String>? otherServices;
  String? treatmentPeriodInDays; //
  String? treatmentPrice; //
  String? cityName; //
  String? packagePrice;
  String? salePrice;
  String? favCheck;
  String? packageDescription;
  String? verified;
  String? featuredStatus;
  String? discountPercetage;

  PackagesDetails({
    this.id,
    this.packageUniqueNo,
    this.cityId,
    this.favCheck,
    this.reviewStars,
    this.treatmentName,
    this.totalReviews,
    this.verboseReview,
    this.overview,
    this.packageName,
    this.treatmentCategoryId,
    this.treatmentId,
    this.otherServices,
    this.treatmentPeriodInDays,
    this.treatmentPrice,
    this.salePrice,
    this.cityName,
    this.packagePrice,
    this.packageDescription,
    this.verified,
    this.featuredStatus,
    this.discountPercetage,
  });

  PackagesDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageUniqueNo = json["package_unique_no"];
    favCheck = json["favourite_check"];
    treatmentName = json["treatment_name"];
    cityId = json["city_id"];
    reviewStars = json["review_stars"];
    totalReviews = json["total_reviews"];
    verboseReview = json["verbose_review"];
    overview = json["overview"];
    packageDescription = json["package_description"];
    packageName = json["package_name"];
    packagePrice = json["package_price"];
    salePrice = json["sales_price"];
    treatmentCategoryId = json["treatment_category_id"];
    treatmentId = json["treatment_id"];
    otherServices = json["other_services"] != null
        ? List<String>.from(json["other_services"]!.map((x) => x))
        : null;
    treatmentPeriodInDays = json["treatment_period_in_days"];
    treatmentPrice = json["treatment_price"];
    cityName = json["city_name"];
    verified = json["verified"];
    featuredStatus = json["featured_status"];
    discountPercetage = json["package_discount"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_unique_no": packageUniqueNo,
        "treatment_name": treatmentName,
        "city_id": cityId,
        "review_stars": reviewStars,
        "total_reviews": totalReviews,
        "verbose_review": verboseReview,
        "overview": overview,
        "package_description": packageDescription,
        "package_name": packageName,
        "treatment_category_id": treatmentCategoryId,
        "treatment_id": treatmentId,
        "other_services": otherServices != null
            ? List<String>.from(otherServices!.map((x) => x))
            : null,
        "treatment_period_in_days": treatmentPeriodInDays,
        "treatment_price": treatmentPrice,
        "city_name": cityName,
        "verified": verified,
        "featured_status": featuredStatus,
        "package_price": packagePrice,
        "sales_price": salePrice,
        "discount_percetange": discountPercetage,
      };
}
