class CategoriesResponseModel {
  String? status;
  String? message;
  List<CategoryList>? categoryList;

  CategoriesResponseModel(
      {required this.status,
      required this.message,
      required this.categoryList});

  CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['products'] != null) {
      categoryList = <CategoryList>[];
      json['products'].forEach((v) {
        // categoryList!.add(v);
        categoryList!.add(CategoryList.fromJson(v));
      });
    }
  }
}

class CategoryList {
  int? id;
  String? categoryName;

  CategoryList({
    required this.id,
    required this.categoryName,
  });

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }
}
