class ShopFavListReponseModel {
  int? status;
  String? message;
  List<ShopFavListDatas>? shopFavListDatas;

  ShopFavListReponseModel({
    required this.status,
    required this.message,
    required this.shopFavListDatas,
  });
  ShopFavListReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      shopFavListDatas = <ShopFavListDatas>[];
      json["data"].forEach((v) {
        shopFavListDatas!.add(ShopFavListDatas.fromJson(v));
      });
    }
  }
}

class ShopFavListDatas {
  int? id;
  // String? treatmentPeriodInDays;
  // String? treatmentName;
  // String? cityName;
  String? packageName;
  String? packagePrice;
  int? packageId;

  ShopFavListDatas({
    required this.id,
    // required this.treatmentPeriodInDays,
    // required this.treatmentName,
    // required this.cityName,
    required this.packageName,
    required this.packagePrice,
    required this.packageId,
  });
  ShopFavListDatas.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    // treatmentPeriodInDays = json["treatment_period_in_days"];
    // treatmentName = json["treatment_name"];
    // cityName = json["city_name"];
    packageName = json["product_name"];
    packagePrice = json["sale_price"];
    packageId = json["package_id"];
  }
}
