class HsOrderListResponseModel {
  String? status;
  String? message;
  HsDetailsViewData? hsDetailsviewdata;

  HsOrderListResponseModel({
    this.status,
    this.message,
    this.hsDetailsviewdata,
  });
  HsOrderListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    hsDetailsviewdata =
        json['data'] != null ? HsDetailsViewData.fromJson(json['data']) : null;
  }
}

class HsDetailsViewData {
  String? id;
  String? orderId;
  String? transactionId;
  List<String>? otherServices;
  String? packageTreatmentPrice;
  String? treatmentStartDate;
  String? packageTotalPrice;
  String? pendingPercentage; //
  String? paymentPercentage; // completed percentage
  String? paidAmount; // completed payment
  String? pendingPayment; //
  String? bankName;
  String? receiverName;
  String? purchaseType; // purchase type
  String? purchaseStatus; // not-purchased/purchased
  String? paymentMethod;
  String? invoicePdfName;
  String? invoicePdfPath;
  String? createdIpAddress;
  String? modifiedIpAddress;
  String? createdBy;
  String? modifiedBy;
  String? status; // active/completed
  String? createdAt; //
  String? updatedAt;
  String? providerLogo;
  String? packageName;
  String? salePrice;
  String? customerCountry;
  String? customerCity;
  String? customerAddress;
  String? packageCity;
  String? companyName;
  String? packageCountry;
  String? packagePercentagePrice;
  String? purchaseId; //
  String? patientId;
  String? packageId; //
  String? treatmentPeriodInDays;
  String? invoiceType;
  String? reviewFound;
  String? paymentStatus;
  String? bankDesc;
  String? type;

  HsDetailsViewData({
    this.id,
    this.orderId,
    this.transactionId,
    this.otherServices,
    this.packageTreatmentPrice,
    this.packageTotalPrice,
    this.pendingPercentage,
    this.paymentPercentage,
    this.paidAmount,
    this.pendingPayment,
    this.purchaseType,
    this.purchaseStatus,
    this.paymentMethod,
    this.invoicePdfName,
    this.invoicePdfPath,
    this.createdIpAddress,
    this.modifiedIpAddress,
    this.createdBy,
    this.modifiedBy,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.providerLogo,
    this.packageName,
    this.salePrice,
    this.customerCountry,
    this.customerCity,
    this.customerAddress,
    this.packageCity,
    this.companyName,
    this.packageCountry,
    this.packagePercentagePrice,
    this.purchaseId,
    this.patientId,
    this.packageId,
    this.treatmentPeriodInDays,
    this.invoiceType,
    this.reviewFound,
    this.paymentStatus,
    this.bankDesc,
    this.type,
  });
  HsDetailsViewData.fromJson(Map<String, dynamic> json) {
    //   id = json["id"];
    //   packageId = json["country_name"];
    //   orderId = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    //   countryName = json["country_name"];
    packageId = json["package_id"];
    purchaseId = json['purchase_id'];
    id = json['id'];
    orderId = json['order_id'];
    transactionId = json['transaction_id'];
    // List<String>? otherServices;
    otherServices = json['other_services'] != null
        ? List<String>.from(json['other_services']!.map((x) => x))
        : null;
    packageTreatmentPrice = json['package_treatment_price'];
    treatmentStartDate = json['treatment_start_date'];
    packageTotalPrice = json['package_total_price'];
    pendingPercentage = json['pending_percentage'];
    paymentPercentage = json['payment_percentage'];
    invoiceType = json['invoice_type'];
    paidAmount = json['paid_amount'];
    pendingPayment = json['pending_payment'];
    purchaseType = json['purchase_type'];
    purchaseStatus = json['purchase_status'];
    paymentMethod = json['payment_method'];
    invoicePdfName = json['invoice_pdf_name'];
    invoicePdfPath = json['invoice_pdf_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    providerLogo = json['provider_logo'];
    packageName = json['package_name'];
    salePrice = json['sale_price'];
    customerCountry = json['customer_country'];
    customerCity = json['customer_city'];
    customerAddress = json['customer_address'];
    packageCity = json['package_city'];
    companyName = json['company_name'];
    packageCountry = json['package_country'];
    packagePercentagePrice = json['package_percentage_price'];
    patientId = json['patient_id'];
    treatmentPeriodInDays = json['treatment_period_in_days'];
    reviewFound = json['review_found'];
    paymentStatus = json['payment_status'];
    bankDesc = json['bank_description'];
    type = json['type'];
  }
}

////////////////////////////////////////////////////////////////////////////
class HsOrderListRequestModel {
  String? hSorderId;
  HsOrderListRequestModel({
    this.hSorderId,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["order_id"] = hSorderId;
    return data;
  }
}
