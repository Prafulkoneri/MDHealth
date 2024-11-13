class SubscriptionType {
  int? status;
  String? message;
  List<SubscriptionData>? subscriptiondata;

  SubscriptionType({
    required this.status,
    required this.message,
    required this.subscriptiondata,
  });
  SubscriptionType.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      subscriptiondata = <SubscriptionData>[];
      json["data"].forEach((v) {
        subscriptiondata!.add(SubscriptionData.fromJson(v));
      });
    }
  }
}

class SubscriptionData {
  int? id;
  String? subscriptionType;

  SubscriptionData({
    required this.id,
    required this.subscriptionType,
  });
  SubscriptionData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    subscriptionType = json["subscription_type"];
  }
}
