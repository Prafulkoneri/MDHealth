class BankListModel {
  int? status;
  String? message;
  List<BankList>? bankList;

  BankListModel({
    required this.status,
    required this.message,
    required this.bankList,
  });
  BankListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["bank_list"] != null) {
      bankList = <BankList>[];
      json["bank_list"].forEach((v) {
        bankList!.add(BankList.fromJson(v));
      });
    }
  }
}

class BankList {
  String? bankName;
  int? id;

  BankList({
    required this.bankName,
  });
  BankList.fromJson(Map<String, dynamic> json) {
    bankName = json["bank_name"];
    id = json["id"];
  }
}
