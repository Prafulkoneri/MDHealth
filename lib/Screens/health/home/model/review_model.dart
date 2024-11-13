class ReviewModelResponseModel {
  String? status;
  String? message;
  String? reviewCount;

  ReviewModelResponseModel({
    required this.status,
    required this.message,
    required this.reviewCount,
  });
  ReviewModelResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    reviewCount = json["review_found"];
  }
}
