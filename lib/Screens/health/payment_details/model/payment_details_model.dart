class PaymentDetailRequestModel {
  String? packageId;
  String? purchaseType;
  String? guestNumber;

  PaymentDetailRequestModel({
    this.packageId,
    this.purchaseType,
    this.guestNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["type"] = purchaseType;
    data["guest_number"] = guestNumber;

    return data;
  }
}

///////////////////////////////////////REsPONSE MODEL//////////////////////////
class PaymentDetailReponseModel {
  int? status;
  String? message;
  PurchaseDetails? purchaseDetails;
  List<OtherService>? otherServices;
  // List<Discount>? discounts;

  PaymentDetailReponseModel({
    required this.status,
    required this.message,
    required this.purchaseDetails,
    required this.otherServices,
    // required this.discounts,
  });
  PaymentDetailReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    purchaseDetails = json['purchase_details'] != null
        ? PurchaseDetails.fromJson(json['purchase_details'])
        : null;
    /////////////////////
    if (json["other_services"] != null) {
      otherServices = <OtherService>[];
      json["other_services"].forEach((v) {
        otherServices!.add(OtherService.fromJson(v));
      });
    }
    /////////////////////
    // if (json["discounts"] != null) {
    //   discounts = <Discount>[];
    //   json["discounts"].forEach((v) {
    //     discounts!.add(Discount.fromJson(v));
    //   });
    // }
  }
}

class OtherService {
  String? title;
  int? price;
  int? pricepercetage;
  int? id;

  OtherService({
    required this.title,
    required this.price,
    required this.id,
    required this.pricepercetage,
  });
  OtherService.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    price = json["price"];
    id = json["id"];
    pricepercetage = json["price_percentage"];
  }
}

// class Discount {
//   int? id;
//   String? percentage;
//   String? minimumDiscount;
//   String? title;
//   String? price;

//   Discount({
//     required this.id,
//     required this.percentage,
//     required this.minimumDiscount,
//     required this.title,
//     required this.price,
//   });
//   Discount.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     percentage = json["percentage"];
//     minimumDiscount = json["minimum_discount"];
//     title = json["title"];
//     price = json["price"];
//   }
// }

class PurchaseDetails {
  int? id;
  String? packageName;
  String? treatmentPeriodInDays;
  String? cityName;
  String? treatmentPrice;
  String? hotelName;
  String? hotelAcommoditionPrice;
  String? vehicleModelId;
  String? transportationAcommoditionPrice;
  String? authorisationFullName;
  int? providerId;
  String? salePrice;
  String? packagePrice;
  String? packageDiscount;
  int? packageId;
  String? vehicleModelName;
  String? transportationPrice;
  int? treatmentDiscountPrices;
  String? featuredStatus;
  String? verified;

  PurchaseDetails({
    required this.id,
    required this.packageName,
    required this.treatmentPeriodInDays,
    required this.cityName,
    required this.treatmentPrice,
    required this.hotelName,
    required this.hotelAcommoditionPrice,
    required this.vehicleModelId,
    required this.transportationAcommoditionPrice,
    required this.authorisationFullName,
    required this.providerId,
    required this.salePrice,
    required this.packagePrice,
    required this.packageDiscount,
    required this.packageId,
    required this.vehicleModelName,
    required this.transportationPrice,
    required this.treatmentDiscountPrices,
    required this.verified,
    required this.featuredStatus,
  });
  PurchaseDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageName = json["package_name"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
    cityName = json["city_name"];
    treatmentPrice = json["treatment_price"];
    hotelName = json["hotel_name"];
    hotelAcommoditionPrice = json["hotel_acommodition_price"];
    vehicleModelId = json["vehicle_model_id"];
    transportationAcommoditionPrice = json["transportation_acommodition_price"];
    authorisationFullName = json["authorisation_full_name"];
    providerId = json["provider_id"];
    salePrice = json["sale_price"];
    packagePrice = json["package_price"];
    packageDiscount = json["package_discount"];
    packageId = json["package_id"];
    vehicleModelName = json["vehicle_model_name"];
    transportationPrice = json["transportation_price"];
    treatmentDiscountPrices = json["treatment_discounted_price"];
    verified = json['verified'];
    featuredStatus = json['featured_status'];
  }
}
