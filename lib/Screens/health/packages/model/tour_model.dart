class TourResponseModel {
  int? status;
  String? message;
  TourDetails? tourDetails;
  List<String>? otherServicestour;

  TourResponseModel({
    required this.status,
    required this.message,
    required this.tourDetails,
    required this.otherServicestour,
  });
  TourResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    tourDetails = json['tour_details'] != null
        ? TourDetails.fromJson(json['tour_details'])
        : null;
    otherServicestour = json["tour_other_services"] != null
        ? List<String>.from(json["tour_other_services"]!.map((x) => x))
        : null;
  }
}

class TourDetails {
  int? id;
  String? tourName;
  String? tourDescription;
  String? tourDays;
  String? tourImagePath;
  String? tourPrice;
  List<String>? tourOtherServicesTour;

  TourDetails({
    required this.id,
    required this.tourName,
    required this.tourDescription,
    required this.tourDays,
    required this.tourImagePath,
    required this.tourPrice,
    required this.tourOtherServicesTour,
  });
  TourDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tourName = json["tour_name"];
    tourDescription = json["tour_description"];
    tourDays = json["tour_days"];
    tourImagePath = json["tour_image_path"];
    tourPrice = json["tour_price"];
    tourOtherServicesTour = json["tour_other_services"] != null
        ? List<String>.from(json["tour_other_services"]!.map((x) => x))
        : null;
  }
}

////////////////////////////////////
class TourRequestModel {
  String? id;
  TourRequestModel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}
