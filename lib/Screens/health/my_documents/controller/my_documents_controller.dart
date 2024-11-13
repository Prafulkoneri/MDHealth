// // import 'dart:convert';
// // import 'dart:developer';
// // import 'dart:io';

// // import 'package:async/async.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter/material.dart';
// // import 'package:md_health/Screens/my_details/model/my_detail_model.dart';
// // import 'package:md_health/Screens/my_documents/model/my_documents_model.dart';
// // import 'package:md_health/Screens/my_documents/model/remove_document_model.dart';
// // import 'package:md_health/Screens/my_documents/model/upload_document_model.dart';
// // import 'package:md_health/Screens/my_documents/repository/my_document_view.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:md_health/Screens/my_documents/repository/remove_document_repo.dart';
// // import 'package:md_health/Screens/my_documents/repository/upload_document_repo.dart';
// // import 'package:md_health/Screens/my_documents/view/my_document_view.dart';
// // import 'package:md_health/Screens/packages/view/packages_view.dart';
// // import 'package:md_health/network/end_point.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:md_health/widget/loading_overlay.dart';
// // import 'package:path/path.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class MyDocumnetsListController extends ChangeNotifier {
// //   UploadDocumentRepo uploadDocumentRepo = UploadDocumentRepo();
// //   RemoveDocumentlist removeDocumentlist = RemoveDocumentlist();
// //   DocumentListViewRepo documentListViewRepo = DocumentListViewRepo();
// //   String packageId = '';
// //   String removeId = '';
// //   String documentPath = '';
// //   String patientId = '';
// //   String purchaseId = '';
// //   bool isLoading = true;
// //   // List<Datadocumentd>? documentData;

// //   Future<void> initState(context, pId, puId) async {
// //     this.packageId = pId;
// //     this.purchaseId = puId;
// //     await documentList(context);
// //     // documentListRepo(context, pId);
// //     notifyListeners();
// //   }

// //   showLoader(value) {
// //     isLoading = value;
// //     notifyListeners();
// //   }

// //   List<Datadocumentdl>? documentDataL;
// //   DocumentsRequestListModel get documentsRequestListModel =>
// //       DocumentsRequestListModel(purchesId: purchaseId, packageId: packageId);
// //   Future<void> documentList(context) async {
// //     showLoader(true);

// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     documentListViewRepo
// //         .documentList(documentsRequestListModel, pref.getString("successToken"))
// //         .then((response) async {
// //       debugPrint('/////////////');
// //       final result =
// //           DocumentListReponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);

// //         // Filter out entries with empty paths
// //         documentDataL = result.documentDataL
// //             ?.where((document) =>
// //                 document.customerDocumentImagePath?.isNotEmpty ?? false)
// //             .toList();

// //         showLoader(false);
// //         notifyListeners();
// //       } else {
// //         log(response.body);
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   /////////////////////////////
// //   UploadDocumentsRequestModel get uploadDocumentsRequestModel =>
// //       UploadDocumentsRequestModel(
// //         purchesId: purchaseId.toString(),
// //         documentPath: documentPath.toString(),
// //         packageId: packageId.toString(),
// //       );
// //   Future<void> uploadDocuments(context, pId, dpath) async {
// //     packageId = pId.toString();
// //     documentPath = dpath.toString();
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     uploadDocumentRepo
// //         .documentUpload(
// //             uploadDocumentsRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       debugPrint('/////////////');
// //       final result =
// //           UploadDocumentsReponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);
// //         await uploadImage(context);
// //         await documentList(
// //           context,
// //         );
// //         notifyListeners();
// //       } else {
// //         log(response.body);
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       // test: (Object e) {
// //       //   Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       //   return false;
// //       // },
// //     );
// //   }

// // ///////////////////////////////////////////////
// //   RemoveDocumenbtRequestModel get removeDocumenbtRequestModel =>
// //       RemoveDocumenbtRequestModel(
// //         id: removeId.toString(),
// //       );
// //   Future<void> removeDocument(
// //     context,
// //     rId,
// //   ) async {
// //     removeId = rId.toString();
// //     // documentPath = dpath.toString();
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     removeDocumentlist
// //         .removeDocument(
// //             removeDocumenbtRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       debugPrint('/////////////');
// //       final result =
// //           RemoveDocumenbtResponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);
// //         await documentList(context);

