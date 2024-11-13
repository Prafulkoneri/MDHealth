class LiveRequestModel {
  String? roomId;

  LiveRequestModel({
    this.roomId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["room_id"] = roomId;

    return data;
  }
}

//////////////////////////////////////////////
class LiveResponseModel {
  int? status;
  String? message;
  String? url;

  LiveResponseModel({
    required this.status,
    required this.message,
    required this.url,
  });
  LiveResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    url = json["url"];
  }
}
