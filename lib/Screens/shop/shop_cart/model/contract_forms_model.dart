class ContractFormsRequestModel {
  String? addressId;

  ContractFormsRequestModel({
    required this.addressId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_address_id'] = addressId;

    return data;
  }
}

class ContractFormsResponseModel {
  String? status;
  String? data;
  String? rightOfWithDrawl;
  String? preliminary;

  ContractFormsResponseModel({
    required this.status,
    required this.data,
    required this.rightOfWithDrawl,
    required this.preliminary,
  });

  ContractFormsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    rightOfWithDrawl = json['rightofwithdrawal'];
    preliminary = json['preliminary'];
  }
}
