class AddFavFooDResponseMOdel {
  int? status;
  String? message;
  String? favStatus;

  AddFavFooDResponseMOdel({
    required this.status,
    required this.message,
    required this.favStatus,
  });
  AddFavFooDResponseMOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    favStatus = json["fav_status"];
  }
}
////////////////////////////////////////////

class AddFavFooDRequestModel {
  String? packageId;
  String? favtype;

  AddFavFooDRequestModel({
    this.packageId,
    this.favtype,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["shop_type"] = favtype;
    return data;
  }
}
