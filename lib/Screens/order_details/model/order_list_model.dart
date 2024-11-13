class OrderListReponseModel {
  int? status;
  String? message;
  List<OrderList>? orderList;

  OrderListReponseModel({
    required this.status,
    required this.message,
    required this.orderList,
  });
  OrderListReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["order_details"] != null) {
      orderList = <OrderList>[];
      json["order_details"].forEach((v) {
        orderList!.add(OrderList.fromJson(v));
      });
    }
  }
}

class OrderList {
  int? id;
  String? orderId;
  String? foodPackageTotalPrice;
  String? packageName;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  String? subscriptionType;
  String? companyLogoImagePath;
  int? remainingDays;
  int? packageDays;
  int? useDays;
  String? packageFor;

  OrderList({
    required this.id,
    required this.orderId,
    required this.foodPackageTotalPrice,
    required this.packageName,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
    required this.subscriptionType,
    required this.companyLogoImagePath,
    required this.remainingDays,
    required this.packageDays,
    required this.useDays,
    required this.packageFor,
  });
  OrderList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    orderId = json["order_id"];
    foodPackageTotalPrice = json["food_package_total_price"];
    packageName = json["package_name"];
    subscriptionStartDate = json["subscription_start_date"];
    subscriptionEndDate = json["subscription_end_date"];
    subscriptionType = json["subscription_type"];
    companyLogoImagePath = json["company_logo_image_path"];
    remainingDays = json["remaining_days"];
    packageDays = json["package_days"];
    useDays = json["used_days"];
    packageFor = json["packageFor"];
  }
}
