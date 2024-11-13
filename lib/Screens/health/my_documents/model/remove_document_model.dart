class RemoveDocumenbtResponseModel {
  int? status;
  String? message;

  RemoveDocumenbtResponseModel({
    required this.status,
    required this.message,
  });
  RemoveDocumenbtResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}

//////////////////////Request Model/////////////////////////
class RemoveDocumenbtRequestModel {
  String? id;

  RemoveDocumenbtRequestModel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    return data;
  }
}
