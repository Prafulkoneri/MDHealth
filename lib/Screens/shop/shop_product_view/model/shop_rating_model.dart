class ShopProductReviewResponseModel {
  int? status;
  String? message;
  int? totalReviews;
  int? totalAverageRating;
  List<ReviewsList>? reviewsList;

  ShopProductReviewResponseModel({
    required this.status,
    required this.message,
    required this.totalReviews,
    required this.totalAverageRating,
    required this.reviewsList,
  });
  ShopProductReviewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    totalReviews = json["total_reviews"];
    totalAverageRating = json["total_average_rating"];
    if (json["reviews_list"] != null) {
      reviewsList = <ReviewsList>[];
      json["reviews_list"].forEach((v) {
        reviewsList!.add(ReviewsList.fromJson(v));
      });
    }
  }
}

class ReviewsList {
  int? rating;
  String? feedback;
  String? createdAt;
  String? fullName;

  ReviewsList({
    required this.rating,
    required this.feedback,
    required this.createdAt,
    required this.fullName,
  });

  ReviewsList.fromJson(Map<String, dynamic> json) {
    rating = json["rating"];
    feedback = json["feedback"];
    createdAt = json["date"];
    fullName = json["full_name"];
  }
}

////////////////////////////////////////////////////////////
class ShopProductReviewRequestModel {
  String? id;

  ShopProductReviewRequestModel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}
