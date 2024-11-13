class ReportListDetailsRequestModel{
  String? providerId;
  String? purchesId;

  ReportListDetailsRequestModel({
    this.providerId,
    this.purchesId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["provider_id"] = providerId;
    data["purchase_id"] = purchesId;
    return data;
  }
}

class ReportListDetailsResponseModel {
    int? status;
    String? message;
    List<ProviderReportList>? providerReportList;

    ReportListDetailsResponseModel({
        this.status,
        this.message,
        this.providerReportList,
    });

    ReportListDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
     if (json["provider_report_list"] != null) {
      providerReportList = <ProviderReportList>[];
      json["provider_report_list"].forEach((v) {
        providerReportList!
            .add(ProviderReportList.fromJson(v));
      });
    }
  }

}

class ProviderReportList {
    int? id;
    String? reportTitle;
    String? reportPath;
    String? reportName;
    String? createdAt;

    ProviderReportList({
        this.id,
        this.reportTitle,
        this.reportPath,
        this.reportName,
        this.createdAt,
    });

    ProviderReportList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    reportTitle = json["report_title"];
    reportPath = json["report_path"];
    reportName = json["report_name"];
    createdAt = json["created_at"];
  }

}
