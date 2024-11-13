class PackageDetailViewRequestModel {
  String? packageId;
  String? purchesId;
  // String? purchesId;
  String? type;

  PackageDetailViewRequestModel({
    this.packageId,
    this.purchesId,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["purchase_id"] = purchesId;
    data["type"] = type;
    return data;
  }
}

/////////////////////////////////////////////////////////////
class PackageDetailViewResponseModel {
  int? status;
  String? message;
  CustomerPurchasePackageList? customerPurchasePackageList;
  List<OtherService>? otherServices;

  PackageDetailViewResponseModel({
    required this.status,
    required this.message,
    required this.customerPurchasePackageList,
    required this.otherServices,
  });
  PackageDetailViewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    customerPurchasePackageList = json['customer_purchase_package_list'] != null
        ? CustomerPurchasePackageList.fromJson(
            json['customer_purchase_package_list'])
        : null;
    if (json["other_services"] != null) {
      otherServices = <OtherService>[];
      json["other_services"].forEach((v) {
        otherServices!.add(OtherService.fromJson(v));
      });
    }
  }
}

class CustomerPurchasePackageList {
  String? purchaseId; //
  int? patientID;
  String? treatmentStartDate; //
  String? createdAt; //
  String? paymentPercentage; //
  int? packageId; //
  String? packageName; //
  String? treatmentPeriodInDays; //
  String? otherServices; //
  String? paidAmount; //
  String? pendingPayment; //
  String? treatmentName; //
  String? cityName; //
  String? companyName; //
  String? companyLogoImagePathS; //
  String? packageUniqueNo;
  String? packagePaymentPlan;
  String? packageTotalPrice;
  String? caseManegar;
  String? caseNumberer;
  String? completedPayment;
  String? completedPercentage;
  int? hotelId;
  int? vehicald;
  int? tourId;
  String? paymentStatus;
  String? modifiedKey;
  String? pendingPercentage;
  String? orderID;
  String? invoiceType;
  String? invoicePdfPath;

  CustomerPurchasePackageList({
    required this.purchaseId, //
    required this.patientID, //
    required this.createdAt,
    required this.treatmentStartDate, //
    required this.paymentPercentage, //
    required this.packageId, //
    required this.packageName, //
    required this.treatmentPeriodInDays, //
    required this.otherServices, //
    required this.paidAmount, //
    required this.pendingPayment, //
    required this.hotelId, //
    required this.vehicald, //
    required this.treatmentName, //
    required this.cityName, //
    required this.companyName, //
    required this.companyLogoImagePathS,
    required this.packageUniqueNo, //
    required this.packagePaymentPlan, //
    required this.packageTotalPrice,
    required this.caseManegar,
    required this.caseNumberer,
    required this.completedPercentage,
    required this.completedPayment,
    required this.tourId,
    required this.paymentStatus,
    required this.modifiedKey,
    required this.pendingPercentage,
    required this.orderID,
    required this.invoiceType,
    required this.invoicePdfPath,
  });
  CustomerPurchasePackageList.fromJson(Map<String, dynamic> json) {
    purchaseId = json["purchase_id"];
    orderID = json["order_id"];
    patientID = json["patient_id"];
    createdAt = json["date"];
    treatmentStartDate = json["treatment_start_date"];
    caseManegar = json["case_manager"];
    caseNumberer = json["case_no"];
    paymentPercentage = json["payment_percentage"];
    packageId = json["package_id"];
    packageName = json["package_name"];
    treatmentPeriodInDays = json["treatment_period_in_days"];
    paidAmount = json["paid_amount"]; //
    pendingPayment = json["pending_payment"]; //
    hotelId = json["hotel_id"]; //
    vehicald = json["vehicle_id"]; //
    tourId = json["vehicle_id"]; //
    treatmentName = json["treatment_name"]; //
    cityName = json["city_name"]; //
    companyName = json["company_name"]; //
    companyLogoImagePathS = json["company_logo_image_path"];
    packageUniqueNo = json["package_unique_no"]; //
    packageTotalPrice = json["package_total_price"]; //
    completedPayment = json["completed_payment"]; //
    completedPercentage = json["completed_percentage"]; //
    modifiedKey = json["modify_date"]; //
    pendingPercentage = json["pending_percentage"]; //
    pendingPayment = json["pending_payment"]; //
    paymentStatus = json["payment_status"]; //
    paymentStatus = json["payment_status"]; //
    invoiceType = json["invoice_type"]; //
    invoicePdfPath = json['invoice_pdf_path'];
  }
}

class OtherService {
  int? id;
  String? title;
  String? status;
  String? viewStatus;

  OtherService({
    required this.id,
    required this.title,
    required this.status,
    required this.viewStatus,
  });
  OtherService.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    status = json["status"];
    viewStatus = json["view_status"];
  }
}

// class PackageDetailViewResponseModel {
//   String? status;
//   String? message;
//   CustomerPurchasePackageList? customerPurchasePackageList;
//   List<OtherService>? otherServices;

//   PackageDetailViewResponseModel({
//     required this.status,
//     required this.message,
//     required this.customerPurchasePackageList,
//     required this.otherServices,
//   });
//   PackageDetailViewResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     customerPurchasePackageList = json['customer_purchase_package_list'] != null
//         ? CustomerPurchasePackageList.fromJson(
//             json['customer_purchase_package_list'])
//         : null;
//     if (json["other_services"] != null) {
//       otherServices = <OtherService>[];
//       json["other_services"].forEach((v) {
//         otherServices!.add(OtherService.fromJson(v));
//       });
//     }
//   }
// }

// class CustomerPurchasePackageList {
//   int? purchaseId;
//   int? packageId;
//   String? packageName;
//   String? treatmentPeriodInDays;
//   String? otherServices;
//   String? paidAmount;
//   String? pendingPayment;
//   int? hotelId;
//   int? vehicleId;
//   String? treatmentName;
//   String? cityName;
//   String? companyName;
//   String? companyLogoImagePath;
//   String? packageUniqueNo;
//   String? packagePaymentPlan;
//   String? packageTotalPrice;

//   CustomerPurchasePackageList({
//     required this.purchaseId,
//     required this.packageId,
//     required this.packageName,
//     required this.treatmentPeriodInDays,
//     required this.otherServices,
//     required this.paidAmount,
//     required this.pendingPayment,
//     required this.hotelId,
//     required this.vehicleId,
//     required this.treatmentName,
//     required this.cityName,
//     required this.companyName,
//     required this.companyLogoImagePath,
//     required this.packageUniqueNo,
//     required this.packagePaymentPlan,
//     required this.packageTotalPrice,
//   });
  // CustomerPurchasePackageList.fromJson(Map<String, dynamic> json) {
  //   purchaseId = json["purchase_id"];
  //   packageId = json["package_id"];
  //   packageName = json["package_name"];
  //   treatmentPeriodInDays = json["treatment_period_in_days"];
  //   paidAmount = json["paid_amount"];
  //   pendingPayment = json["pending_payment"];
  //   treatmentName = json["treatment_name"];
  //   cityName = json["city_name"];
  //   companyName = json["company_name"];
  //   companyLogoImagePath = json["company_logo_image_path"];
  //   packageUniqueNo = json["package_unique_no"];
  //   companyLogoImagePath = json["package_payment_plan"];
  //   packageTotalPrice = json["package_total_price"];
  // }
// }

// class OtherService {
//   int? id;
//   String? title;
//   String? status;

//   OtherService({
//     required this.id,
//     required this.title,
//     required this.status,
//   });
//   OtherService.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     title = json["title"];
//     status = json["status"];
//   }
// }
