class VideowSheduleRequestModel {
  String? selectedTime;
  String? conversationSubject;
  String? conversationDate;
  String? conversationId;

  VideowSheduleRequestModel({
    this.selectedTime,
    this.conversationSubject,
    this.conversationDate,
    this.conversationId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["selected_time"] = selectedTime;
    data["conversation_subject"] = conversationSubject;
    data["conversation_date"] = conversationDate;
    data["conversation_id"] = conversationId;
    return data;
  }
}

//////////////////////////////////////////////////////
class VideowSheduleResponseModel {
  String? status;
  String? message;

  VideowSheduleResponseModel({
    required this.status,
    required this.message,
  });
  VideowSheduleResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
