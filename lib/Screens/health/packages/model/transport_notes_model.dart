class TransportNOtesResponseModel {
  int? status;
  String? message;

  TransportNOtesResponseModel({
    required this.status,
    required this.message,
  });
  TransportNOtesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
////////////////////////////////////

class TransportNOtesRequestModel {
  String? notes;
  String? purchaseId;
  TransportNOtesRequestModel({
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
