class CardOneItemDeleteRequestModel {
  String? cartItemId;

  CardOneItemDeleteRequestModel({
    this.cartItemId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["cartItemId"] = cartItemId;
    return data;
  }
}

///////////////////////////////////////////////
class CardOneItemDeleteResponsetModel {
  int? status;
  String? message;

  CardOneItemDeleteResponsetModel({
    required this.status,
    required this.message,
  });
  CardOneItemDeleteResponsetModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
