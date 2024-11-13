class CancelledPurchesPackageList {
  int? status;
  String? message;
  List<CustomerPurchasePackageCanclledList>?
      customerPurchasePackageCancelledList;

  CancelledPurchesPackageList({
    required this.status,
    required this.message,
    required this.customerPurchasePackageCancelledList,
  });
  CancelledPurchesPackageList.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];

    if (json["customer_purchase_package_cancelled_list"] != null) {
      customerPurchasePackageCancelledList =
          <CustomerPurchasePackageCanclledList>[];
      json["customer_purchase_package_cancelled_list"].forEach((v) {
        customerPurchasePackageCancelledList!
            .add(CustomerPurchasePackageCanclledList.fromJson(v));
      });
    }
  }
}

class CustomerPurchasePackageCanclledList {
  int? id;
  String? packageName;
  String? treatmentPeriodInDays;
  String? productCategoryName;
  String? cityName;
  String? companyName;
  String? companyLogoImagePath;
  String? treatmentName;
  String? type;
  int? packageId;

  CustomerPurchasePackageCanclledList({
    required this.id,
    required this.packageName,
    required this.treatmentPeriodInDays,
    required this.productCategoryName,
    required this.cityName,
    required this.companyName,
    required this.companyLogoImagePath,
    required this.treatmentName,
    required this.type,
    required this.packageId,
  });
  CustomerPurchasePackageCanclledList.fromJson(Map<String, dynamic> json) {
    id = json["purchase_id"];
    packageId = json["package_id"];

    type = json["type"];
    packageName = json["package_name"];
    packageName = json["package_name"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
    productCategoryName = json["product_category_name"];
    cityName = json["city_name"];
    companyName = json["company_name"];
    companyLogoImagePath = json["company_logo_image_path"];
    treatmentName = json["treatment_name"];
  }
}
