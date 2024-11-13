class HomeServicesFormViewHomeRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? country;
  String? contactNumber;
  String? homeServicesName;
  String? details;
  String? whyNeedHomeServices;
  String? homeServicesImagePath;

  HomeServicesFormViewHomeRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.country,
    this.homeServicesName,
    this.whyNeedHomeServices,
    this.details,
    this.homeServicesImagePath,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["email"] = email;
    data["contact_no"] = contactNumber;
    data["country_id"] = country;
    data["home_name_for_request"] = homeServicesName;
    data["details"] = details;
    data["why_do_you_need_home"] = whyNeedHomeServices;
    data["home_image_name"] = homeServicesImagePath;

    return data;
  }
}

////////////////////////////////RESP{ONSE/////////////////////////////}
class HomeServicesFormResponseModelView {
  String? status;
  String? message;

  HomeServicesFormResponseModelView({
    required this.status,
    required this.message,
  });
  HomeServicesFormResponseModelView.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
