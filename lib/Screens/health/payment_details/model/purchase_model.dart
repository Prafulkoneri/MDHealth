// class PurchaseRequestModel {
//   String? packageId;
//   String? packageTreatmentPrice;
//   String? packageHotelPrice;
//   String? packageTransportationPrice;
//   String? packageTotalPrice;
//   String? paymentMethod;
//   String? platformType;
//   String? cardName;
//   String? cardNo;
//   String? cardExpiryDate;
//   String? cardCvv;
//   String? packagePercentagePrice;
//   String? pendingAmount;

//   PurchaseRequestModel({
//     this.packageId,
//     this.packageTreatmentPrice,
//     this.packageHotelPrice,
//     this.packageTransportationPrice,
//     this.packageTotalPrice,
//     this.paymentMethod,
//     this.platformType,
//     this.cardName,
//     this.cardNo,
//     this.cardExpiryDate,
//     this.cardCvv,
//     this.packagePercentagePrice,
//     this.pendingAmount,
//   });

//   factory PurchaseRequestModel.fromJson(Map<String, dynamic> json) => PurchaseRequestModel(
//     packageId: json["package_id"],
//     packageTreatmentPrice: json["package_treatment_price"],
//     packageHotelPrice: json["package_hotel_price"],
//     packageTransportationPrice: json["package_transportation_price"],
//     packageTotalPrice: json["package_total_price"],
//     paymentMethod: json["payment_method"],
//     platformType: json["platform_type"],
//     cardName: json["card_name"],
//     cardNo: json["card_no"],
//     cardExpiryDate: json["card_expiry_date"],
//     cardCvv: json["card_cvv"],
//     packagePercentagePrice: json["package_percentage_price"],
//     pendingAmount: json["pending_amount"],
//   );

//   Map<String, dynamic> toJson() => {
//     "package_id": packageId,
//     "package_treatment_price": packageTreatmentPrice,
//     "package_hotel_price": packageHotelPrice,
//     "package_transportation_price": packageTransportationPrice,
//     "package_total_price": packageTotalPrice,
//     "payment_method": paymentMethod,
//     "platform_type": platformType,
//     "card_name": cardName,
//     "card_no": cardNo,
//     "card_expiry_date": cardExpiryDate,
//     "card_cvv": cardCvv,
//     "package_percentage_price": packagePercentagePrice,
//     "pending_amount": pendingAmount,
//   };
// }

// ////////////////////////////////////////////////////////////////////////////////

// class PurchaseResponseModel {
//   int? status;
//   String? message;

//   PurchaseResponseModel({
//     this.status,
//     this.message,
//   });

//   factory PurchaseResponseModel.fromJson(Map<String, dynamic> json) => PurchaseResponseModel(
//     status: json["status"],
//     message: json["message"],
//   );

//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//   };
// }