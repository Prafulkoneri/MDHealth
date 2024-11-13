class FoodInvoicesDownloadResponseModel {
  int? status;
  String? message;
  String? invoices;

  FoodInvoicesDownloadResponseModel({
    required this.status,
    required this.message,
    required this.invoices,
  });
  FoodInvoicesDownloadResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    invoices = json["invoice_url"];
  }
}

////////////////////////////
class FoodInvoicesdownloadrequestModel {
  // String? treatMentName;
  // String? cityName;
  String? orderId;
  // String? compnyName;

  FoodInvoicesdownloadrequestModel({
    // this.treatMentName,
    // this.cityName,
    this.orderId,
    // this.compnyName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    // data["treatment_name"] = treatMentName;
    // data["city_name"] = cityName;
    data["order_id"] = orderId;
    // data["company_name"] = compnyName;
    return data;
  }
}
