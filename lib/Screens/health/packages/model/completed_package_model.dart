class CompletedPurchesPackageList {
  int? status;
  String? message;
  List<CustomerPurchasePackageCompletedList>?
      customerPurchasePackageCompletedList;

  CompletedPurchesPackageList({
    required this.status,
    required this.message,
    required this.customerPurchasePackageCompletedList,
  });
  CompletedPurchesPackageList.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];

    if (json["customer_purchase_package_completed_list"] != null) {
      customerPurchasePackageCompletedList =
          <CustomerPurchasePackageCompletedList>[];
      json["customer_purchase_package_completed_list"].forEach((v) {
        customerPurchasePackageCompletedList!
            .add(CustomerPurchasePackageCompletedList.fromJson(v));
      });
    }
  }
}

class CustomerPurchasePackageCompletedList {
  int? id;
  String? packageName;
  String? treatmentPeriodInDays;
  String? productCategoryName;
  String? cityName;
  String? companyName;
  String? companyLogoImagePath;
  String? treatmentName;
  int? packageId;
  String? type;
  String? reviewFound;
  int? purchaseId;

  CustomerPurchasePackageCompletedList({
    required this.id,
    required this.packageName,
    required this.treatmentPeriodInDays,
    required this.productCategoryName,
    required this.cityName,
    required this.companyName,
    required this.companyLogoImagePath,
    required this.treatmentName,
    required this.packageId,
    required this.type,
    required this.reviewFound,
    required this.purchaseId,
  });
  CustomerPurchasePackageCompletedList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageId = json["package_id"];
    packageName = json["package_name"];
    packageName = json["package_name"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
    productCategoryName = json["product_category_name"];
    cityName = json["city_name"];
    companyName = json["company_name"];
    companyLogoImagePath = json["company_logo_image_path"];
    treatmentName = json["treatment_name"];
    type = json["type"];
    reviewFound = json["review_found"];
    purchaseId = json["purchase_id"];
  }
}
