class TreatmentListResponseOdel {
  int? status;
  String? message;
  List<TreatmentList>? treatmentList;

  TreatmentListResponseOdel({
    required this.status,
    required this.message,
    required this.treatmentList,
  });
  TreatmentListResponseOdel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];

    if (json["treatment_list"] != null) {
      treatmentList = <TreatmentList>[];
      json["treatment_list"].forEach((v) {
        treatmentList!.add(TreatmentList.fromJson(v));
      });
    }
  }
}

class TreatmentList {
  int? id;
  String? treatmentName;

  TreatmentList({
    required this.id,
    required this.treatmentName,
  });
  TreatmentList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    treatmentName = json["treatment_name"];
  }
}
