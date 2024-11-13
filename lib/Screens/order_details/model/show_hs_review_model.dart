class ShowHSOrderReviewRequestModel {
  String? orderID;
  ShowHSOrderReviewRequestModel({
    this.orderID,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["order_id"] = orderID;
    return data;
  }
}

//////////////////////////////////////////////////
class ShowHSOrderResponseModel {
  int? status;
  String? message;
  ShowHSReviewdata? showhsreviewdata;

  ShowHSOrderResponseModel({
    required this.status,
    required this.message,
    required this.showhsreviewdata,
  });
  ShowHSOrderResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    showhsreviewdata =
        json['data'] != null ? ShowHSReviewdata.fromJson(json['data']) : null;
  }
}

class ShowHSReviewdata {
  int? treatment;
  int? behaviourReviews;
  int? recommendation;
  String? extraNotes;

  ShowHSReviewdata({
    required this.treatment,
    required this.behaviourReviews,
    required this.recommendation,
    required this.extraNotes,
  });
  ShowHSReviewdata.fromJson(Map<String, dynamic> json) {
    treatment = json["treatment"];
    behaviourReviews = json["behaviour_reviews"];
    recommendation = json["recommended_service"];
    extraNotes = json["extra_notes"];
  }
}
