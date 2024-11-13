class SearchListRequestModel {
  String? cityName;
  String? tretmentName;
  String? platformType;
  String? searchtreatment;
  String? offset;
  String? rating;
  String? services;
  String? prices;
  String? verified;

  SearchListRequestModel({
    this.cityName,
    this.verified,
    this.platformType,
    this.tretmentName,
    this.offset,
    required this.rating,
    required this.services,
    required this.prices,
    required this.searchtreatment,
  });

  SearchListRequestModel.fromJson(Map<String, dynamic> json) {
    cityName = json["city_name"];
    platformType = json["platform_type"];
    tretmentName = json["treatment_name"];
    searchtreatment = json["package_name"];
    offset = json["offset"];
    rating = json["rating"];
    services = json["services"];
    prices = json["prices"];
    verified = json["verified_packages"];
  }

  Map<String, dynamic> toJson() => {
        "city_name": cityName,
        "platform_type": platformType,
        "treatment_name": tretmentName,
        "package_name": searchtreatment,
        "offset": offset,
        "rating": rating,
        "services": services,
        "prices": prices,
        "verified_packages": verified,
      };
}

////////////////////////////////////////////////////////////////////////////////

class SearchListResponseModel {
  int? status;
  String? message;
  Data? data;
  int? verifiedProvidersCount;
  int? excellentCount;
  int? veryGoodCount;
  int? goodCount;
  int? fairCount;
  int? badCount;
  int? allTreatmentCount;
  int? fullPackageCount;
  int? accommodationCount;
  int? transportationCount;
  int? tourCount;
  int? visaCount;
  int? translateCount;
  int? ambulanceCount;
  int? ticketCount;
  int? zerototen;
  int? tentotwenty;
  int? twentytofifty;
  int? fiftytoseventy;
  int? seventytohundres;
  int? hundrestoabove;

  SearchListResponseModel({
    this.status,
    this.message,
    this.data,
    this.verifiedProvidersCount,
    this.excellentCount,
    this.veryGoodCount,
    this.goodCount,
    this.fairCount,
    this.badCount,
    this.allTreatmentCount,
    this.fullPackageCount,
    this.accommodationCount,
    this.transportationCount,
    this.tourCount,
    this.visaCount,
    this.translateCount,
    this.ambulanceCount,
    this.ticketCount,
    this.zerototen,
    this.tentotwenty,
    this.twentytofifty,
    this.fiftytoseventy,
    this.seventytohundres,
    this.hundrestoabove,
  });

  factory SearchListResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchListResponseModel(
        status: json["status"],
        message: json["message"],
        verifiedProvidersCount: json['verified_providers_count'],
        excellentCount: json["excellent_count"],
        veryGoodCount: json["very_good_count"],
        goodCount: json["good_count"],
        fairCount: json["fair_count"],
        badCount: json["bad_count"],
        allTreatmentCount: json["all_treatment_count"],
        fullPackageCount: json["full_package_count"],
        accommodationCount: json['accommodation_count'],
        transportationCount: json['transportation_count'],
        tourCount: json['tour_count'],
        visaCount: json['visa_count'],
        translateCount: json['translate_count'],
        ambulanceCount: json['ambulance_count'],
        ticketCount: json['ticket_count'],
        zerototen: json["zerototen"],
        tentotwenty: json["tentotwenty"],
        twentytofifty: json["twentytofifty"],
        fiftytoseventy: json["fiftytoseventy"],
        seventytohundres: json["seventytohundres"],
        hundrestoabove: json["hundrestoabove"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "verified_providers_count": verifiedProvidersCount,
        "excellent_count": excellentCount,
        "very_good_count": veryGoodCount,
        "good_count": goodCount,
        "fair_count": fairCount,
        "bad_count": badCount,
        "all_treatment_count": allTreatmentCount,
        "full_package_count": fullPackageCount,
        "accommodation_count": accommodationCount,
        "transportation_count": transportationCount,
        "tour_count": tourCount,
        "visa_count": visaCount,
        "translate_count": translateCount,
        "ambulance_count": ambulanceCount,
        "ticket_count": ticketCount,
        "zerototen": zerototen,
        "tentotwenty": tentotwenty,
        "twentytofifty": twentytofifty,
        "fiftytoseventy": fiftytoseventy,
        "seventytohundres": seventytohundres,
        "hundrestoabove": hundrestoabove,
        "data": data?.toJson(),
      };
}

class Data {
  List<PackageList>? packageList;

  Data({
    this.packageList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        packageList: json["package_list"] == null
            ? []
            : List<PackageList>.from(
                json["package_list"]!.map((x) => PackageList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "package_list": packageList == null
            ? []
            : List<dynamic>.from(packageList!.map((x) => x.toJson())),
      };
}

class PackageList {
  int? id;
  String? packageUniqueNo;
  String? treatmentName;
  String? packageName;
  String? treatmentPeriodInDays;
  dynamic otherServices;
  String? packagePrice;
  String? salePrice;
  String? productCategoryName;
  String? productSubCategoryName;
  String? cityName;
  String? verified;
  String? featuredStatus;
  String? disscountPercent;
  String? packagePurchase;

  PackageList({
    this.id,
    this.packageUniqueNo,
    this.packageName,
    this.treatmentPeriodInDays,
    this.treatmentName,
    this.otherServices,
    this.packagePrice,
    this.salePrice,
    this.productCategoryName,
    this.productSubCategoryName,
    this.cityName,
    this.verified,
    this.featuredStatus,
    this.disscountPercent,
    this.packagePurchase,
  });

  factory PackageList.fromJson(Map<String, dynamic> json) => PackageList(
        id: json["id"] ?? '',
        packageUniqueNo: json["package_unique_no"] ?? '',
        treatmentName: json["treatment_name"] ?? '',
        packageName: json["package_name"] ?? '',
        treatmentPeriodInDays: json["treatment_period_in_days"] ?? '',
        otherServices: json["other_services"] ?? '',
        packagePrice: json["package_price"] ?? '',
        salePrice: json["sale_price"] ?? '',
        productCategoryName: json["product_category_name"] ?? '',
        productSubCategoryName: json["product_sub_category_name"] ?? '',
        cityName: json["city_name"] ?? '',
        verified: json["verified"] ?? '',
        featuredStatus: json["featured_status"] ?? '',
        disscountPercent: json["package_discount"] ?? '',
        packagePurchase: json["package_purchase"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "package_unique_no": packageUniqueNo ?? '',
        "package_name": packageName ?? '',
        "treatment_period_in_days": treatmentPeriodInDays ?? '',
        "other_services": otherServices ?? '',
        "package_price": packagePrice ?? '',
        "sale_price": salePrice ?? '',
        "product_category_name": productCategoryName ?? '',
        "product_sub_category_name": productSubCategoryName ?? '',
        "city_name": cityName ?? '',
        "verified": verified ?? '',
        "featured_status": featuredStatus ?? '',
        "discount_percent": disscountPercent ?? '',
        "package_purchase": packagePurchase ?? '',
      };
}

////////////////////////////////////////////////////////////////////////////////


