class CompletedGetReviewRequestModel {
  String? purchaseId;

  CompletedGetReviewRequestModel({
    required this.purchaseId,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['purchase_id'] = purchaseId;
    return data;
  }
}

class CompletedGetReviewResponseModel {
  int? status;
  String? message;
  CustomerReviews? customerReviews;

  CompletedGetReviewResponseModel({
    this.status,
    this.message,
    this.customerReviews,
  });

  CompletedGetReviewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    customerReviews = json['CustomerReviews'] != null
        ? CustomerReviews.fromJson(json['CustomerReviews'])
        : null;
  }
}

class CustomerReviews {
  int? treatment;
  int? behaviorR;
  int? recommendSer;
  String? extraN;

  CustomerReviews({
    this.treatment,
    this.behaviorR,
    this.recommendSer,
    this.extraN,
  });

  CustomerReviews.fromJson(Map<String, dynamic> json) {
    treatment = json['treatment'];
    behaviorR = json['behaviour_reviews'];
    recommendSer = json['recommended_service'];
    extraN = json['extra_notes'];
  }
}
