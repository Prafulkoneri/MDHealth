class ShowFoodOrderReviewRequestModel {
  String? orderID;
  ShowFoodOrderReviewRequestModel({
    this.orderID,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["order_id"] = orderID;
    return data;
  }
}

//////////////////////////////////////////////////
class ShowFoodOrderResponseModel {
  int? status;
  String? message;
  ShowFoodReviewdata? showfoodreviewdata;

  ShowFoodOrderResponseModel({
    required this.status,
    required this.message,
    required this.showfoodreviewdata,
  });
  ShowFoodOrderResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    showfoodreviewdata =
        json['data'] != null ? ShowFoodReviewdata.fromJson(json['data']) : null;
  }
}

class ShowFoodReviewdata {
  int? recommendation;
  int? rating;
  String? feedback;

  ShowFoodReviewdata({
    required this.recommendation,
    required this.rating,
    required this.feedback,
  });
  ShowFoodReviewdata.fromJson(Map<String, dynamic> json) {
    feedback = json["feedback"];
    rating = json["rating"];
    recommendation = json["recommendation"];
  }
}
