class GetServicesListReponseModel {
  String? status;
  String? message;
  List<SelectHomeServicesList>? selecthomeServicesData;

  GetServicesListReponseModel({
    this.status,
    this.message,
    this.selecthomeServicesData,
  });
  GetServicesListReponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json["treatment_list"] != null) {
      selecthomeServicesData = <SelectHomeServicesList>[];
      json["treatment_list"].forEach((v) {
        selecthomeServicesData!.add(SelectHomeServicesList.fromJson(v));
      });
    }
  }
}

class SelectHomeServicesList {
  int? id;
  String? productCategoryName;

  SelectHomeServicesList({
    this.id,
    this.productCategoryName,
  });
  SelectHomeServicesList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    productCategoryName = json["product_category_name"];
  }
}