// //         // uploadImage(context);
// //         notifyListeners();
// //       } else {
// //         log(response.body);
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   //////////////////////////
// //   String networkImage1 = "";
// //   String fileName1 = "";
// //   File fileImage1 = File("");
// //   String image1Type = "";
// //   void onChooseFile1() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles(
// //       type: FileType.custom,
// //       allowedExtensions: ['pdf', 'jpg', 'png'],
// //     );

// //     if (result != null) {
// //       networkImage1 = "";
// //       fileName1 = result.files.first.name;
// //       print(result.files.single.extension);
// //       fileImage1 = File(result.files.single.path ?? "");
// //       if (result.files.single.extension == "pdf") {
// //         image1Type = "pdf";
// //       } else {
// //         image1Type = "jpg";
// //       }

// //       await uploadDocuments(context, packageId, fileImage1);
// //       notifyListeners();
// //     }
// //   }

// //   //////////////////////////////////

// //   Future uploadImage(context) async {
// //     LoadingOverlay.of(context).show();
// //     print("888888");
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     String token = pref.getString("successToken").toString();
// //     print(token);
// //     var uri = Uri.parse(Endpoint.uploadDocument);
// //     http.MultipartRequest request = http.MultipartRequest('POST', uri);
// //     request.headers['Authorization'] = "Bearer $token";
// //     request.fields['package_id'] = packageId.toString();
// //     request.fields['purchase_id'] = purchaseId.toString();
// //     List<http.MultipartFile> newList = <http.MultipartFile>[];
// //     File imageFile1 = fileImage1;

// //     var stream1 =
// //         http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));

// //     var length1 = await imageFile1.length();
// //     var multipartFile1 = http.MultipartFile(
// //         "customer_document_image_path", stream1, length1,
// //         filename: basename(imageFile1.path));
// //     newList.add(multipartFile1);
// //     request.files.addAll(newList);
// //     print(request.fields);
// //     var streamedResponse = await request.send();
// //     var response = await http.Response.fromStream(streamedResponse);
// //     print(response.body);
// //     if (response.statusCode == 200) {
// //       SharedPreferences pref = await SharedPreferences.getInstance();
// //       pref.setString('status', 'Uploaded');
// //       Utils.showPrimarySnackbar(context, "Updated Successfully",
// //           type: SnackType.success);
// //       notifyListeners();
// //     } else {
// //       LoadingOverlay.of(context).hide();
// //       Utils.showPrimarySnackbar(context, "Error on uploading",
// //           type: SnackType.error);
// //       return;
// //     }
// //   }
// // }
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:async/async.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/health/my_details/model/my_detail_model.dart';
// import 'package:md_health/Screens/health/my_documents/model/my_documents_model.dart';
// // import 'package:md_health/Screens/my_documents/model/remove_document_model.dart';
// // import 'package:md_health/Screens/my_documents/model/upload_document_model.dart';
// // import 'package:md_health/Screens/my_documents/repository/my_document_view.dart';
// import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/health/my_documents/model/remove_document_model.dart';
// import 'package:md_health/Screens/health/my_documents/model/upload_document_model.dart';
// import 'package:md_health/Screens/health/my_documents/repository/my_document_view.dart';
// import 'package:md_health/Screens/health/my_documents/repository/remove_document_repo.dart';
// import 'package:md_health/Screens/health/my_documents/repository/upload_document_repo.dart';
// import 'package:md_health/Screens/health/my_documents/view/my_document_view.dart';
// import 'package:md_health/Screens/health/packages/view/packages_view.dart';
// import 'package:md_health/network/end_point.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/loading_overlay.dart';
// import 'package:path/path.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyDocumnetsListController extends ChangeNotifier {
//   UploadDocumentRepo uploadDocumentRepo = UploadDocumentRepo();
//   RemoveDocumentlist removeDocumentlist = RemoveDocumentlist();
//   DocumentListViewRepo documentListViewRepo = DocumentListViewRepo();
//   String packageId = '';
//   String removeId = '';
//   String documentPath = '';
//   String patientId = '';
//   String purchaseId = '';
//   bool isLoading = true;
//   // List<Datadocumentd>? documentData;

