// class ShopOrderListResponseModel {
//   int? status;
//   String? message;
//   String? orderId;
//   List<SdhopProductDetails>? shopProductDetails;
//   String? deliveryCharge;
//   int? productAmountPaid;
//   int? totalAmountPaid;
//   int? productCount;
//   String? paymentStatus;
//   String? paymentMode;
//   String? orderStatus;
//   String? paymentDate;
//   String? cargoCompanyName;
//   String? cargoTrackingNumber;
//   String? city;
//   String? country;
//   String? address;

//   ShopOrderListResponseModel({
//     required this.status,
//     required this.message,
//     required this.orderId,
//     required this.shopProductDetails,
//     required this.deliveryCharge,
//     required this.productAmountPaid,
//     required this.totalAmountPaid,
//     required this.productCount,
//     required this.paymentStatus,
//     required this.paymentMode,
//     required this.orderStatus,
//     required this.paymentDate,
//     required this.cargoCompanyName,
//     required this.cargoTrackingNumber,
//     required this.city,
//     required this.country,
//     required this.address,
//   });
// ShopOrderListResponseModel.fromJson(Map<String, dynamic> json) {
//   status = json["status"];
//   message = json["message"];
//   orderId = json["orderId"];
//   shopProductDetails = json["message"];
//   deliveryCharge = json["deliveryCharge"];
//   productAmountPaid = json["productAmountPaid"];
//   totalAmountPaid = json["totalAmountPaid"];
//   productCount = json["productCount"];
//   paymentStatus = json["paymentStatus"];
//   paymentMode = json["paymentMode"];
//   orderStatus = json["orderStatus"];
//   paymentDate = json["paymentDate"];
//   cargoCompanyName = json["cargoCompanyName"];
//   cargoTrackingNumber = json["cargoTrackingNumber"];
//   city = json["city_name"];
//   country = json["country_name"];
//   address = json["address"];

//   if (json["products"] != null) {
//     shopProductDetails = <SdhopProductDetails>[];
//     json["products"].forEach((v) {
//       shopProductDetails!.add(SdhopProductDetails.fromJson(v));
//     });
//   }
// }
// }

// class SdhopProductDetails {
//   int? productId;
//   String? productName;
//   String? amountPaid;
//   String? quantity;

//   SdhopProductDetails({
//     required this.productId,
//     required this.productName,
//     required this.amountPaid,
//     required this.quantity,
//   });
// SdhopProductDetails.fromJson(Map<String, dynamic> json) {
//   productId = json["product_id"];
//   productName = json["product_name"];
//   amountPaid = json["amount_paid"];
//   quantity = json["quantity"];
// }
// }

// //////////////////////////////////Request Model//////////////////
class DetailsShopOrderListRequestModel {
  String? shopOrderId;
  DetailsShopOrderListRequestModel({
    this.shopOrderId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["order_id"] = shopOrderId;

    return data;
  }
}

class ShopOrderListResponseModel {
  int? status;
  String? message;
  String? orderId;
  List<SdhopProductDetails>? shopProductDetails;
  String? deliveryCharge; //
  String? productAmountPaid;
  String? totalAmountPaid;
  int? productCount;
  String? countryName;
  String? cityName;
  String? address;
  String? paymentStatus;
  String? paymentMode;
  String? orderStatus;
  String? paymentDate;
  String? cargoCompanyName;
  String? cargoTrackingNumber;
  String? cargoTrackingUrl;
  String? cancellationReason;
  String? cancellationDate;
  String? cancellationBy;
  String? invoice;

  ShopOrderListResponseModel({
    required this.status,
    required this.message,
    required this.orderId,
    required this.shopProductDetails,
    required this.deliveryCharge,
    required this.productAmountPaid,
    required this.totalAmountPaid,
    required this.productCount,
    required this.countryName,
    required this.cityName,
    required this.address,
    required this.paymentStatus,
    required this.paymentMode,
    required this.orderStatus,
    required this.paymentDate,
    required this.cargoCompanyName,
    required this.cargoTrackingNumber,
    required this.cargoTrackingUrl,
    required this.cancellationReason,
    required this.cancellationDate,
    required this.cancellationBy,
    required this.invoice,
  });

  ShopOrderListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderId = json["orderId"];
    deliveryCharge = json["deliveryCharge"];
    productAmountPaid = json["productAmountPaid"];
    totalAmountPaid = json["totalAmountPaid"];
    productCount = json["productCount"];
    paymentStatus = json["paymentStatus"];
    paymentMode = json["paymentMode"];
    orderStatus = json["orderStatus"];
    paymentDate = json["paymentDate"];
    cargoCompanyName = json["cargoCompanyName"];
    cargoTrackingNumber = json["cargoTrackingNumber"];
    cargoTrackingUrl = json["cargoTrackingUrl"];
    cityName = json["city_name"];
    countryName = json["country_name"];
    cancellationReason = json["cancellation_reason"];
    cancellationDate = json["cancellation_date"];
    cancellationBy = json["cancellation_by"];
    address = json["address"];
    invoice = json["invoice_pdf_path"];

    if (json["products"] != null) {
      shopProductDetails = (json["products"] as List<dynamic>)
          .map((item) => SdhopProductDetails.fromJson(item))
          .toList();
    }
  }
}

class SdhopProductDetails {
  int? productId;
  String? productName;
  String? amountPaid;
  String? quantity;
  String? imageUrl;
  String? reviewFound;

  SdhopProductDetails({
    required this.productId,
    required this.productName,
    required this.amountPaid,
    required this.quantity,
    required this.imageUrl,
    required this.reviewFound,
  });

  SdhopProductDetails.fromJson(Map<String, dynamic> json) {
    productId = json["product_id"];
    productName = json["product_name"];
    amountPaid = json["amount_paid"];
    quantity = json["quantity"];
    imageUrl = json["image_url"];
    reviewFound = json['review_found'];
  }
}
