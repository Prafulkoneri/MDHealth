// class PurchaseDetailsRequestModel {
//   String? packageId;
//   String? salePrice;
//   String? percentage;
//   String? price;
//   List<String>? otherService;

//   PurchaseDetailsRequestModel({
//     this.packageId,
//     this.salePrice,
//     this.percentage,
//     this.price,
//     this.otherService,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data["package_id"] = packageId;
//     data["sale_price"] = salePrice;
//     data["percentage"] = percentage;
//     data["price"] = price;
//     data["other_services"] = otherService;
//     return data;
//   }
// }

// //////////////////////////////////////////////////////////////////////
// class LastPurchaseDetailsResponseModel {
//   int? status;
//   String? message;
//   PurchaseDetailsLast? purchaseDetailslast;
//   List<OtherService>? otherServices;

//   LastPurchaseDetailsResponseModel({
//     required this.status,
//     required this.message,
//     required this.purchaseDetailslast,
//     required this.otherServices,
//   });
//   LastPurchaseDetailsResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     purchaseDetailslast = json['purchase_details'] != null
//         ? PurchaseDetailsLast.fromJson(json['purchase_details'])
//         : null;

//   if (json["discounts"] != null) {
//     otherServices = <OtherService>[];
//     json["discounts"].forEach((v) {
//       otherServices!.add(OtherService.fromJson(v));
//     });
//   }
// }
// }

// class OtherService {
//   int? id;
//   String? title;
//   String? price;
//   String? hotelName;
//   int? pricePercentage;

//   OtherService({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.hotelName,
//     required this.pricePercentage,
//   });
//   OtherService.fromJson(Map<String, dynamic> json) {
//     title = json["title"];
//     id = json["id"];
//     price = json["price"];
//     hotelName = json["hotel_name"];
//     pricePercentage = json["price_percentage"];
//   }
// }

// class PurchaseDetailsLast {
//   int? id;
//   String? cityName;
//   String? treatmentPrice;
//   String? hotelName;
//   String? hotelAcommoditionPrice;
//   String? vehicleModelId;
//   String? transportationAcommoditionPrice;
//   String? tourName;
//   String? tourPrice;
//   String? visaServicePrice;
//   String? authorisationFullName;
//   int? providerId;
//   String? salePrice;
//   String? packagePrice;
//   String? packageDiscount;
//   int? packageId;
//   String? percentage;
//   String? price;
//   String? vehicleModelName;
//   String? treatmentName;

//   PurchaseDetailsLast({
//     required this.id,
//     required this.cityName,
//     required this.treatmentPrice,
//     required this.hotelName,
//     required this.hotelAcommoditionPrice,
//     required this.vehicleModelId,
//     required this.transportationAcommoditionPrice,
//     required this.tourName,
//     required this.tourPrice,
//     required this.visaServicePrice,
//     required this.authorisationFullName,
//     required this.providerId,
//     required this.salePrice,
//     required this.packagePrice,
//     required this.packageDiscount,
//     required this.packageId,
//     required this.percentage,
//     required this.price,
//     required this.vehicleModelName,
//     required this.treatmentName,
//   });
//   PurchaseDetailsLast.fromJson(Map<String, dynamic> json) {
//     id = json["id"]; //
//     treatmentPrice = json["treatment_price"]; //
//     hotelName = json["hotel_name"]; //
//     authorisationFullName = json["percentage"]; //
//     hotelAcommoditionPrice = json["hotel_acommodition_price"]; //
//     vehicleModelId = json["vehicle_model_id"]; //
//     transportationAcommoditionPrice =
//         json["transportation_acommodition_price"]; //
//     tourName = json["tour_name"]; //
//     tourPrice = json["tour_price"]; //
//     visaServicePrice = json["visa_service_price"]; //
//     treatmentName = json["treatment_name"]; //
//     providerId = json["percentage"]; //
//     packageId = json["package_id  "]; //
//     salePrice = json["sale_price"]; //
//     percentage = json["percentage"]; //
//     price = json["price"]; //
//     vehicleModelName = json["vehicle_model_name"]; //
//   }
// }
import 'dart:convert';

