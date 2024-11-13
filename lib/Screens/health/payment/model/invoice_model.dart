class InvoiceRequestModel {
  String? orderId;

  InvoiceRequestModel({
    required this.orderId,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "order_id": orderId,
    };
    return data;
  }
}

class InvoiceResponseModel {
  String? status;
  String? message;
  FoodInData? foodInData;

  InvoiceResponseModel({
    this.status,
    this.message,
    this.foodInData,
  });

  InvoiceResponseModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    message = json['message'];
    foodInData = json['data'] != null 
    ? FoodInData.fromJson(json['data'])
    : null;
  }
}

class FoodInData {
  String? invoicePdfPath;
  String? invoicePdfName;
  String? customerEmail;

  FoodInData({
    this.invoicePdfName,
    this.invoicePdfPath,
    this.customerEmail,
  });

  FoodInData.fromJson(Map<String,dynamic> json) {
    invoicePdfPath = json['invoice_pdf_path'];
    invoicePdfName = json['invoice_pdf_name'];
    customerEmail = json['customer_email'];
  }
}