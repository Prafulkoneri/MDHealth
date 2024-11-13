class HsFavtCountResponseModel {
  String? status;
  String? message;
  String? hsFacCount;

  HsFavtCountResponseModel({
    required this.status,
    required this.message,
    required this.hsFacCount,
  });
  HsFavtCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    hsFacCount = json["data"];
  }
}
