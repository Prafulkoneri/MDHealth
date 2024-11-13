class BankListModel {
  int? status;
  String? message;
  List<CustomerReviewsDatum>? customerReviewsData;
  int? customerReviewsCount;
  String? customerReviewsAverage;

  BankListModel({
    required this.status,
    required this.message,
    required this.customerReviewsData,
    required this.customerReviewsCount,
    required this.customerReviewsAverage,
  });
  BankListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    customerReviewsCount = json["customer_reviews_count"];
    customerReviewsAverage = json["customer_reviews_average"];
    if (json["customer_reviews_data"] != null) {
      customerReviewsData = <CustomerReviewsDatum>[];
      json["customer_reviews_data"].forEach((v) {
        customerReviewsData!.add(CustomerReviewsDatum.fromJson(v));
      });
    }
  }
}

class CustomerReviewsDatum {
  int? id;
  int? packageId;
  int? customerId;
  int? purchaseId;
  String? reviewFeedback; // review
  String? packageName; //
  String? customerName; //
  String? date; //
  String? average;
  String? ratingLabel;
  int? stars;

  CustomerReviewsDatum({
    required this.id,
    required this.packageId,
    required this.customerId,
    required this.purchaseId,
    required this.reviewFeedback,
    required this.packageName,
    required this.customerName,
    required this.date,
    required this.average,
    this.ratingLabel,
    this.stars,
  });
  CustomerReviewsDatum.fromJson(Map<String, dynamic> json) {
    id = json["id"]; //
    packageName = json["package_name"]; //
    customerId = json["customer_id"]; //
    purchaseId = json["purchase_id"]; //
    reviewFeedback = json["review"]; //
    packageId = json["package_id"]; //
    customerName = json["user_full_name"]; //
    date = json["review_date"]; //
    average = json["average"]; //
    ratingLabel = json['rating_label'];
    stars = json['stars'];
  }
}

/////////////////////////////////////////////////////
class ReviewRequestModel {
  String? packageId;

  ReviewRequestModel({
    this.packageId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;

    return data;
  }
}
