class AllCardDeleteResponseMOdel {
  int? status;
  String? message;

  AllCardDeleteResponseMOdel({
    required this.status,
    required this.message,
  });
  AllCardDeleteResponseMOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
