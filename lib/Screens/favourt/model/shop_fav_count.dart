class ShopFavCountRes {
  int? status;
  String? message;
  // String? message;
  int? shopCount;
  ShopFavCountRes({
    required this.status,
    required this.message,
    required this.shopCount,
  });
  ShopFavCountRes.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    shopCount = json["favourite_count"];
  }
}
