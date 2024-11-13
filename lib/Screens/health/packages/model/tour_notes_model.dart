class TourNOtesResponseModel {
  int? status;
  String? message;

  TourNOtesResponseModel({
    required this.status,
    required this.message,
  });
  TourNOtesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
////////////////////////////////////

class TourNOtesRequestModel {
  String? notes;
  String? purchaseId;
  TourNOtesRequestModel({
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
