class ReportListModel {
  int? status;
  String? message;
  List<ProviderReportList>? providerReportList;

  ReportListModel({
    this.status,
    this.message,
    this.providerReportList,
  });

  ReportListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];

    if (json["provider_report_list"] != null) {
      providerReportList = <ProviderReportList>[];
      json["provider_report_list"].forEach((v) {
        providerReportList!.add(ProviderReportList.fromJson(v));
      });
    }
  }
}

class ProviderReportList {
  int? providerId;
  int? purchaseId;
  String? companyName;
  int? reportCount;
  String? logo;

  ProviderReportList({
    this.providerId,
    this.purchaseId,
    this.companyName,
    this.reportCount,
    this.logo,
  });

  ProviderReportList.fromJson(Map<String, dynamic> json) {
    providerId = json["provider_id"];
    purchaseId = json["purchase_id"];
    companyName = json["company_name"];
    reportCount = json["report_count"];
    logo = json["company_logo_image_path"];
  }
}
