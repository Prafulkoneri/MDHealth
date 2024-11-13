import 'dart:convert';
import 'dart:math';

class HSPaymentDoneRequestModel {
  String? packageId;
  String? bankDiscription;
  String? patientID; //
  String? paidAmount;
  String? salePrice;
  String? percentage;
  String? platFormType;
  String? paymentType;
  String? purchesId;
  String? purchaseType;
  String? conversationId;
  String? bankName;
  String? bankReciverNAme;
  String? iban;
  List<String>? otherService;
  String? cardName;
  String? cardNumber;
  String? transactionId;
  String? cardCVV;
  String? expiryDate;

  HSPaymentDoneRequestModel({
    this.packageId,
    this.paidAmount,
    this.bankDiscription,
    this.salePrice,
    this.percentage,
    this.purchesId,
    this.platFormType,
    this.paymentType,
    this.patientID,
    this.purchaseType,
    this.otherService,
    this.conversationId,
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
      "patient_id": patientID ?? '',
      "other_services": otherService,
      "payment_method": paymentType, //
      "type": purchaseType,
      "conversation_id": conversationId,
      "bank_description": bankDiscription,
      "transaction_id": transactionId,
      "bank_name": bankName,
      "receiver_name": bankReciverNAme,
      "iban": iban,
      "card_name": cardName,
      "card_expiry_date": expiryDate,
      "card_no": cardNumber,
      "card_cvv": cardCVV,
    };
    data["other_services"] =
        otherService != null ? jsonEncode(otherService) : null;
    return data;
  }
}

//////////////////////////////////////
class HsPaymentDoneResponseModel {
  String? status;
  String? message;
  String? id;

  HsPaymentDoneResponseModel({
    required this.status,
    required this.message,
    required this.id,
  });
  HsPaymentDoneResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    id = json["order_id"];

    // orderId =
    //     json['order_id'] != null ? OrderId.fromJson(json['order_id']) : null;
  }
}

// class OrderId {
//   String? id;
//   OrderId({
//     required this.id,
//   });
//   OrderId.fromJson(Map<String, dynamic> json) {
//     id = json["order_id"];
//   }
// }
