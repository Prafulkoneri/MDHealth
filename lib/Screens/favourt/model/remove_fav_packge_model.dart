class RemoveFavResmodel {
  int? status;
  String? message;

  RemoveFavResmodel({
    required this.status,
    required this.message,
  });
  RemoveFavResmodel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}

//////////////////////////////
class RemoveFavRequestmodel {
  String? id;

  RemoveFavRequestmodel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}
