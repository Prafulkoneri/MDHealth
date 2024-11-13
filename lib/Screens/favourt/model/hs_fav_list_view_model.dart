class HsFavListViewResponse {
  String? status;
  String? message;
  List<HsfavListView>? hsFavListdata;

  HsFavListViewResponse({
    required this.status,
    required this.message,
    required this.hsFavListdata,
  });
  HsFavListViewResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      hsFavListdata = <HsfavListView>[];
      json["data"].forEach((v) {
        hsFavListdata!.add(HsfavListView.fromJson(v));
      });
    }
  }
}

class HsfavListView {
  String? id;
  String? treatmentPeriodInDays;
  String? treatmentName;
  String? cityName;
  String? packageName;
  String? packagePrice;
  String? packageId;

  HsfavListView({
    required this.id,
    required this.treatmentPeriodInDays,
    required this.treatmentName,
    required this.cityName,
    required this.packageName,
    required this.packagePrice,
    required this.packageId,
  });
  HsfavListView.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageId = json["package_id"];
    treatmentPeriodInDays = json["service_period"];
    treatmentName = json["shop_type"];
    packageName = json["package_name"];
    packagePrice = json["sale_price"];
    cityName = json["city_name"];
  }
}
