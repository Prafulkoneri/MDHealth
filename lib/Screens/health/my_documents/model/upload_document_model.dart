import 'dart:io';

class UploadDocumentsReponseModel {
  int? status;
  String? message;

  UploadDocumentsReponseModel({
    required this.status,
    required this.message,
  });
  UploadDocumentsReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}

//////////////////////////////////////////////////
class UploadDocumentsRequestModel {
  String? packageId;
  String? purchesId;
  List<File>? documentFiles; // Updated to handle a list of File objects

  UploadDocumentsRequestModel({
    this.packageId,
    this.documentFiles,
    this.purchesId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["purchase_id"] = purchesId;
    return data;
  }
}
