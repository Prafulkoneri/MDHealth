class TransportationRequestModel {
  String? id;
  TransportationRequestModel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}
////////////////////////////////////////////////////////////////////////////////////

class TransportationResponseModel {
  int? status;
  String? message;
  TransportationDetails? transportationDetails;
  List<String>? otherServicest;

  TransportationResponseModel({
    required this.status,
    required this.message,
    required this.transportationDetails,
    required this.otherServicest,
  });
  TransportationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    transportationDetails = json['transportation_details'] != null
        ? TransportationDetails.fromJson(json['transportation_details'])
        : null;
    otherServicest = json["other_services"] != null
        ? List<String>.from(json["other_services"]!.map((x) => x))
        : null;
  }
}

class TransportationDetails {
  int? id;
  String? status;
  String? brandName;
  String? vehicleModelId;
  String? vehiclePerDayPrice;
  String? vehicleLevelName;
  String? vehicleImagePath;

  TransportationDetails({
    required this.id,
    required this.status,
    required this.brandName,
    required this.vehicleModelId,
    required this.vehiclePerDayPrice,
    required this.vehicleLevelName,
    required this.vehicleImagePath,
  });
  TransportationDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    status = json["hotel_name"];
    brandName = json["brand_name"];
    vehicleModelId = json["vehicle_model_id"];
    vehiclePerDayPrice = json["vehicle_per_day_price"];
    vehicleLevelName = json["vehicle_level_name"];
    vehicleImagePath = json["vehicle_image_path"];
  }
}
