class BankListModelRsponse {
  int? status;
  String? message;
  BankDetails? bankDetails;
  PackageDetails? packageDetails;

  BankListModelRsponse({
    required this.status,
    required this.message,
    required this.bankDetails,
    required this.packageDetails,
  });
  BankListModelRsponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    bankDetails = json['bank_details'] != null
        ? BankDetails.fromJson(json['bank_details'])
        : null;
    packageDetails = json['bank_details'] != null
        ? PackageDetails.fromJson(json['bank_details'])
        : null;
  }
}

class BankDetails {
  int? id;
  String? bankName;
  String? accountHolderName;
  String? accountNumber;

  BankDetails({
    required this.id,
    required this.bankName,
    required this.accountHolderName,
    required this.accountNumber,
  });
  BankDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    bankName = json["bank_name"];
    accountHolderName = json["account_holder_name"];
    accountNumber = json["account_number"];
  }
}

class PackageDetails {
  int? id;
  String? packageUniqueNo;
  String? packageName;

  PackageDetails({
    required this.id,
    required this.packageUniqueNo,
    required this.packageName,
  });
  PackageDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    packageUniqueNo = json["package_unique_no"];
    packageName = json["package_name"];
  }
}

///////////////////////////////////
class BankListRequestModel {
  // String? packageID;
  String? bankId;
  BankListRequestModel({
    // this.packageID,
    this.bankId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    // data["package_id"] = packageID;
    data["bank_id"] = bankId;
    return data;
  }
}
