import 'dart:convert';
import 'dart:math';

class PaymentDoneRequestModel {
  String? packageId;
  String? patientID;
  String? paidAmount;
  String? salePrice;
  String? percentage;
  String? platFormType;
  String? paymentMethod;
  String? purchesId;
  String? purchaseType;
  String? conversationId;
  String? bankName;
  String? bankReciverNAme;
  String? iban;
  List<String>? otherService;
  String? disscription;
  String? cardName;
  String? cardNumber;
  String? transactionId;
  String? cardCVV;
  String? expiryDate;
  // String? cardNumber;
  // String? cardexpieryDate;
  // String? cardCVV;

  PaymentDoneRequestModel({
    this.packageId,
    this.paidAmount,
    this.salePrice,
    this.percentage,
    this.purchesId,
    this.platFormType,
    this.paymentMethod,
    this.patientID,
    this.purchaseType,
    this.otherService,
    this.conversationId,
    this.disscription,
    this.transactionId,
    this.bankName,
    this.bankReciverNAme,
    this.iban,
    this.cardCVV,
    this.expiryDate,
    this.cardNumber,
    this.cardName,
  }) {
    var random = Random();
    conversationId = (random.nextInt(900000000) + 100000000).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "package_id": packageId, //
      "paid_amount": paidAmount, //
      "sale_price": salePrice,
      "percentage": percentage, //
      "platform_type": platFormType,
      "purchase_id": purchesId,
      "patient_id": patientID,
      "other_services": otherService,
      "payment_method": paymentMethod, //
      "type": purchaseType,
      "conversation_id": conversationId,
      "bank_description": disscription,
      "transaction_id": transactionId,
      "bank_name": bankName,
      "receiver_name": bankReciverNAme,
      "iban": iban,
      "card_name": cardName,
      "card_expiry_date": expiryDate,
      "card_no": cardNumber,
      "card_cvv": cardCVV,
    };
    // data["card_no"] = cardNumber;
    // data["card_expiry_date"] = cardexpieryDate;
    // data["card_cvv"] = cardCVV;
    // Convert the list to a JSON string
    data["other_services"] =
        otherService != null ? jsonEncode(otherService) : null;
    return data;
  }
}

//////////////////////////////////////
class PaymentDoneResponseModel {
  int? status;
  String? message;
  OrderId? orderId;

  PaymentDoneResponseModel({
    required this.status,
    required this.message,
    required this.orderId,
  });
  PaymentDoneResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderId =
        json['order_id'] != null ? OrderId.fromJson(json['order_id']) : null;
  }
}

class OrderId {
  String? id;

  OrderId({
    required this.id,
  });
  OrderId.fromJson(Map<String, dynamic> json) {
    id = json["order_id"];
  }
}