//   Future<void> initState(context, pId, puId) async {
//     this.packageId = pId;
//     this.purchaseId = puId;
//     documentList(context);
//     // documentListRepo(context, pId);
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   List<Datadocumentdl>? documentDataL;
//   DocumentsRequestListModel get documentsRequestListModel =>
//       DocumentsRequestListModel(purchesId: purchaseId, packageId: packageId);
//   Future<void> documentList(context) async {
//     showLoader(true);

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     documentListViewRepo
//         .documentList(documentsRequestListModel, pref.getString("successToken"))
//         .then((response) async {
//       debugPrint('/////////////');
//       final result =
//           DocumentListReponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);

//         // Filter out entries with empty paths
//         documentDataL = result.documentDataL
//             ?.where((document) =>
//                 document.customerDocumentImagePath?.isNotEmpty ?? false)
//             .toList();

//         showLoader(false);
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   /////////////////////////////
//   UploadDocumentsRequestModel get uploadDocumentsRequestModel =>
//       UploadDocumentsRequestModel(
//         purchesId: purchaseId.toString(),
//         documentPaths: selectedFiles
//             .map((file) => file.path)
//             .toList(), // Provide list of file paths
//         packageId: packageId.toString(),
//       );
//   Future<void> uploadDocuments(context, pId, dpath) async {
//     packageId = pId.toString();
//     documentPath = dpath.toString();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     uploadDocumentRepo
//         .documentUpload(
//             uploadDocumentsRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       debugPrint('/////////////');
//       final result =
//           UploadDocumentsReponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         await uploadImages(context);
//         await documentList(
//           context,
//         );
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       // test: (Object e) {
//       //   Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       //   return false;
//       // },
//     );
//   }

// ///////////////////////////////////////////////
//   RemoveDocumenbtRequestModel get removeDocumenbtRequestModel =>
//       RemoveDocumenbtRequestModel(
//         id: removeId.toString(),
//       );
//   Future<void> removeDocument(
//     context,
//     rId,
//   ) async {
//     removeId = rId.toString();
//     // documentPath = dpath.toString();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     removeDocumentlist
//         .removeDocument(
//             removeDocumenbtRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       debugPrint('/////////////');
//       final result =
//           RemoveDocumenbtResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         await documentList(context);

//         // uploadImage(context);
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   //////////////////////////
//   // String networkImage1 = "";
//   // String fileName1 = "";
//   // File fileImage1 = File("");
//   // String image1Type = "";
//   // void onChooseFile1() async {
//   //   FilePickerResult? result = await FilePicker.platform.pickFiles(
//   //     type: FileType.custom,
//   //     allowedExtensions: ['pdf', 'jpg', 'png'],
//   //   );

//   //   if (result != null) {
//   //     networkImage1 = "";
//   //     fileName1 = result.files.first.name;
//   //     print(result.files.single.extension);
//   //     fileImage1 = File(result.files.single.path ?? "");
//   //     if (result.files.single.extension == "pdf") {
//   //       image1Type = "pdf";
//   //     } else {
//   //       image1Type = "jpg";
//   //     }

//   //     await uploadDocuments(context, packageId, fileImage1);
//   //     notifyListeners();
//   //   }
//   // }
//   List<File> selectedFiles = []; // List to hold selected files
//   List<String> imageTypes = ['']; // List to store types of images
//   void onChooseFiles() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'jpg', 'png'],
//       allowMultiple: true, // Allow multiple file selection
//     );

//     if (result != null) {
//       selectedFiles.clear();
//       for (var file in result.files) {
//         if (file.path != null) {
//           selectedFiles.add(File(file.path!));
//         }
//       }
//       await uploadDocuments(context, packageId, imageTypes);
//       notifyListeners();
//     }
//   }

