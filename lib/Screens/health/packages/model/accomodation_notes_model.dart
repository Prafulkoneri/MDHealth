class AccomodationResponseMOdel {
  int? status;
  String? message;

  AccomodationResponseMOdel({
    required this.status,
    required this.message,
  });
  AccomodationResponseMOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
////////////////////////////////////

class AccomodationRequestModel {
  String? notes;
  String? purchaseId;
  AccomodationRequestModel({
    this.notes,
    this.purchaseId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["notes"] = notes;
    data["purchase_id"] = purchaseId;

    return data;
  }
}