class PurchaseDetailsRequestModel {
  String? salePrice;
  String? percentage;
  String? purchaseType;
  String? price;
  String? packageId;
  String? purchesId;
  String? paymentType;
  List<String>? otherService;

  PurchaseDetailsRequestModel({
    this.salePrice,
    this.percentage,
    this.purchaseType,
    this.price,
    this.packageId,
    this.purchesId,
    this.otherService,
    this.paymentType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "sale_price": salePrice,
      "package_id": packageId,
      "percentage": percentage,
      "purchase_id": purchesId,
      "type": purchaseType,
      "price": price,
      "other_services": otherService,
      "payment_method": paymentType,
    };
    // Convert the list to a JSON string
    data["other_services"] =
        otherService != null ? jsonEncode(otherService) : null;
    return data;
  }
}

////////////////////////////////////////////////////////////
class LastPurchaseDetailsResponseModel {
  int? status;
  String? message;
  PurchaseDetailsDataLast? purchaseDetailsDataLast;
  List<OtherService>? otherServices;
  LastPurchaseDetailsResponseModel({
    required this.status,
    required this.message,
    required this.purchaseDetailsDataLast,
  });
  LastPurchaseDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    purchaseDetailsDataLast = json['purchase_details'] != null
        ? PurchaseDetailsDataLast.fromJson(json['purchase_details'])
        : null;
    if (json["discounts"] != null) {
      otherServices = <OtherService>[];
      json["discounts"].forEach((v) {
        otherServices!.add(OtherService.fromJson(v));
      });
    }
  }
}

class OtherService {
  int? id;
  String? title;
  String? price;
  String? hotelName;
  int? pricePercentage;

  OtherService({
    required this.id,
    required this.title,
    required this.price,
    required this.hotelName,
    required this.pricePercentage,
  });
  OtherService.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    id = json["id"];
    price = json["price"];
    hotelName = json["hotel_name"];
    pricePercentage = json["price_percentage"];
  }
}

class PurchaseDetailsDataLast {
  int? id;
  String? treatmentPrice;
  String? hotelName;
  String? hotelAcommoditionPrice;
  String? vehicleModelId;
  String? transportationAcommoditionPrice;
  String? tourName;
  String? tourPrice;
  String? visaServicePrice;
  String? treatmentName;
  int? packageId;
  String? salePrice;
  String? percentage;
  String? price;
  String? vehicleModelName;
  PurchaseDetailsDataLast(
      {this.id, //
      this.treatmentPrice, //
      this.hotelName, //
      this.hotelAcommoditionPrice, //
      this.vehicleModelId, //
      this.transportationAcommoditionPrice, //
      this.tourName, //
      this.tourPrice, //
      this.visaServicePrice, //
      this.treatmentName, //
      this.packageId, //
      this.salePrice, //
      this.percentage, //
      this.price, //
      this.vehicleModelName});
  PurchaseDetailsDataLast.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    treatmentPrice = json["treatment_price"];
    hotelName = json["hotel_name"];
    hotelAcommoditionPrice = json["hotel_acommodition_price"];
    vehicleModelId = json["vehicle_model_id"]; //
    transportationAcommoditionPrice =
        json["transportation_acommodition_price"]; //
    tourName = json["tour_price"]; //
    tourPrice = json["tour_price"]; //
    visaServicePrice = json["visa_service_price"]; //
    treatmentName = json["treatment_name"]; //
    packageId = json["package_id"]; //
    salePrice = json["sale_price"]; //
    percentage = json["percentage"]; //
    price = json["price"]; //
    vehicleModelName = json["vehicle_model_name"]; //
  }
}
