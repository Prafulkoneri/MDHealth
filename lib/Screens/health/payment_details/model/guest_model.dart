class NumberAccomodationResponseModel {
  int? status;
  String? message;
  List<NumberData>? numbersdata;

  NumberAccomodationResponseModel({
    this.status,
    this.message,
    this.numbersdata,
  });
  NumberAccomodationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];

    if (json["numbers"] != null) {
      numbersdata = <NumberData>[];
      json["numbers"].forEach((v) {
        numbersdata!.add(NumberData.fromJson(v));
      });
    }
  }
}

class NumberData {
  int? id;
  NumberData({
    this.id,
  });
  NumberData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
  }
}
