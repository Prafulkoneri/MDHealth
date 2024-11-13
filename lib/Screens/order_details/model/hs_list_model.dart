class HsOrderListResponseModel {
  int? status;
  String? message;
  List<HsOrderDetail>? hsorderDetails;

  HsOrderListResponseModel({
    this.status,
    this.message,
    this.hsorderDetails,
  });
  HsOrderListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["order_details"] != null) {
      hsorderDetails = <HsOrderDetail>[];
      json["order_details"].forEach((v) {
        hsorderDetails!.add(HsOrderDetail.fromJson(v));
      });
    }
  }
}

class HsOrderDetail {
  String? id;
  String? orderId;
  String? createdAt;
  String? updatedAt;
  String? providerLogo;
  String? packageName;
  String? salePrice;
  String? purchaseType;
  String? treatmentPeriodInDays;

  HsOrderDetail({
    this.id,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.providerLogo,
    this.salePrice,
    this.packageName,
    this.purchaseType,
    this.treatmentPeriodInDays,
  });
  HsOrderDetail.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    orderId = json["order_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    providerLogo = json["provider_logo"];
    packageName = json["package_name"];
    salePrice = json["sale_price"];
    purchaseType = json["purchase_type"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
  }
}
