class HsAddFavResposeModel {
  int? status;
  String? message;

  HsAddFavResposeModel({
    required this.status,
    required this.message,
  });
  HsAddFavResposeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}

//////////////////////////////
class HsAddFavRequestmodel {
  String? id;

  HsAddFavRequestmodel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = id;
    return data;
  }
}
