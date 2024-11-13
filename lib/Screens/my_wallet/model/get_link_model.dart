class GetInvitationLink {
  int? status;
  String? message;
  String? invitationLink;

  GetInvitationLink({
    required this.status,
    required this.message,
    required this.invitationLink,
  });
  GetInvitationLink.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    invitationLink = json["invitation_link"];
  }
}
