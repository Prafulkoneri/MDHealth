class WirteReviewRequestModel {
  String? packageId;
  String? purchaseId;
  String? treatment;
  String? behaviorValue;
  String? recommanded;
  String? notes;

  WirteReviewRequestModel({
    this.packageId,
    this.purchaseId,
    this.treatment,
    this.recommanded,
    this.behaviorValue,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["purchase_id"] = purchaseId;
    data["treatment"] = treatment;
    data["recommended_service"] = recommanded;
    data["behaviour_reviews"] = behaviorValue;
    data["extra_notes"] = notes;
    return data;
  }
}

////////////////////////////////////////
class WirteReviewResponseModel {
  int? status;
  String? message;

  WirteReviewResponseModel({
    required this.status,
    required this.message,
  });
  WirteReviewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
