import 'dart:math';

class ShopCardPaymentResponseModel {
  int? status;
  String? message;
  String? orderIdsho;

  ShopCardPaymentResponseModel({
    required this.status,
    required this.message,
    required this.orderIdsho,
  });
  ShopCardPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderIdsho = json["order_id"];
  }
}
////////////////////////////////////////////////////////

class ShopPaymentRequestModel {
  String? paymentMethod;
  String? conversationId;
  String? transactionId;
  String? bankName;
  String? bankReciverNAme;
  String? iban;
  String? description;
  String? cardName;
  String? cardNumber;
  String? cardCVV;
  String? expiryDate;
  // String? platFormType;
  String? walletId;
  String? userAddressId;

  ShopPaymentRequestModel({
    this.paymentMethod,
    this.conversationId,
    this.transactionId,
    this.bankName,
    this.bankReciverNAme,
    this.description,
    this.iban,
    this.cardCVV,
    this.expiryDate,
    this.cardNumber,
    this.cardName,
    this.walletId,
    // this.platFormType,
    this.userAddressId,
  }) {
    var random = Random();
    conversationId = (random.nextInt(900000000) + 100000000).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["conversation_id"] = conversationId ?? "";
    data["bank_description"] = description ?? '';
    data["transaction_id"] = transactionId ?? '';
    data["bank_name"] = bankName ?? '';
    data["receiver_name"] = bankReciverNAme ?? '';
    data["bank_account_number"] = iban ?? "";
    data["card_name"] = cardName ?? "";
    data["expiry_date"] = expiryDate ?? '';
    data["card_number"] = cardNumber ?? '';
    data["cvv"] = cardCVV ?? '';
    data["payment_mod"] = paymentMethod ?? '';
    data["wallet_id"] = walletId ?? '';
    data["usersPaddressId"] = userAddressId ?? '';
    return data;
  }
}
