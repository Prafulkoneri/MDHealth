class HomePageScroolResponse {
  int? status;
  String? message;
  List<PurchaseDetail>? purchaseDetails;

  HomePageScroolResponse({
    this.status,
    this.message,
    this.purchaseDetails,
  });
  HomePageScroolResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["purchase_details"] != null) {
      purchaseDetails = <PurchaseDetail>[];
      json["purchase_details"].forEach((v) {
        purchaseDetails!.add(PurchaseDetail.fromJson(v));
      });
    }
  }
}

class PurchaseDetail {
  int? id;
  String? percent;
  String? description;
  String? imagePath;
  String? imageName;

  PurchaseDetail({
    this.id,
    this.percent,
    this.description,
    this.imagePath,
    this.imageName,
  });
  PurchaseDetail.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    percent = json["percent"];
    description = json["description"];
    imagePath = json["image_path"];
    imageName = json["image_name"];
  }
}
