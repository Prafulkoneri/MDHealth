class AddToFavModelRequest {
  String? packageId;

  AddToFavModelRequest({
    this.packageId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;

    return data;
  }
}

///////////////////////////////////
class AddToFavModelRes {
  int? status;
  String? message;

  AddToFavModelRes({
    required this.status,
    required this.message,
  });
  AddToFavModelRes.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
