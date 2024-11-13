class FollowVendorResponsemodel {
  int? status;
  String? message;
  int? followerCount;
  String? folloWStatus;

  FollowVendorResponsemodel({
    required this.status,
    required this.message,
    required this.followerCount,
    required this.folloWStatus,
  });
  FollowVendorResponsemodel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    followerCount = json["followers_count"];
    folloWStatus = json["follow_status"];
  }
}

////////////////////////////////////
class FollowVendorRequestmodel {
  String? vendorId;

  FollowVendorRequestmodel({
    this.vendorId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["vendor_id"] = vendorId;
    return data;
  }
}