//   //////////////////////////////////

//   // Future uploadImage(context) async {
//   //   // LoadingOverlay.of(context).show();
//   //   print("888888");
//   //   SharedPreferences pref = await SharedPreferences.getInstance();
//   //   String token = pref.getString("successToken").toString();
//   //   print(token);
//   //   var uri = Uri.parse(Endpoint.uploadDocument);
//   //   http.MultipartRequest request = http.MultipartRequest('POST', uri);
//   //   request.headers['Authorization'] = "Bearer $token";
//   //   request.fields['package_id'] = packageId.toString();
//   //   request.fields['purchase_id'] = purchaseId.toString();
//   //   List<http.MultipartFile> newList = <http.MultipartFile>[];
//   //   File imageFile1 = fileImage1;

//   //   var stream1 =
//   //       http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));

//   //   var length1 = await imageFile1.length();
//   //   var multipartFile1 = http.MultipartFile(
//   //       "customer_document_image_path", stream1, length1,
//   //       filename: basename(imageFile1.path));
//   //   newList.add(multipartFile1);
//   //   request.files.addAll(newList);
//   //   print(request.fields);
//   //   var streamedResponse = await request.send();
//   //   var response = await http.Response.fromStream(streamedResponse);
//   //   print(response.body);
//   //   if (response.statusCode == 200) {
//   //     SharedPreferences pref = await SharedPreferences.getInstance();
//   //     pref.setString('status', 'Uploaded');
//   //     // Utils.showPrimarySnackbar(context, "Updated Successfully",
//   //     //     type: SnackType.success);
//   //     // LoadingOverlay.of(context).hide();
//   //     notifyListeners();
//   //   } else {
//   //     // LoadingOverlay.of(context).hide();
//   //     Utils.showPrimarySnackbar(context, "Error on uploading",
//   //         type: SnackType.error);
//   //     return;
//   //   }
//   // }
//   Future<void> uploadImages(BuildContext context) async {
//     print("Starting upload...");
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String token = pref.getString("successToken") ?? "";

//     var uri = Uri.parse(Endpoint.uploadDocument);
//     var request = http.MultipartRequest('POST', uri)
//       ..headers['Authorization'] = "Bearer $token"
//       ..fields['package_id'] = packageId.toString()
//       ..fields['purchase_id'] = purchaseId.toString();

//     for (var file in selectedFiles) {
//       var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
//       var length = await file.length();
//       var multipartFile = http.MultipartFile(
//         "customer_document_image_path[]", // Change the key to an array-like key
//         stream,
//         length,
//         filename: basename(file.path),
//       );
//       request.files.add(multipartFile);
//     }

//     print(request.fields);
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//     print(response.body);

//     if (response.statusCode == 200) {
//       pref.setString('status', 'Uploaded');
//       Utils.showPrimarySnackbar(context, "Updated Successfully",
//           type: SnackType.success);
//     } else {
//       Utils.showPrimarySnackbar(context, "Error on uploading",
//           type: SnackType.error);
//     }
//   }
// }
///////////////////////////////////////////9/13/2024//////////////////////////////
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:async/async.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/my_details/model/my_detail_model.dart';
// import 'package:md_health/Screens/my_documents/model/my_documents_model.dart';
// import 'package:md_health/Screens/my_documents/model/remove_document_model.dart';
// import 'package:md_health/Screens/my_documents/model/upload_document_model.dart';
// import 'package:md_health/Screens/my_documents/repository/my_document_view.dart';
// import 'package:http/http.dart' as http;
// import 'package:md_health/Screens/my_documents/repository/remove_document_repo.dart';
// import 'package:md_health/Screens/my_documents/repository/upload_document_repo.dart';
// import 'package:md_health/Screens/my_documents/view/my_document_view.dart';
// import 'package:md_health/Screens/packages/view/packages_view.dart';
// import 'package:md_health/network/end_point.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/loading_overlay.dart';
// import 'package:path/path.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyDocumnetsListController extends ChangeNotifier {
//   UploadDocumentRepo uploadDocumentRepo = UploadDocumentRepo();
//   RemoveDocumentlist removeDocumentlist = RemoveDocumentlist();
//   DocumentListViewRepo documentListViewRepo = DocumentListViewRepo();
//   String packageId = '';
//   String removeId = '';
//   String documentPath = '';
//   String patientId = '';
//   String purchaseId = '';
//   bool isLoading = true;
//   // List<Datadocumentd>? documentData;

