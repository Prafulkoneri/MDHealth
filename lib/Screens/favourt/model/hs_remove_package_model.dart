class HsRemoveFavResposeModel {
  int? status;
  String? message;

  HsRemoveFavResposeModel({
    required this.status,
    required this.message,
  });
  HsRemoveFavResposeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}

//////////////////////////////
class HsRemoveFavRequestmodel {
  String? id;

  HsRemoveFavRequestmodel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}
