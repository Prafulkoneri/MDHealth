class TimeActiveResponseModel {
  String? status;
  String? message;
  List<TimeSelectData>? timeSelectData;

  TimeActiveResponseModel({
    this.status,
    this.message,
    this.timeSelectData,
  });
  TimeActiveResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      timeSelectData = <TimeSelectData>[];
      json["data"].forEach((v) {
        timeSelectData!.add(TimeSelectData.fromJson(v));
      });
    }
  }
}

class TimeSelectData {
  String? time;
  String? status;

  TimeSelectData({
    this.time,
    this.status,
  });
  TimeSelectData.fromJson(Map<String, dynamic> json) {
    time = json["time"];
    status = json["status"];
  }
}

///////////////////////////////////////////////////
class TimeActiveRequestModel {
  String? conversationId;
  String? conversationDate;
  String? conversationObject;

  TimeActiveRequestModel({
    this.conversationId,
    this.conversationDate,
    this.conversationObject,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["conversation_id"] = conversationId;
    data["conversation_date"] = conversationDate;
    data["conversation_object"] = conversationObject;
    return data;
  }
}
