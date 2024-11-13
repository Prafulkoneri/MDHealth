class ReviewCountResponseModel {
  int? status;
  String? message;
  // List<ReviewCountData>? reviewCountData;
  ReviewCountData? reviewCountData;

  ReviewCountResponseModel({
    this.status,
    this.message,
    this.reviewCountData,
  });
  ReviewCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    reviewCountData =
        json['data'] != null ? ReviewCountData.fromJson(json['data']) : null;
  }
}

class ReviewCountData {
  int? excellent;
  int? veryGood;
  int? good;
  int? fair;
  int? bad;

  ReviewCountData({
    this.excellent,
    this.veryGood,
    this.good,
    this.fair,
    this.bad,
  });
  ReviewCountData.fromJson(Map<String, dynamic> json) {
    excellent = json["excellent"];
    veryGood = json["very_good"];
    good = json["good"];
    fair = json["fair"];
    bad = json["bad"];
  }
}

class ReviewCategory {
  final String name;
  final int starCount;
  final int? reviewCount;

  ReviewCategory(this.name, this.starCount, this.reviewCount);
}
