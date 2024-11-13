import 'dart:convert';

class NLastHsPurchaseDetailsRequestModel {
  String? salePrice;
  String? percentage;
  String? price;
  String? purchaseType;
  String? paymentType;
  String? packageId;
  String? purchesId;
  String? patientID;
  List<String>? otherService;

  NLastHsPurchaseDetailsRequestModel({
    this.salePrice,
    this.percentage,
    this.purchaseType,
    this.price,
    this.packageId,
    this.patientID,
    this.purchesId,
    this.paymentType,
    this.otherService,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "sale_price": salePrice,
      "package_id": packageId,
      "percentage": percentage,
      "purchase_id": purchesId,
      "patient_id": patientID,
      "type": purchaseType,
      "payment_type": paymentType,
      "price": price,
      "other_services": otherService,
    };
    data["other_services"] =
        otherService != null ? jsonEncode(otherService) : null;
    return data;
  }
}

//////////////////////////////////////////////
class NHsLastPurchaseDetailsResponseModel {
  int? status;
  String? message;
  PurchaseDetailsDataLast? purchaseDetailsDataLast;
  List<OtherService>? otherServices;

  NHsLastPurchaseDetailsResponseModel({
    required this.status,
    required this.message,
    required this.purchaseDetailsDataLast,
    this.otherServices,
  });

  NHsLastPurchaseDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    purchaseDetailsDataLast = json['purchase_details'] != null
        ? PurchaseDetailsDataLast.fromJson(json['purchase_details'])
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
    id = json["id"] != null ? int.tryParse(json["id"].toString()) : null;
    title = json["title"];
    price = json["price"];
    hotelName = json["hotel_name"];
    pricePercentage = json["price_percentage"] != null
        ? int.tryParse(json["price_percentage"].toString())
        : null;
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

  PurchaseDetailsDataLast({
    this.id,
    this.treatmentPrice,
    this.hotelName,
    this.hotelAcommoditionPrice,
    this.vehicleModelId,
    this.transportationAcommoditionPrice,
    this.tourName,
    this.tourPrice,
    this.visaServicePrice,
    this.treatmentName,
    this.packageId,
    this.salePrice,
    this.percentage,
    this.price,
    this.vehicleModelName,
  });

  PurchaseDetailsDataLast.fromJson(Map<String, dynamic> json) {
    id = json["id"] != null ? int.tryParse(json["id"].toString()) : null;
    treatmentPrice = json["treatment_price"];
    hotelName = json["hotel_name"];
    hotelAcommoditionPrice = json["hotel_acommodition_price"];
    vehicleModelId = json["vehicle_model_id"];
    transportationAcommoditionPrice = json["transportation_acommodition_price"];
    tourName = json["tour_name"];
    tourPrice = json["tour_price"];
    visaServicePrice = json["visa_service_price"];
    treatmentName = json["treatment_name"];
    packageId = json["package_id"] != null
        ? int.tryParse(json["package_id"].toString())
        : null;
    salePrice = json["sale_price"];
    percentage = json["percentage"];
    price = json["price"];
    vehicleModelName = json["vehicle_model_name"];
  }
}
