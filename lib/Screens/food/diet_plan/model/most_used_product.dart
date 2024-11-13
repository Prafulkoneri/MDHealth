class MostUsedProviderFoodResponseModel {
  int? status;
  String? message;
  List<MostUsedData>? mostuseddata;

  MostUsedProviderFoodResponseModel({
    required this.status,
    required this.message,
    required this.mostuseddata,
  });
  MostUsedProviderFoodResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      mostuseddata = <MostUsedData>[];
      json["data"].forEach((v) {
        mostuseddata!.add(MostUsedData.fromJson(v));
      });
    }
  }
}

class MostUsedData {
  String? packageName;
  String? companyLogoImagePath;
  int? vendorId;
  String? verified;
  String? menu;
  int? averageRating;
  int? reviewCount;
  String? featuredstatus;

  MostUsedData({
    required this.packageName,
    required this.vendorId,
    required this.companyLogoImagePath,
    required this.menu,
    required this.verified,
    required this.averageRating,
    required this.reviewCount,
    required this.featuredstatus,
  });
  MostUsedData.fromJson(Map<String, dynamic> json) {
    packageName = json["company_name"];
    vendorId = json["provider_id"];
    companyLogoImagePath = json["company_logo"];
    menu = json["food_types"];
    verified = json["verificationStatus"];
    averageRating = json["average_rating"];
    reviewCount = json["review_count"];
    featuredstatus = json["featured_status"];
  }
}
