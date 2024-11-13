// class HomeServicesDetailsViewResponseModel {
//   String? status;
//   String? message;
//   HomeServicesSearchDeatilsPackageData? homeServicesSearchDeatilsPackageData;

//   HomeServicesDetailsViewResponseModel({
//     required this.status,
//     required this.message,
//     required this.homeServicesSearchDeatilsPackageData,
//   });
// HomeServicesDetailsViewResponseModel.fromJson(Map<String, dynamic> json) {
//   status = json["status"];
//   message = json["message"];
//   homeServicesSearchDeatilsPackageData = json['data'] != null
//       ? HomeServicesSearchDeatilsPackageData.fromJson(json['data'])
//       : null;
// }
// }

// class HomeServicesSearchDeatilsPackageData {
//   String? id;
//   String? providerUniqueNo;
//   String? companyName;
//   String? companyOverview;
//   String? verified;
//   String? logo;
//   String? cityName;
//   String? verboseReview;
//   List<ProviderImage>? providerImages;
//   String? totalReviewsCount;
//   String? stars;
//   String? isFav;
//   String? featuredStatus;
//   String? servicesPeriods;
//   String? packageFeaturedStatus;
//   String? packageTreatmentPrice;
//   String? packagePackageDiscount;
//   String? packagePackagePrice;
//   String? packageSalePrice;
//   List<String>? packageImages;

//   HomeServicesSearchDeatilsPackageData({
//     required this.id,
//     required this.providerUniqueNo,
//     required this.companyName,
//     required this.companyOverview,
//     required this.verified,
//     required this.logo,
//     required this.cityName,
//     required this.verboseReview,
//     required this.providerImages,
//     required this.totalReviewsCount,
//     required this.stars,
//     required this.isFav,
//     required this.packageImages,
//     required this.servicesPeriods,
//     required this.featuredStatus,
//     required this.packageFeaturedStatus,
//     required this.packageTreatmentPrice,
//     required this.packagePackageDiscount,
//     required this.packagePackagePrice,
//     required this.packageSalePrice,
//   });
// HomeServicesSearchDeatilsPackageData.fromJson(Map<String, dynamic> json) {
//   providerUniqueNo = json["provider_unique_no"];
//   id = json["id"];
//   packageImages = json["package_images"] != null
//       ? List<String>.from(json["package_images"]!.map((x) => x))
//       : null;
//   if (json["provider_images"] != null) {
//     providerImages = <ProviderImage>[];
//     json["provider_images"].forEach((v) {
//       providerImages!.add(ProviderImage.fromJson(v));
//     });
//   }
//   isFav = json["is_fav"];
//   stars = json["stars"];
//   totalReviewsCount = json["total_reviews_count"];
//   verboseReview = json["verbose_review"];
//   cityName = json["city_name"];
//   logo = json["logo"];
//   verified = json["verified"];
//   companyOverview = json["company_overview"];
//   companyName = json["company_name"];
//   featuredStatus = json["featured_status"];
//   servicesPeriods = json["treatment_period_in_days"];
//   packageFeaturedStatus = json["package_featured_status"];
//   packageTreatmentPrice = json["package_treatment_price"];
//   packagePackageDiscount = json["package_package_discount"];
//   packagePackagePrice = json["package_package_price"];
//   packageSalePrice = json["package_sale_price"];
// }
// }

// class ProviderImage {
//   String? providerImagePath;

//   ProviderImage({
//     required this.providerImagePath,
//   });
//   ProviderImage.fromJson(Map<String, dynamic> json) {
//     providerImagePath = json["provider_image_path"];
//   }
// }
class HomeServicesDetailsViewResponseModel {
  String? status;
  String? message;
  HomeServicesSearchDeatilsPackageData? homeServicesSearchDeatilsPackageData;
  int? verifiedProvidersCount;
  int? excellentCount;
  int? veryGoodCount;
  int? goodCount;
  int? fairCount;
  int? badCount;
  int? allTreatmentCount;
  int? fullPackageCount;
  int? personalcare;
  int? companionship;
  int? mealplanning;
  int? privatedutynursingcare;
  int? physicaltherapy;
  int? babysitting;
  int? medicationAppointment;
  int? zerototen;
  int? tentotwenty;
  int? twentytofifty;
  int? fiftytoseventy;
  int? seventytohundres;
  int? hundrestoabove;

