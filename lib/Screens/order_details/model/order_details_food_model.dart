// class OrderListDetailsRequestModel {
//   String? foodOrderId;
//   OrderListDetailsRequestModel({
//     this.foodOrderId,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data["order_id"] = foodOrderId;

//     return data;
//   }
// }

// ////////////////////////////////////////////////////////////////////////
// class OrderListReponseModel {
//   int? status;
//   String? message;
//   OrderFoodDetails? orderFoodDetails;
//   List<Sale>? sales;

//   OrderListReponseModel({
//     required this.status,
//     required this.message,
//     required this.orderFoodDetails,
//     required this.sales,
//   });
//   OrderListReponseModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     orderFoodDetails = json['order_details'] != null
//         ? OrderFoodDetails.fromJson(json['order_details'])
//         : null;
//     if (json["sales"] != null) {
//       sales = <Sale>[];
//       json["sales"].forEach((v) {
//         sales!.add(Sale.fromJson(v));
//       });
//     }
//   }
// }

// class OrderFoodDetails {
//   int? foodPackageIdnew;
//   int? id;
//   String? orderId;
//   String? foodPackageTotalPrice;
//   String? packageName;
//   String? subscriptionStartDate;
//   String? subscriptionEndDate;
//   String? orderStatus;
//   String? paymentMethod;
//   String? address;
//   String? companyLogoImagePath;
//   String? foodType;
//   String? calories;
//   int? remainingDays;
//   String? type;
//   int? useDays;
//   String? packageFor;
//   String? countryName;
//   String? cityName;
//   String? transactionId;
//   String? transactionDis;
//   String? reviewFound;

//   OrderFoodDetails({
//     required this.foodPackageIdnew,
//     required this.id,
//     required this.orderId,
//     required this.foodPackageTotalPrice,
//     required this.packageName,
//     required this.subscriptionStartDate,
//     required this.subscriptionEndDate,
//     required this.orderStatus,
//     required this.paymentMethod,
//     required this.address,
//     required this.companyLogoImagePath,
//     required this.foodType,
//     required this.calories,
//     required this.remainingDays,
//     required this.useDays,
//     required this.type,
//     required this.packageFor,
//     required this.countryName,
//     required this.cityName,
//     required this.transactionId,
//     required this.transactionDis,
//     required this.reviewFound,
//   });
//   OrderFoodDetails.fromJson(Map<String, dynamic> json) {
//     foodPackageIdnew = json["food_package_id"];
//     id = json["id"];
//     orderId = json["order_id"];
//     foodPackageTotalPrice = json["food_package_total_price"];
//     packageName = json["package_name"];
//     subscriptionStartDate = json["subscription_start_date"];
//     subscriptionEndDate = json["subscription_end_date"];
//     orderStatus = json["order_status"];
//     paymentMethod = json["payment_method"];
//     address = json["address"];
//     companyLogoImagePath = json["company_logo_image_path"];
//     foodType = json["food_type"];
//     calories = json["calories"];
//     remainingDays = json["remaining_days"];
//     type = json["type"];
//     useDays = json["used_days"];
//     packageFor = json["package_for"];
//     countryName = json["country"];
//     cityName = json["city"];
//     transactionId = json["transaction_id"];
//     transactionDis = json["transaction_discription"];
//     reviewFound = json["review_found"];
//   }
// }

// class Sale {
//   int? id;
//   int? foodSalesId;
//   String? date;
//   String? foodStatus;
//   String? remark;
//   String? createDate;

//   Sale({
//     this.id,
//     this.foodSalesId,
//     this.date,
//     this.foodStatus,
//     this.remark,
//     this.createDate,
//   });
//   Sale.fromJson(Map<String, dynamic> json) {
//     foodSalesId = json["food_sales_id"];
//     date = json["date"];
//     foodStatus = json["food_status"];
//     createDate = json["create_date"];
//     remark = json["remark"];
//     id = json["id"];
//   }
// }
class OrderListDetailsRequestModel {
  String? foodOrderId;
  OrderListDetailsRequestModel({
    this.foodOrderId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["order_id"] = foodOrderId;

    return data;
  }
}

////////////////////////////////////////////////////////////////////////
class OrderListReponseModel {
  int? status;
  String? message;
  OrderFoodDetails? orderFoodDetails;
  List<Sale>? sales;

