import 'dart:convert';

import 'dart:convert';

class SendInviteLinkRepons {
  int? status;
  String? message;

  SendInviteLinkRepons({
    required this.status,
    required this.message,
  });
  SendInviteLinkRepons.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}

// /////////////////////////////////
// // class SendInviteLinkRequestModel {
// //   List<dynamic>?
// //       requestMails; // Changed from single requestMail to list of requestMails
// //   String? invitationLink;

// //   SendInviteLinkRequestModel({
// //     this.requestMails,
// //     this.invitationLink,
// //   });

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = {};
// //     data["requested_emails"] =
// //         requestMails; // Changed from "requested_email" to "requested_emails"
// //     data["invitation_link"] = invitationLink;
// //     return data;
// //   }
// // }

// class SendInviteLinkRequestModel {
//   String? requestMail;
//   String? invitationLink;

//   SendInviteLinkRequestModel({
//     this.requestMail,
//     this.tworequestMail,
//     this.theerequestMail,
//     this.fourrequestMail,
//     this.fiverequestMail,
//     this.invitationLink,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data["requested_email[]"] = requestMail;
//     // data["requested_emailtwo"] = tworequestMail;
//     // data["requested_emailthree"] = theerequestMail;
//     // data["requested_emailfour"] = fourrequestMail;
//     // data["requested_emailfive"] = fiverequestMail;
//     // data["requested_emailfive"] = fiverequestMail;
//     data["invitation_link"] = invitationLink;
//     return data;
//   }
// }

// class SendInviteLinkRequestModel {

//   List<String?> emails;
//   String? invitationLink;

//   SendInviteLinkRequestModel({

//     required this.emails,
//     this.invitationLink,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//         data['requested_email[]'] = emails != null ? jsonEncode(emails) : null;
//     data["invitation_link"] = invitationLink;
//     return data;
//   }
// }
class SendInviteLinkRequestModel {
  List<String?> emails;
  String? invitationLink;

  SendInviteLinkRequestModel({
    required this.emails,
    this.invitationLink,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    // Dynamically create the map for each email
    for (int i = 0; i < emails.length; i++) {
      data['requested_email[$i]'] = emails[i];
    }

    data['invitation_link'] = invitationLink;

    return data;
  }
}
