// // /////////////////////////////
// // // ///Request Model///////////////////////

// class ViewMenuRequestNModel {
//   String? foodpackageId;

//   ViewMenuRequestNModel({
//     this.foodpackageId,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data["food_package_id"] = foodpackageId;
//     return data;
//   }
// }

// // ////////////////////////////////////////////RESPONse Model///////////////
// // class ViewMenuResponseModel {
// //   int? status;
// //   String? message;
// //   List<ViewMenuList>? viewmenuList;

// //   ViewMenuResponseModel({
// //     this.status,
// //     this.message,
// //     this.viewmenuList,
// //   });
// // ViewMenuResponseModel.fromJson(Map<String, dynamic> json) {
// //   status = json["status"];
// //   message = json["message"];
// //   if (json["data"] != null) {
// //     viewmenuList = <ViewMenuList>[];
// //     json["data"].forEach((v) {
// //       viewmenuList!.add(ViewMenuList.fromJson(v));
// //     });
// //   }
// // }
// // }

// // class ViewMenuList {
// //   int? id;
// //   String? category;
// //   List<MealType>? mealTypen;

// //   ViewMenuList({
// //     this.id,
// //     this.category,
// //     this.mealTypen,
// //   });
// // ViewMenuList.fromJson(Map<String, dynamic> json) {
// //   id = json["id"];
// //   category = json["category"];
// //   if (json["mealType"] != null) {
// //     mealTypen = <MealType>[];
// //     json["mealType"].forEach((v) {
// //       mealTypen!.add(MealType.fromJson(v));
// //     });
// //   }
// // }
// // }

// // class MealType {
// //   String? meal;
// //   List<String>? mealName;

// //   MealType({
// //     this.meal,
// //     this.mealName,
// //   });

// // MealType.fromJson(Map<String, dynamic> json) {
// //   meal = json["meal"];
// //   mealName = List<String>.from(json["mealName"]);
// // }
// // }
// class ViewMenuResponseModel {
//   int? status;
//   String? message;
//   List<ViewMenuDetailsData>? viewmenudata;
//   ViewMenuResponseModel({
//     this.status,
//     this.message,
//     this.viewmenudata,
//   });
//   ViewMenuResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     if (json["data"] != null) {
//       viewmenudata = <ViewMenuDetailsData>[];
//       json["data"].forEach((v) {
//         viewmenudata!.add(ViewMenuDetailsData.fromJson(v));
//       });
//     }
//   }
// }

// class ViewMenuDetailsData {
//   int? id;
//   String? category;
//   List<MealType>? mealTypes;

//   ViewMenuDetailsData({
//     this.id,
//     this.category,
//     this.mealTypes,
//   });
//   ViewMenuDetailsData.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     category = json["category"];
//     if (json["mealType"] != null) {
//       mealTypes = <MealType>[];
//       json["mealType"].forEach((v) {
//         mealTypes!.add(MealType.fromJson(v));
//       });
//     }
//   }
// }

// class MealType {
//   String? meal;
//   List<String>? mealName;
//   MealType({
//     this.meal,
//     this.mealName,
//   });
//   MealType.fromJson(Map<String, dynamic> json) {
//     meal = json["meal"];
//     mealName = json["mealName"] != null
//         ? List<String>.from(json["mealName"]!.map((x) => x))
//         : null;
//   }
// }
