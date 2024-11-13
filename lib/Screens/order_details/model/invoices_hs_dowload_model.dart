class HSInvoicesDownloadResponseModel {
  int? status;
  String? message;
  String? invoices;

  HSInvoicesDownloadResponseModel({
    required this.status,
    required this.message,
    required this.invoices,
  });
  HSInvoicesDownloadResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    invoices = json["url"];
  }
}

////////////////////////////
class HSInvoicesdownloadrequestModel {
  // String? treatMentName;
  // String? cityName;
  String? orderId;
  // String? compnyName;

  HSInvoicesdownloadrequestModel({
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
