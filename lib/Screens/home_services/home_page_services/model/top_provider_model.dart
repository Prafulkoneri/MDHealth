// class TopProviderHomeServicesResponseModel {
//   String? status;
//   String? message;
//   List<TopHomeProviderServicesData>? tophomeProviderservicesData;

//   TopProviderHomeServicesResponseModel({
//     this.status,
//     this.message,
//     this.tophomeProviderservicesData,
//   });
//   TopProviderHomeServicesResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];

//     if (json["data"] != null) {
//       tophomeProviderservicesData = <TopHomeProviderServicesData>[];
//       json["data"].forEach((v) {
//         tophomeProviderservicesData!
//             .add(TopHomeProviderServicesData.fromJson(v));
//       });
//     }
//   }
// }

// class TopHomeProviderServicesData {
//   String? id;
//   String? companyName;
//   String? verified;
//   String? logo;
//   String? services;
//   String? avgStars;
//   String? totalReviewsCount;

//   TopHomeProviderServicesData({
//     this.id,
//     this.companyName,
//     this.verified,
//     this.logo,
//     this.services,
//     this.avgStars,
//     this.totalReviewsCount,
//   });
// TopHomeProviderServicesData.fromJson(Map<String, dynamic> json) {
//   id = json["id"];
//   companyName = json["company_name"];
//   verified = json["verified"];
//   logo = json["logo"];
//   services = json["services"];
//   avgStars = json["avg_stars"];
//   totalReviewsCount = json["total_reviews_count"];
// }
// }

///////////////////////////////////////////////////////////////////////////////////////////////
class TopProviderHomeServicesResponseModel {
  String? status;
  String? message;
  List<TopHomeProviderServicesData>? tophomeProviderservicesData;

  TopProviderHomeServicesResponseModel({
    this.status,
    this.message,
    this.tophomeProviderservicesData,
  });
  TopProviderHomeServicesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json["data"] != null) {
      tophomeProviderservicesData = <TopHomeProviderServicesData>[];
      json["data"].forEach((v) {
        tophomeProviderservicesData!
            .add(TopHomeProviderServicesData.fromJson(v));
      });
    }
  }
}

class TopHomeProviderServicesData {
  int? id;
  String? companyName;
  String? verified;
  String? logo;
  String? services;
  String? featuredStatus;
  int? avgStars;
  int? totalReviewsCount;

  TopHomeProviderServicesData({
    this.id,
    this.logo,
    this.companyName,
    this.services,
    this.avgStars,
    this.totalReviewsCount,
    this.verified,
    this.featuredStatus,
  });
  TopHomeProviderServicesData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    companyName = json["package_name"];
    verified = json["verified"];
    logo = json["logo"];
    services = json["other_services"];
    avgStars = json["average_rating"];
    totalReviewsCount = json["reviews_count"];
    featuredStatus = json["featured_status"];
  }
}
