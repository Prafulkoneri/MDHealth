class RemoveFoodFavResposeModel {
  int? status;
  String? message;

  RemoveFoodFavResposeModel({
    required this.status,
    required this.message,
  });
  RemoveFoodFavResposeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}

//////////////////////////////
class RemoveFooodFavRequestmodel {
  String? id;

  RemoveFooodFavRequestmodel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}
