class CaLiveRequestModel {
  String? roomId;

  CaLiveRequestModel({
    this.roomId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["room_id"] = roomId;

    return data;
  }
}

//////////////////////////////////////////////
class CancelledLiveResponseModel {
  int? status;
  String? message;

  CancelledLiveResponseModel({
    required this.status,
    required this.message,
  });
  CancelledLiveResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
