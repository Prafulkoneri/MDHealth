class FavDetailViewModelRes {
  int? status;
  String? message;
  List<FavDetailViewList>? favdetailViewList;

  FavDetailViewModelRes({
    required this.status,
    required this.message,
    required this.favdetailViewList,
  });
  FavDetailViewModelRes.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      favdetailViewList = <FavDetailViewList>[];
      json["data"].forEach((v) {
        favdetailViewList!.add(FavDetailViewList.fromJson(v));
      });
    }
  }
}

class FavDetailViewList {
  int? id;
  int? packageId;
  String? treatmentPeriodInDays;
  String? treatmentName;
  String? productCategoryName;
  String? cityName;
  String? salePrice;
  String? packageName;

  FavDetailViewList({
    required this.id,
    required this.packageId,
    required this.treatmentName,
    required this.treatmentPeriodInDays,
    required this.productCategoryName,
    required this.cityName,
    required this.salePrice,
    required this.packageName,
  });
  FavDetailViewList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageId = json["package_id"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
    treatmentName = json["treatment_name"];
    productCategoryName = json["treatment_name"];
    packageName = json["package_name"];
    cityName = json["city_name"];
    salePrice = json["package_price"];
  }
}
