class NetWorkResponseMOdel {
  int? status;
  String? message;
  int? networkCount;
  int? pendingInvite;
  int? leftinviteCount;

  NetWorkResponseMOdel({
    required this.status,
    required this.message,
    required this.networkCount,
    required this.pendingInvite,
    required this.leftinviteCount,
  });
  NetWorkResponseMOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    networkCount = json["your_network_count"];
    pendingInvite = json["pending_invite_count"];
    leftinviteCount = json["left_invite_count"];
  }
}
