class ShowShopOrderReviewRequestModel {
  String? orderID;
  String? id;
  ShowShopOrderReviewRequestModel({
    this.orderID,
    this.id,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["order_id"] = orderID;
    data["id"] = id;
    return data;
  }
}

//////////////////////////////////////////////////
class ShowShopOrderResponseModel {
  String? status; //
  String? message;
  int? recommendation; //
  int? rating; //
  String? feedback; //
  // ShowShopdReviewdata? showshopreviewdata;

  ShowShopOrderResponseModel({
    required this.status,
    required this.message,
    // required this.showshopreviewdata,
    required this.recommendation,
    required this.rating,
    required this.feedback,
  });
  ShowShopOrderResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    feedback = json["feedback"];
    rating = json["rating"];
    recommendation = json["recommendation"];
    // showshopreviewdata = json['data'] != null
    //     ? ShowShopdReviewdata.fromJson(json['data'])
    //     : null;
  }
}

class ShowShopdReviewdata {
  int? recommendation;
  int? rating;
  String? feedback;

  ShowShopdReviewdata({
    required this.recommendation,
    required this.rating,
    required this.feedback,
  });
  ShowShopdReviewdata.fromJson(Map<String, dynamic> json) {
    feedback = json["feedback"];
    rating = json["rating"];
    recommendation = json["recommendation"];
  }
}
