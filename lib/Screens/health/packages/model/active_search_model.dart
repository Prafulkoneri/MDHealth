// class ActivePurchesPackageListSearch {
//   int? status;
//   String? message;
//   List<CustomerPurchasePackageActiveList>?
//       customerPurchasePackageActiveListsearch;

//   ActivePurchesPackageListSearch({
//     required this.status,
//     required this.message,
//     required this.customerPurchasePackageActiveListsearch,
//   });
//   ActivePurchesPackageListSearch.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];

//     if (json["customer_purchase_package_active_list"] != null) {
//       customerPurchasePackageActiveListsearch =
//           <CustomerPurchasePackageActiveList>[];
//       json["customer_purchase_package_active_list"].forEach((v) {
//         customerPurchasePackageActiveListsearch!
//             .add(CustomerPurchasePackageActiveList.fromJson(v));
//       });
//     }
//   }
// }

// class CustomerPurchasePackageActiveList {
//   int? id;
//   String? buttonType;
//   int? purchaseId;
//   String? packageName;
//   String? treatmentPeriodInDays;
//   String? productCategoryName;
//   String? cityName;
//   String? companyName;
//   String? companyLogoImagePathS;
//   String? treatmentName;
//   String? type;

//   CustomerPurchasePackageActiveList({
//     required this.id,
//     required this.buttonType,
//     required this.purchaseId,
//     required this.packageName,
//     required this.treatmentPeriodInDays,
//     required this.productCategoryName,
//     required this.cityName,
//     required this.companyName,
//     required this.companyLogoImagePathS,
//     required this.treatmentName,
//     required this.type,
//   });
//   CustomerPurchasePackageActiveList.fromJson(Map<String, dynamic> json) {
//     id = json["package_id"];
//     buttonType = json["button_type"];
//     purchaseId = json["purchase_id"];
//     type = json["type"];
//     packageName = json["package_name"];
//     packageName = json["package_name"];
//     treatmentPeriodInDays = json["treatment_period_in_days"];
//     productCategoryName = json["product_category_name"];
//     cityName = json["city_name"];
//     companyName = json["company_name"];
//     companyLogoImagePathS = json["company_logo_image_path"];
//     treatmentName = json["treatment_name"];
//   }
// }

////////////////////////////////////////////////////
class ActiveSearchPackgeRequestModel {
  // String? treatMentName;
  // String? cityName;
  String? packgeName;
  // String? compnyName;

  ActiveSearchPackgeRequestModel({
    // this.treatMentName,
    // this.cityName,
    this.packgeName,
    // this.compnyName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    // data["treatment_name"] = treatMentName;
    // data["city_name"] = cityName;
    data["package_name"] = packgeName;
    // data["company_name"] = compnyName;
    return data;
  }
}
