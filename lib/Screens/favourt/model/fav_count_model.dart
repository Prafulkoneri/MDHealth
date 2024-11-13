// // class AddToFavModelRes {
// //   int? status;
// //   String? message;
// //   int? mdhealthcount;

// //   AddToFavModelRes({
// //     required this.status,
// //     required this.message,
// //     required this.mdhealthcount,
// //   });
// // AddToFavModelRes.fromJson(Map<String, dynamic> json) {
// //   status = json["status"];
// //   message = json["message"];
// //   mdhealthcount = json["mdhealthcount"];
// // }
// // }
// class AddToFavModelRes {
//   int? status;
//   String? message;
//   AddFavCount? addCount;

//   AddToFavModelRes({
//     required this.status,
//     required this.message,
//     required this.addCount,
//   });
//   AddToFavModelRes.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     addCount =
//         json['count'] != null ? AddFavCount.fromJson(json['count']) : null;
//   }
// }

// class AddFavCount {
//   int? mdhealthcount;

//   AddFavCount({
//     required this.mdhealthcount,
//   });
// AddFavCount.fromJson(Map<String, dynamic> json) {
//   mdhealthcount = json["mdhealthcount"];
// }
// }
class FavListRes {
  int? status;
  String? message;
  AddFavCount? addCount;
  FavListRes({
    required this.status,
    required this.message,
    required this.addCount,
  });
  FavListRes.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    addCount =
        json['count'] != null ? AddFavCount.fromJson(json['count']) : null;
  }
}

class AddFavCount {
  int? mdhealthcount;

  AddFavCount({
    required this.mdhealthcount,
  });
  AddFavCount.fromJson(Map<String, dynamic> json) {
    mdhealthcount = json["mdhealthcount"];
  }
}
