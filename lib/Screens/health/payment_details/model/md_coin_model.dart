class GetMdCoinsResponse {
  int? status;
  String? message;
  String? coins;

  GetMdCoinsResponse({
    required this.status,
    required this.message,
    required this.coins,
  });
  GetMdCoinsResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    message = json["data"];
  }
}