//   Future<void> initState(context, pId, puId) async {
//     this.packageId = pId;
//     this.purchaseId = puId;
//     await documentList(context);
//     // documentListRepo(context, pId);
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   List<Datadocumentdl>? documentDataL;
//   DocumentsRequestListModel get documentsRequestListModel =>
//       DocumentsRequestListModel(purchesId: purchaseId, packageId: packageId);
//   Future<void> documentList(context) async {
//     showLoader(true);

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     documentListViewRepo
//         .documentList(documentsRequestListModel, pref.getString("successToken"))
//         .then((response) async {
//       debugPrint('/////////////');
//       final result =
//           DocumentListReponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);

//         // Filter out entries with empty paths
//         documentDataL = result.documentDataL
//             ?.where((document) =>
//                 document.customerDocumentImagePath?.isNotEmpty ?? false)
//             .toList();

//         showLoader(false);
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   /////////////////////////////
//   UploadDocumentsRequestModel get uploadDocumentsRequestModel =>
//       UploadDocumentsRequestModel(
//         purchesId: purchaseId.toString(),
//         documentPath: documentPath.toString(),
//         packageId: packageId.toString(),
//       );
//   Future<void> uploadDocuments(context, pId, dpath) async {
//     packageId = pId.toString();
//     documentPath = dpath.toString();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     uploadDocumentRepo
//         .documentUpload(
//             uploadDocumentsRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       debugPrint('/////////////');
//       final result =
//           UploadDocumentsReponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         await uploadImage(context);
//         await documentList(
//           context,
//         );
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       // test: (Object e) {
//       //   Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       //   return false;
//       // },
//     );
//   }

// ///////////////////////////////////////////////
//   RemoveDocumenbtRequestModel get removeDocumenbtRequestModel =>
//       RemoveDocumenbtRequestModel(
//         id: removeId.toString(),
//       );
//   Future<void> removeDocument(
//     context,
//     rId,
//   ) async {
//     removeId = rId.toString();
//     // documentPath = dpath.toString();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     removeDocumentlist
//         .removeDocument(
//             removeDocumenbtRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       debugPrint('/////////////');
//       final result =
//           RemoveDocumenbtResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         await documentList(context);

//         // uploadImage(context);
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   //////////////////////////
//   String networkImage1 = "";
//   String fileName1 = "";
//   File fileImage1 = File("");
//   String image1Type = "";
//   void onChooseFile1() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'jpg', 'png'],
//     );

//     if (result != null) {
//       networkImage1 = "";
//       fileName1 = result.files.first.name;
//       print(result.files.single.extension);
//       fileImage1 = File(result.files.single.path ?? "");
//       if (result.files.single.extension == "pdf") {
//         image1Type = "pdf";
//       } else {
//         image1Type = "jpg";
//       }

//       await uploadDocuments(context, packageId, fileImage1);
//       notifyListeners();
//     }
//   }

//   //////////////////////////////////

//   Future uploadImage(context) async {
//     LoadingOverlay.of(context).show();
//     print("888888");
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String token = pref.getString("successToken").toString();
//     print(token);
//     var uri = Uri.parse(Endpoint.uploadDocument);
//     http.MultipartRequest request = http.MultipartRequest('POST', uri);
//     request.headers['Authorization'] = "Bearer $token";
//     request.fields['package_id'] = packageId.toString();
//     request.fields['purchase_id'] = purchaseId.toString();
//     List<http.MultipartFile> newList = <http.MultipartFile>[];
//     File imageFile1 = fileImage1;

//     var stream1 =
//         http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));

