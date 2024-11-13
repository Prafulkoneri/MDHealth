class HotelRequestMOdel {
  String? id;
  HotelRequestMOdel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}

class HotelReposonseMOdel {
  int? status;
  String? message;
  HotelList? hotelList;
  // List<String>? otherServices;

  HotelReposonseMOdel({
    required this.status,
    required this.message,
    required this.hotelList,
    // required this.otherServices,
  });
  HotelReposonseMOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    hotelList = json['hotel_list'] != null
        ? HotelList.fromJson(json['hotel_list'])
        : null;
  }
}

class HotelList {
  int? id;
  String? hotelName;
  String? hotelAddress;
  String? hotelImagePath;
  String? hotelStarts;
  List<String>? hotelOtherServices;

  HotelList({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelImagePath,
    required this.hotelOtherServices,
    required this.hotelStarts,
  });
  HotelList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    hotelName = json["hotel_name"];
    hotelAddress = json["hotel_address"];
    hotelImagePath = json["hotel_image_path"];
    hotelStarts = json["hotel_stars"];
    hotelOtherServices = json["hotel_other_services"] != null
        ? List<String>.from(json["hotel_other_services"]!.map((x) => x))
        : null;
  }
}
