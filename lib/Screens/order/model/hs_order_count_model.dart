class HsOrderCountResponseModel {
  int? status;
  String? message;
  int? hsorddercount;
  HsOrderCountResponseModel({
    required this.status,
    required this.message,
    required this.hsorddercount,
  });
  HsOrderCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    hsorddercount = json["order_count"];
  }
}
