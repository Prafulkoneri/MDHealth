// class CartDetailsViewResponseModel {
//   int? status;
//   String? message;
//   List<CartItem>? cartItem;
//   int? cartTotalPrice;
//   int? productPrice;
//   int? salePrice;

//   CartDetailsViewResponseModel({
//     required this.status,
//     required this.message,
//     required this.cartItem,
//     required this.cartTotalPrice,
//     required this.productPrice,
//     required this.salePrice,
//   });
// CartDetailsViewResponseModel.fromJson(Map<String, dynamic> json) {
//   status = json["status"];
//   message = json["message"];
//   cartTotalPrice = json["cart_total_price"];
//   productPrice = json["product_price"];
//   salePrice = json["sale_price"];

//   if (json["cart_item"] != null) {
//     cartItem = <CartItem>[];
//     json["cart_item"].forEach((v) {
//       cartItem!.add(CartItem.fromJson(v));
//     });
//   }
// }
// }

// class CartItem {
//   int? id;
//   String? productName;
//   String? productDescrition;
//   String? productPrice;
//   String? shippingFee;
//   String? freeShipping;
//   String? discount;
//   String? salePrice;
//   String? productImagePath;
//   String? vendor;
//   String? quantity;

//   CartItem({
//     required this.id,
//     required this.productName,
//     required this.productDescrition,
//     required this.productPrice,
//     required this.shippingFee,
//     required this.freeShipping,
//     required this.discount,
//     required this.salePrice,
//     required this.productImagePath,
//     required this.vendor,
//     required this.quantity,
//   });

// CartItem.fromJson(Map<String, dynamic> json) {
//   id = json["id"];
//   productName = json["product_name"];
//   productDescrition = json["product_descrition"];
//   productPrice = json["product_price"];
//   shippingFee = json["shipping_fee"];
//   freeShipping = json["free_shipping"];
//   discount = json["discount"].toString(); // Convert integer to string
//   salePrice = json["sale_price"];
//   productImagePath = json["product_image_path"];
//   vendor = json["vendor"];
//   quantity = json["quantity"];
// }
// }
class CartDetailsViewResponseModel {
  int? status;
  String? message;
  List<CartItem>? cartItem;
  CustomerList? customerList;
  String? cartTotalPrice;
  String? productPrice;
  String? salePrice;
  String? quantity;
  String? productName;
  String? deliveryChargesTotal;
  String? freeShipping;

  CartDetailsViewResponseModel({
    required this.status,
    required this.message,
    required this.cartItem,
    required this.cartTotalPrice,
    required this.productPrice,
    required this.salePrice,
    required this.quantity,
    required this.productName,
    required this.deliveryChargesTotal,
    required this.freeShipping,
    this.customerList,
  });

  CartDetailsViewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    cartTotalPrice = json["cart_total_price"];
    quantity = json["quantity"];
    productName = json["product_name"];
    deliveryChargesTotal = json["shipingTotalPrice"];

    // Ensure to parse string values to integers
    productPrice = json["product_price"];
    salePrice = json["sale_price"];
    freeShipping = json["free_shipping"];
    customerList = json['customer_list'] != null
        ? CustomerList.fromJson(json['customer_list'])
        : null;
    if (json["cart_item"] != null) {
      cartItem = <CartItem>[];
      json["cart_item"].forEach((v) {
        cartItem!.add(CartItem.fromJson(v));
      });
    }
  }
}

class CartItem {
  int? id;
  String? productName;
  String? productDescription;
  int? cartId;
  String? shippingFee;
  String? freeShipping;
  String? discount;
  // String? salePrice;
  String? productImagePath;
  String? vendor;
  String? quantity;

  CartItem({
    required this.id,
    required this.cartId,
    required this.productName,
    required this.productDescription,
    // required this.productPrice,
    required this.shippingFee,
    required this.freeShipping,
    required this.discount,
    // required this.salePrice,
    required this.productImagePath,
    required this.vendor,
    required this.quantity,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json["product_id"];
    // id = json["id"];
    cartId = json["id"];
    productName = json["product_name"];
    productDescription = json["product_description"];
    // productPrice = json["product_price"];
    shippingFee = json["shipping_fee"];
    freeShipping = json["free_shipping"];
    discount = json["discount"].toString(); // Convert integer to string
    // salePrice = json["sale_price"];
    productImagePath = json["product_image_path"];
    vendor = json["vendor"];
    quantity = json["quantity"];
  }

  // set quantity(String? quantity) {}
}
//////////////////////////////////////////////////

class CustomerList {
  String? firstName;
  String? lastName;
  String? fullName;
  String? address;
  String? addressName;
  String? countryName;
  String? cityName;
  String? postalCode;
  String? phoneNo;
  String? userAddress;
  String? userPostalCode;
  String? userPhoneNo;

  CustomerList({
    this.firstName,
    this.lastName,
    this.fullName,
    this.address,
    this.addressName,
    this.countryName,
    this.cityName,
    this.postalCode,
    this.phoneNo,
    this.userAddress,
    this.userPostalCode,
    this.userPhoneNo,
  });
  CustomerList.fromJson(Map<String, dynamic> json) {
    firstName = json["first_name"];
    // id = json["id"];
    lastName = json["last_name"];
    fullName = json["full_name"];
    address = json["address"];
    countryName = json["country_name"];
    addressName = json["address_name"];
    cityName = json["city_name"];
    postalCode = json["postal_code"]; // Convert integer to string
    phoneNo = json["phone_no"];
    userAddress = json["user_address"];
    userPostalCode = json["user_postal_code"];
    userPhoneNo = json["user_phone_no"];
  }
}

/////////////////////////////////////////////////
class CartDetailsViewRequestModel {
  String? addressID;

  CartDetailsViewRequestModel({
    this.addressID,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["user_address_id"] = addressID ?? "";
    return data;
  }
}
