class CancelledRequestModel {
  String? id;
  String? purchesId;
  String? cancelledReason;

  CancelledRequestModel({
    this.id,
    this.cancelledReason,
    this.purchesId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["purchase_id"] = purchesId;
    data["cancellation_reason"] = cancelledReason;
    data["id"] = id;

    return data;
  }
}

////////////////////////
class CancelledResponseModel {
  int? status;
  String? message;

  CancelledResponseModel({
    required this.status,
    required this.message,
  });
  CancelledResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
