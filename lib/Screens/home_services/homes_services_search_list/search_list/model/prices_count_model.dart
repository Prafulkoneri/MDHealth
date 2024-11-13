class PricesCountResponseModel {
  int? status;
  String? message;
  // List<PricesCountData>? pricesCountData;
  PricesCountData? pricesCountData;

  PricesCountResponseModel({
    this.status,
    this.message,
    this.pricesCountData,
  });
  PricesCountResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pricesCountData =
        json['data'] != null ? PricesCountData.fromJson(json['data']) : null;
  }
}

class PricesCountData {
  int? first;
  int? second;
  int? third;
  int? fourth;
  int? fifth;
  int? sixth;

  PricesCountData({
    this.first,
    this.second,
    this.third,
    this.fourth,
    this.fifth,
    this.sixth,
  });
  PricesCountData.fromJson(Map<String, dynamic> json) {
    first = json["0-10000"];
    second = json["10001-20000"];
    third = json["20001-50000"];
    fourth = json["50001-70000"];
    fifth = json["70001-90000"];
    sixth = json["100001-Above"];
  }
}
