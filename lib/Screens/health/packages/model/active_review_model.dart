class ActiveReviewResponseMOdel {
  int? status;
  String? message;
  ReviewsScreenData? reviewsScreenDatas;

  ActiveReviewResponseMOdel({
    required this.status,
    required this.message,
    required this.reviewsScreenDatas,
  });
  ActiveReviewResponseMOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    reviewsScreenDatas = json['reviews_screen_data'] != null
        ? ReviewsScreenData.fromJson(json['reviews_screen_data'])
        : null;
  }
}

class ReviewsScreenData {
  String? accommodation;
  String? transportation;
  String? tourDetails;

  ReviewsScreenData({
    required this.accommodation,
    required this.transportation,
    required this.tourDetails,
  });
  ReviewsScreenData.fromJson(Map<String, dynamic> json) {
    accommodation = json["Accommodation"];
    transportation = json["Transportation"];
    tourDetails = json["Tour Details"];
  }
}

//////////////////////////////////////////////////////
class ActiveReviewRequestMOdel {
  String? purchaseId;
  ActiveReviewRequestMOdel({
    this.purchaseId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["purchase_id"] = purchaseId;
    return data;
  }
}