  OrderListReponseModel({
    required this.status,
    required this.message,
    required this.orderFoodDetails,
    required this.sales,
  });

  OrderListReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderFoodDetails = json['order_details'] != null
        ? OrderFoodDetails.fromJson(json['order_details'])
        : null;
    if (json["sales"] != null) {
      sales = <Sale>[];
      json["sales"].forEach((v) {
        sales!.add(Sale.fromJson(v));
      });
    }
  }
}

class OrderFoodDetails {
  int? foodPackageIdnew;
  int? id;
  String? orderId;
  String? foodPackageTotalPrice;
  String? packageName;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  String? subscriptionType;
  String? invoicePdfPath;
  String? orderStatus;
  String? paymentMethod;
  String? address;
  String? companyLogoImagePath;
  String? foodType;
  String? calories;
  int? remainingDays;
  String? type;
  int? useDays;
  String? packageFor;
  String? countryName;
  String? cityName;
  String? transactionId;
  String? transactionDis;
  String? reviewFound;
  List<MenuList>? menuList;
  List<String>? mealTypes;

  OrderFoodDetails({
    required this.foodPackageIdnew,
    required this.id,
    required this.orderId,
    required this.foodPackageTotalPrice,
    required this.packageName,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
    required this.subscriptionType,
    required this.invoicePdfPath,
    required this.orderStatus,
    required this.paymentMethod,
    required this.address,
    required this.companyLogoImagePath,
    required this.foodType,
    required this.calories,
    required this.remainingDays,
    required this.useDays,
    required this.type,
    required this.packageFor,
    required this.countryName,
    required this.cityName,
    required this.transactionId,
    required this.transactionDis,
    required this.reviewFound,
    this.menuList,
    required this.mealTypes,
  });
  OrderFoodDetails.fromJson(Map<String, dynamic> json) {
    foodPackageIdnew = json["food_package_id"];
    id = json["id"];
    orderId = json["order_id"];
    foodPackageTotalPrice = json["food_package_total_price"];
    packageName = json["package_name"];
    subscriptionStartDate = json["subscription_start_date"];
    subscriptionEndDate = json["subscription_end_date"];
    invoicePdfPath = json['invoice_pdf_path'];
    orderStatus = json["order_status"];
    paymentMethod = json["payment_method"];
    address = json["address"];
    companyLogoImagePath = json["company_logo_image_path"];
    foodType = json["food_type"];
    calories = json["calories"];
    remainingDays = json["remaining_days"];
    type = json["type"];
    useDays = json["used_days"];
    packageFor = json["package_for"];
    countryName = json["country"];
    cityName = json["city"];
    transactionId = json["transaction_id"];
    transactionDis = json["transaction_discription"];
    reviewFound = json["review_found"];
    subscriptionType = json["subscription_type"];
    // menuList = json["review_found"];
    if (json["menu_list"] != null) {
      menuList = <MenuList>[];
      json["menu_list"].forEach((v) {
        menuList!.add(MenuList.fromJson(v));
      });
    }
    mealTypes = json["meal_types"] != null
        ? List<String>.from(json["meal_types"]!.map((x) => x))
        : null;
  }
}

class Sale {
  int? id;
  int? foodSalesId;
  String? date;
  String? foodStatus;
  String? remark;
  String? createDate;

  Sale({
    this.id,
    this.foodSalesId,
    this.date,
    this.foodStatus,
    this.remark,
    this.createDate,
  });
  Sale.fromJson(Map<String, dynamic> json) {
    foodSalesId = json["food_sales_id"];
    date = json["date"];
    foodStatus = json["food_status"];
    createDate = json["create_date"];
    remark = json["remark"];
    id = json["id"];
  }
}

class MenuList {
  int? id;
  String? category;
  List<MealType>? mealType;

  MenuList({
    this.id,
    this.category,
    this.mealType,
  });

  MenuList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    category = json["category"];

    if (json["mealType"] != null) {
      mealType = <MealType>[];
      json["mealType"].forEach((v) {
        mealType!.add(MealType.fromJson(v));
      });
    }
  }
}

class MealType {
  String? meal;
  List<String>? mealName;

  MealType({
    this.meal,
    this.mealName,
  });

  MealType.fromJson(Map<String, dynamic> json) {
    meal = json["meal"];
    mealName = json["mealName"] != null
        ? List<String>.from(json["mealName"]!.map((x) => x))
        : null;
  }
}
