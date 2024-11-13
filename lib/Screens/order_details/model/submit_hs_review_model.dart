class HSAddReviewNewRequestModel {
  String? packageId;
  String? feedback;
  String? behaviourReviews;
  String? recommendedService;
  String? purchaseId;
  String? treatment;

  HSAddReviewNewRequestModel(
      {this.packageId,
      this.purchaseId,
      this.behaviourReviews,
      this.treatment,
      this.recommendedService,
      this.feedback});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['purchase_id'] = packageId;
    data['package_id'] = purchaseId;
    data['behaviour_reviews'] = behaviourReviews;
    data['recommended_service'] = recommendedService;
    data['treatment'] = treatment;
    data['extra_notes'] = feedback;
    return data;
  }
}

///////////////////////////////////////////////////////////////
class HSAddReviewNewResponseModel {
  int? status;
  String? message;

  HSAddReviewNewResponseModel({this.status, this.message});

  HSAddReviewNewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