//     var length1 = await imageFile1.length();
//     var multipartFile1 = http.MultipartFile(
//         "customer_document_image_path", stream1, length1,
//         filename: basename(imageFile1.path));
//     newList.add(multipartFile1);
//     request.files.addAll(newList);
//     print(request.fields);
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//     print(response.body);
//     if (response.statusCode == 200) {
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.setString('status', 'Uploaded');
//       Utils.showPrimarySnackbar(context, "Updated Successfully",
//           type: SnackType.success);
//       notifyListeners();
//     } else {
//       LoadingOverlay.of(context).hide();
//       Utils.showPrimarySnackbar(context, "Error on uploading",
//           type: SnackType.error);
//       return;
//     }
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:async/async.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/my_details/model/my_detail_model.dart';
import 'package:md_health/Screens/health/my_documents/model/my_documents_model.dart';
// import 'package:md_health/Screens/my_documents/model/remove_document_model.dart';
// import 'package:md_health/Screens/my_documents/model/upload_document_model.dart';
// import 'package:md_health/Screens/my_documents/repository/my_document_view.dart';
import 'package:http/http.dart' as http;
import 'package:md_health/Screens/health/my_documents/model/remove_document_model.dart';
import 'package:md_health/Screens/health/my_documents/model/upload_document_model.dart';
import 'package:md_health/Screens/health/my_documents/repository/my_document_view.dart';
import 'package:md_health/Screens/health/my_documents/repository/remove_document_repo.dart';
import 'package:md_health/Screens/health/my_documents/repository/upload_document_repo.dart';
import 'package:md_health/Screens/health/my_documents/view/my_document_view.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDocumnetsListController extends ChangeNotifier {
  UploadDocumentRepo uploadDocumentRepo = UploadDocumentRepo();
  RemoveDocumentlist removeDocumentlist = RemoveDocumentlist();
  DocumentListViewRepo documentListViewRepo = DocumentListViewRepo();
  String packageId = '';
  String removeId = '';
  String documentPath = '';
  String patientId = '';
  String purchaseId = '';
  bool isLoading = true;
  // List<Datadocumentd>? documentData;

  Future<void> initState(context, pId, puId) async {
    this.packageId = pId;
    this.purchaseId = puId;
    documentList(context);
    // documentListRepo(context, pId);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  List<Datadocumentdl>? documentDataL;
  DocumentsRequestListModel get documentsRequestListModel =>
      DocumentsRequestListModel(purchesId: purchaseId, packageId: packageId);
  Future<void> documentList(context) async {
    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    documentListViewRepo
        .documentList(documentsRequestListModel, pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      final result =
          DocumentListReponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);

        // Filter out entries with empty paths
        documentDataL = result.documentDataL
            ?.where((document) =>
                document.customerDocumentImagePath?.isNotEmpty ?? false)
            .toList();

        showLoader(false);
        notifyListeners();
      } else {
        log(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  /////////////////////////////
  UploadDocumentsRequestModel get uploadDocumentsRequestModel =>
      UploadDocumentsRequestModel(
        purchesId: purchaseId.toString(),
        documentFiles: selectedFiles,
        packageId: packageId.toString(),
      );
  Future<void> uploadDocuments(context, pId, dpath) async {
    packageId = pId.toString();
    selectedFiles = dpath;
    SharedPreferences pref = await SharedPreferences.getInstance();
    uploadDocumentRepo
        .documentUpload(
            uploadDocumentsRequestModel, pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      final result =
          UploadDocumentsReponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        await uploadImages(context);
        await documentList(
          context,
        );
        notifyListeners();
      } else {
        log(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      // test: (Object e) {
      //   Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      //   return false;
      // },
    );
  }

///////////////////////////////////////////////
  RemoveDocumenbtRequestModel get removeDocumenbtRequestModel =>
      RemoveDocumenbtRequestModel(
        id: removeId.toString(),
      );
  Future<void> removeDocument(
    context,
    rId,
  ) async {
    removeId = rId.toString();
    // documentPath = dpath.toString();
    SharedPreferences pref = await SharedPreferences.getInstance();
    removeDocumentlist
        .removeDocument(
            removeDocumenbtRequestModel, pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      final result =
          RemoveDocumenbtResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        await documentList(context);

        // uploadImage(context);
        notifyListeners();
      } else {
        log(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  List<File> selectedFiles = []; // List to hold selected files

  void onChooseFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
      allowMultiple: true, // Allow multiple file selection
    );

    if (result != null) {
      selectedFiles.clear(); // Clear previously selected files
      for (var file in result.files) {
        if (file.path != null) {
          selectedFiles.add(File(file.path!)); // Add the actual File object
        }
      }
      await uploadDocuments(context, packageId, selectedFiles);
    }
  }

  //////////////////////////
  // String networkImage1 = "";
  // String fileName1 = "";
  // File fileImage1 = File("");
  // String image1Type = "";
  // void onChooseFile1() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf', 'jpg', 'png'],
  //   );

  //   if (result != null) {
  //     networkImage1 = "";
  //     fileName1 = result.files.first.name;
  //     print(result.files.single.extension);
  //     fileImage1 = File(result.files.single.path ?? "");
  //     if (result.files.single.extension == "pdf") {
  //       image1Type = "pdf";
  //     } else {
  //       image1Type = "jpg";
  //     }

  //     await uploadDocuments(context, packageId, fileImage1);
  //     notifyListeners();
  //   }
  // }
  // List<File> selectedFiles = []; // List to hold selected files
  // List<String> imageTypes = ['']; // List to store types of images
  // void onChooseFiles() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf', 'jpg', 'png'],
  //     allowMultiple: true, // Allow multiple file selection
  //   );

  //   if (result != null) {
  //     selectedFiles.clear();
  //     for (var file in result.files) {
  //       if (file.path != null) {
  //         selectedFiles.add(File(file.path!));
  //       }
  //     }
  //     await uploadDocuments(context, packageId, imageTypes);
  //     notifyListeners();
  //   }
  // }

  //////////////////////////////////

  // Future uploadImage(context) async {
  //   // LoadingOverlay.of(context).show();
  //   print("888888");
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String token = pref.getString("successToken").toString();
  //   print(token);
  //   var uri = Uri.parse(Endpoint.uploadDocument);
  //   http.MultipartRequest request = http.MultipartRequest('POST', uri);
  //   request.headers['Authorization'] = "Bearer $token";
  //   request.fields['package_id'] = packageId.toString();
  //   request.fields['purchase_id'] = purchaseId.toString();
  //   List<http.MultipartFile> newList = <http.MultipartFile>[];
  //   File imageFile1 = fileImage1;

  //   var stream1 =
  //       http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));

  //   var length1 = await imageFile1.length();
  //   var multipartFile1 = http.MultipartFile(
  //       "customer_document_image_path", stream1, length1,
  //       filename: basename(imageFile1.path));
  //   newList.add(multipartFile1);
  //   request.files.addAll(newList);
  //   print(request.fields);
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     pref.setString('status', 'Uploaded');
  //     // Utils.showPrimarySnackbar(context, "Updated Successfully",
  //     //     type: SnackType.success);
  //     // LoadingOverlay.of(context).hide();
  //     notifyListeners();
  //   } else {
  //     // LoadingOverlay.of(context).hide();
  //     Utils.showPrimarySnackbar(context, "Error on uploading",
  //         type: SnackType.error);
  //     return;
  //   }
  // }
  Future<void> uploadImages(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("successToken") ?? "";

    var uri = Uri.parse(Endpoint.uploadDocument);
    var request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = "Bearer $token"
      ..fields['package_id'] = packageId
      ..fields['purchase_id'] = purchaseId;

    // Add the actual files to the request
    for (var file in selectedFiles) {
      var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        "customer_document_image_path[]", // array-like key
        stream,
        length,
        filename: basename(file.path),
      );
      request.files.add(multipartFile);
    }

    var response = await request.send();
    var responseBody = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      Utils.showPrimarySnackbar(context, "Uploaded Successfully",
          type: SnackType.success);
    } else {
      Utils.showPrimarySnackbar(context, "Error on uploading",
          type: SnackType.error);
    }
  }
}
