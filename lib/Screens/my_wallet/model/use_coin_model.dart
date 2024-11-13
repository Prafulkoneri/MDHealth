class UseCoinsResMOdel {
  int? status;
  String? message;
  int? coins;

  UseCoinsResMOdel({
    required this.status,
    required this.message,
    required this.coins,
  });
  UseCoinsResMOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    coins = json["data"] ?? 0;
  }
}
