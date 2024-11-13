import 'dart:math';

class CardDietPaymentRequest {
  String? foodPackageId;
  String? type;
  String? foodPackageTotalPrice;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  String? paymentMethod;
  String? platformtype;
  String? mdCoins;
  String? subscriptionType;
  String? transactionId;
  String? bankDiscription;
  String? conversationId;
  String? bankName;
  String? bankReciverNAme;
  String? iban;
  String? cardName;
  String? cardNumber;
  String? cardCVV;
  String? expiryDate;
  String? patientId;

  CardDietPaymentRequest({
    this.foodPackageId,
    this.type,
    this.foodPackageTotalPrice,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
    this.paymentMethod,
    this.platformtype,
    this.mdCoins,
    this.subscriptionType,
    this.transactionId,
    this.bankDiscription,
    required this.conversationId,
    this.bankName,
    this.bankReciverNAme,
    this.iban,
    this.cardCVV,
    this.expiryDate,
    this.cardNumber,
    this.cardName,
    this.patientId,
  }) {
    var random = Random();
    conversationId = (random.nextInt(900000000) + 100000000).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["food_package_id"] = foodPackageId;
    data["type"] = type;
    data["food_package_total_price"] = foodPackageTotalPrice;
    data["subscription_start_date"] = subscriptionStartDate;
    data["subscription_end_date"] = subscriptionEndDate;
    data["subscription_type"] = subscriptionType;
    data["payment_method"] = paymentMethod;
    data["platform_type"] = platformtype;
    data["data"] = mdCoins;
    data["bank_description"] = transactionId;
    data["transaction_id"] = bankDiscription;
    data["conversation_id"] = conversationId;
    data["bank_name"] = bankName;
    data["receiver_name"] = bankReciverNAme;
    data["iban"] = iban;
    data["card_name"] = cardName;
    data["card_expiry_date"] = expiryDate;
    data["card_no"] = cardNumber;
    data["card_cvv"] = cardCVV;
    data['patient_id'] = patientId;
    return data;
  }
}

///////////////////////////ResponseModel/////////////////
class CardDietPaymentResponse {
  int? status;
  String? message;
  String? shopOrderID;

  CardDietPaymentResponse({
    required this.status,
    required this.message,
    required this.shopOrderID,
  });
  CardDietPaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    shopOrderID = json["order_id"];
  }
}
