class ShopAdsResponseModel {
  int? status;
  String? message;
  AdsData? adsdata;

  ShopAdsResponseModel({
    this.status,
    this.message,
    this.adsdata,
  });
  ShopAdsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    adsdata = json['data'] != null ? AdsData.fromJson(json['data']) : null;
  }
}

class AdsData {
  int? id;
  String? adsUrl;
  String? adsImagePath;

  AdsData({
    this.id,
    this.adsUrl,
    this.adsImagePath,
  });
  AdsData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    adsUrl = json["ads_url"];
    adsImagePath = json["ads_image_path"];
  }
}
