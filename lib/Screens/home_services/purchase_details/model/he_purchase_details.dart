class HsPurchaseDetailsResponseModel {
  String? status;
  String? message;
  PurchaseDetails? purchaseDetails;
  List<OtherService>? otherServices;

  HsPurchaseDetailsResponseModel({
    required this.status,
    required this.message,
    required this.purchaseDetails,
    required this.otherServices,
  });
  HsPurchaseDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    purchaseDetails = json['purchase_details'] != null
        ? PurchaseDetails.fromJson(json['purchase_details'])
        : null;
    if (json["other_services"] != null) {
      otherServices = <OtherService>[];
      json["other_services"].forEach((v) {
        otherServices!.add(OtherService.fromJson(v));
      });
    }
  }
}

class OtherService {
  String? id;
  String? title;
  String? price;
  // String? hotelStars;
  String? pricePercentage;

  OtherService({
    required this.id,
    required this.title,
    required this.price,
    // this.hotelStars,
    required this.pricePercentage,
  });
  OtherService.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    price = json["price"];
    id = json["id"];
    pricePercentage = json["price_percentage"];
  }
}

class PurchaseDetails {
  String? id;
  String? packageName;
  String? treatmentPeriodInDays;
  String? cityName;
  String? treatmentPrice;
  String? hotelName;
  String? hotelAcommoditionPrice;
  String? transportationAcommoditionPrice;
  String? tourPrice;
  String? visaServicePrice;
  String? authorisationFullName;
  String? providerId;
  String? salePrice;
  String? packagePrice;
  String? packageDiscount;
  String? translationPrice;
  String? ambulanceServicePrice;
  String? ticketPrice;
  String? hotelStars;
  String? vehicleModelId;
  String? tourName;
  String? packageId;
  String? vehicleModelName;
  String? transportationPrice;
  String? twentyPercent;
  String? thirtyPercent;
  String? fiftyPercent;
  String? hundredPercent;
  String? verified;

  PurchaseDetails({
    required this.id,
    required this.packageName,
    required this.treatmentPeriodInDays,
    required this.cityName,
    required this.treatmentPrice,
    required this.hotelName,
    required this.hotelAcommoditionPrice,
    required this.transportationAcommoditionPrice,
    required this.tourPrice,
    required this.visaServicePrice,
    required this.authorisationFullName,
    required this.providerId,
    required this.salePrice,
    required this.packagePrice,
    required this.packageDiscount,
    required this.translationPrice,
    required this.ambulanceServicePrice,
    required this.ticketPrice,
    required this.hotelStars,
    required this.vehicleModelId,
    required this.tourName,
    required this.packageId,
    required this.vehicleModelName,
    required this.transportationPrice,
    required this.twentyPercent,
    required this.thirtyPercent,
    required this.fiftyPercent,
    required this.hundredPercent,
    required this.verified,
  });
  PurchaseDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageName = json["package_name"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
    cityName = json["city_name"];
    treatmentPrice = json["treatment_price"];
    salePrice = json["sale_price"];
    packagePrice = json["package_price"];
    packageDiscount = json["package_discount"];
    packageId = json["package_id"];
    verified = json["verified"];
  }
}

////////////////////////////////////////////////////////////////////////////
class HsPurchaseDetailsRequestModel {
  String? packageId;
  String? purchaseType;

  HsPurchaseDetailsRequestModel({
    this.packageId,
    this.purchaseType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["type"] = purchaseType;
    return data;
  }
}