  HomeServicesDetailsViewResponseModel({
    this.status,
    this.message,
    this.homeServicesSearchDeatilsPackageData,
    this.verifiedProvidersCount,
    this.excellentCount,
    this.veryGoodCount,
    this.goodCount,
    this.fairCount,
    this.badCount,
    this.allTreatmentCount,
    this.fullPackageCount,
    this.personalcare,
    this.companionship,
    this.mealplanning,
    this.privatedutynursingcare,
    this.physicaltherapy,
    this.babysitting,
    this.medicationAppointment,
    this.zerototen,
    this.tentotwenty,
    this.twentytofifty,
    this.fiftytoseventy,
    this.seventytohundres,
    this.hundrestoabove,
  });
  HomeServicesDetailsViewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    verifiedProvidersCount = json["verified_providers_count"];
    excellentCount = json["excellent_count"];
    veryGoodCount = json["very_good_count"];
    goodCount = json["good_count"];
    fairCount = json["fair_count"];
    badCount = json["bad_count"];
    allTreatmentCount = json["all_treatment_count"];
    fullPackageCount = json["full_package_count"];
    personalcare = json["personalcare"];
    companionship = json["companionship"];
    mealplanning = json["mealplanning"];
    privatedutynursingcare = json["privatedutynursingcare"];
    physicaltherapy = json["physicaltherapy"];
    babysitting = json["babysitting"];
    medicationAppointment = json["medication&appointment"];
    zerototen = json["zerototen"];
    tentotwenty = json["tentotwenty"];
    twentytofifty = json["twentytofifty"];
    fiftytoseventy = json["fiftytoseventy"];
    seventytohundres = json["seventytohundres"];
    hundrestoabove = json["hundrestoabove"];

    homeServicesSearchDeatilsPackageData = json['data'] != null
        ? HomeServicesSearchDeatilsPackageData.fromJson(json['data'])
        : null;
  }
}

class HomeServicesSearchDeatilsPackageData {
  String? id;
  String? providerUniqueNo;
  String? companyName;
  String? servicesPeriods;
  String? companyOverview;
  String? verified;
  List<Service>? services;
  String? cityName;
  String? verboseReview;
  List<String>? providerImages;
  String? totalReviewsCount;
  String? stars;
  String? packageOverview;
  String? logo;
  String? isFav;
  List<String>? packageImages;
  String? packageFeaturedStatus;
  String? featuredStatus;
  String? packageTreatmentPrice;
  String? packagePackageDiscount;
  String? packagePackagePrice;
  String? packageSalePrice;
  String? packageName;
  String? packageDescription;
  String? packageOtherServices;
  String? averageRating;

  HomeServicesSearchDeatilsPackageData({
    this.id,
    this.providerUniqueNo,
    this.companyName,
    this.companyOverview,
    this.packageOverview,
    this.servicesPeriods,
    this.services,
    this.cityName,
    this.logo,
    this.verboseReview,
    this.providerImages,
    this.totalReviewsCount,
    this.stars,
    this.isFav,
    this.packageImages,
    this.packageFeaturedStatus,
    this.packageTreatmentPrice,
    this.packagePackageDiscount,
    this.packagePackagePrice,
    this.packageSalePrice,
    this.packageName,
    this.packageDescription,
    this.packageOtherServices,
    this.featuredStatus,
    this.averageRating,
  });
  HomeServicesSearchDeatilsPackageData.fromJson(Map<String, dynamic> json) {
    providerUniqueNo = json["provider_unique_no"];
    id = json["id"];
    if (json["services"] != null) {
      services = <Service>[];
      json["services"].forEach((v) {
        services!.add(Service.fromJson(v));
      });
    }
    packageImages = json["package_images"] != null
        ? List<String>.from(json["package_images"]!.map((x) => x))
        : null;
    providerImages = json["provider_images"] != null
        ? List<String>.from(json["provider_images"]!.map((x) => x))
        : null;
    isFav = json["is_fav"];
    stars = json["stars"];
    totalReviewsCount = json["total_reviews_count"];
    verboseReview = json["verbose_review"];
    cityName = json["city_name"];
    logo = json["logo"];
    verified = json["verified"];
    companyOverview = json["company_overview"];
    packageOverview = json["package_description"];
    companyName = json["package_name"];
    featuredStatus = json["featured_status"];
    averageRating = json["average_rating"];
    servicesPeriods = json["treatment_period_in_days"];
    packageFeaturedStatus = json["package_featured_status"];
    packageTreatmentPrice = json["package_treatment_price"];
    packagePackageDiscount = json["package_package_discount"];
    packagePackagePrice = json["package_package_price"];
    packageSalePrice = json["package_sale_price"];
  }
}

class Service {
  String? id;
  String? title;
  String? description;

  Service({
    this.id,
    this.title,
    this.description,
  });
  Service.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
  }
}

///////////////////////////////////////////
// class HomeServicesDetailsViewRequestModel {
//   String? packageId;

//   HomeServicesDetailsViewRequestModel({
//     required this.packageId,
//   });
//   HomeServicesDetailsViewRequestModel.fromJson(Map<String, dynamic> json) {
//     packageId = json["package_id"];
//   }
// }
class HomeServicesDetailsViewRequestModel {
  String? packageId;

  HomeServicesDetailsViewRequestModel({
    this.packageId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    return data;
  }
}
