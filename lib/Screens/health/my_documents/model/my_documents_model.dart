// class DocumentsRequestModel {
//   String? packageId;

//   DocumentsRequestModel({
//     this.packageId,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data["package_id"] = packageId;

//     return data;
//   }
// }

// ////////////////////////////////////////

// class DocumentsResposeModel {
//   int? status;
//   String? message;
//   List<Datadocumentd>? documentData;

//   DocumentsResposeModel({
//     required this.status,
//     required this.message,
//     required this.documentData,
//   });
// DocumentsResposeModel.fromJson(Map<String, dynamic> json) {
//   status = json["status"];
//   message = json["message"];

//   if (json["data"] != null) {
//     documentData = <Datadocumentd>[];
//     json["data"].forEach((v) {
//       documentData!.add(Datadocumentd.fromJson(v));
//     });
//   }
// }
// }

// class Datadocumentd {
//   int? id;
//   String? customerDocumentImagePath;
//   String? customerDocumentName;
//   int? packageId;

//   Datadocumentd({
//     required this.id,
//     required this.customerDocumentImagePath,
//     required this.customerDocumentName,
//     required this.packageId,
//   });
// Datadocumentd.fromJson(Map<String, dynamic> json) {
//   id = json["id"];
//   customerDocumentImagePath = json["customer_document_image_path"];
//   customerDocumentName = json["customer_document_image_name"];
//   packageId = json["package_id"];
// }
// }
class DocumentListReponseModel {
  int? status;
  String? message;
  List<Datadocumentdl>? documentDataL;
  DocumentListReponseModel({
    required this.status,
    required this.message,
    required this.documentDataL,
  });
  DocumentListReponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];

    // if (json["data"] != null) {
    //   documentDataL = <Datadocumentdl>[];
    //   json["data"].forEach((v) {
    //     documentDataL!.add(Datadocumentdl.fromJson(v));
    //   });
    // }
    if (json["data"] != null) {
      documentDataL = List<Datadocumentdl>.from(
        json["data"].map((v) => Datadocumentdl.fromJson(v)),
      );
    }
  }
}

class Datadocumentdl {
  int? id;
  String? customerDocumentImagePath;
  String? customerDocumentImageName;
  int? packageId;

  Datadocumentdl({
    required this.id,
    required this.customerDocumentImagePath,
    required this.customerDocumentImageName,
    required this.packageId,
  });
  Datadocumentdl.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    customerDocumentImagePath = json["customer_document_image_path"];
    customerDocumentImageName = json["customer_document_image_name"];
    packageId = json["package_id"];
  }
}

///////////////////////////////
class DocumentsRequestListModel {
  String? packageId;
  String? purchesId;

  DocumentsRequestListModel({
    this.packageId,
    this.purchesId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["package_id"] = packageId;
    data["purchase_id"] = purchesId;
    return data;
  }
}
