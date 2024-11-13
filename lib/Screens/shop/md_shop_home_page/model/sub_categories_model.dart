class SubCategoriesRequestModel {
  int? categoryId;

  SubCategoriesRequestModel({
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["category_id"] = categoryId;

    return data;
  }
}

class SubCategoriesResponseModel {
  String? status;
  String? message;
  List<SubCategoryList>? subCategoryList;

  SubCategoriesResponseModel({
    required this.status,
    required this.message,
    required this.subCategoryList,
  });

  SubCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['products'] != null) {
      subCategoryList = <SubCategoryList>[];
      json['products'].forEach((v) {
        subCategoryList!.add(SubCategoryList.fromJson(v));
      });
    }
  }
}

class SubCategoryList {
  int? id;
  String? subCategoryName;

  SubCategoryList({
    required this.id,
    required this.subCategoryName,
  });

  SubCategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryName = json['sub_category_name'];
  }
}
