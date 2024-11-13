class HsReviewListResponseModel {
  String? status;
  String? message;
  HsReviewlistData? hsReviewlistdata;

  HsReviewListResponseModel({
    this.status,
    this.message,
    this.hsReviewlistdata,
  });
  HsReviewListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    hsReviewlistdata =
        json['data'] != null ? HsReviewlistData.fromJson(json['data']) : null;
  }
}

class HsReviewlistData {
  List<NewHsReviewsList>? newHsreviewsList;
  String? totalReviews;
  String? average;
  String? stars;
  String? verboseReview;

  HsReviewlistData({
    this.newHsreviewsList,
    this.totalReviews,
    this.average,
    this.stars,
    this.verboseReview,
  });
  HsReviewlistData.fromJson(Map<String, dynamic> json) {
    totalReviews = json["total_reviews"];
    average = json["average"];
    stars = json["stars"];
    verboseReview = json["verbose_review"];
    if (json["reviews_list"] != null) {
      newHsreviewsList = <NewHsReviewsList>[];
      json["reviews_list"].forEach((v) {
        newHsreviewsList!.add(NewHsReviewsList.fromJson(v));
      });
    }
  }
}

class NewHsReviewsList {
  String? packageId;
  String? extraNotes;
  String? date;
  String? fullName;
  String? packageName;
  String? personAvgStars;

  NewHsReviewsList({
    this.packageId,
    this.extraNotes,
    this.date,
    this.fullName,
    this.packageName,
    this.personAvgStars,
  });
  NewHsReviewsList.fromJson(Map<String, dynamic> json) {
    packageId = json["package_id"];
    extraNotes = json["extra_notes"];
    date = json["date"];
    fullName = json["full_name"];
    packageName = json["package_name"];
    personAvgStars = json["person_avg_stars"];
  }
}

//////////////////////////////////////////////////////////////
class HomeServicesReViewlistRequestModel {
  String? packageId;

  HomeServicesReViewlistRequestModel({
    this.packageId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    return data;
  }
}
