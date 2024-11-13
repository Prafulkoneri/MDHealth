// // import 'dart:async';
// // import 'dart:convert';
// // import 'dart:developer';

// // import 'package:flutter/material.dart';
// // import 'package:md_health/Screens/message/model/message_model.dart';
// // import 'package:md_health/Screens/message/repository/message_repo.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // class ConversationListController extends ChangeNotifier {

// //   ConversationListRepo conversationListRepo =  ConversationListRepo();
// //   String packageId = '';
// //   String removeId = '';
// //   String documentPath = '';
// //   String patientId = '';
// //   String purchaseId = '';
// //   bool isLoading = true;
// //   // List<Conversation>? conversationList;
// //   // List<Datadocumentd>? documentData;

// //   Future<void> initState(context) async {

// //     // getUserConversations(context);
// //     // documentListRepo(context, pId);
// //     notifyListeners();
// //   }

// //   showLoader(value) {
// //     isLoading = value;
// //     notifyListeners();
// //   }

// //   //////////////////////////////////

// //   // Future getUserConversations(context) async {
// //   //   // LoadingOverlay.of(context).show();
// //   //   print("888888");
// //   //   SharedPreferences pref = await SharedPreferences.getInstance();
// //   //   String token = pref.getString("successToken").toString();
// //   //   print(token);

// //   //   conversationListRepo
// //   //       .getConversationList( pref.getString("successToken"))
// //   //       .then((response) async {
// //   //     // log(response.body);
// //   //     debugPrint('/////////////');
// //   //     final result = GetConversationsResponseModel.fromJson(jsonDecode(response.body));
// //   //     if (response.statusCode == 200) {
// //   //       log(response.body);
// //   //       conversationList = result.conversations;
// //   //       showLoader(false);
// //   //       notifyListeners();
// //   //     } else {
// //   //       log(response.body);
// //   //       Utils.showPrimarySnackbar(context, result.message,
// //   //           type: SnackType.error);
// //   //     }
// //   //   }).onError((error, stackTrace) {
// //   //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //   //   }).catchError(
// //   //         (Object e) {
// //   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //   //     },
// //   //     test: (Object e) {
// //   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //   //       return false;
// //   //     },
// //   //   );
// //   // }

// // }
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:async/async.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:md_health/Screens/message/model/message_model.dart';
// import 'package:md_health/Screens/message/model/send_message_model.dart';
// import 'package:md_health/Screens/message/model/time_select_model.dart';
// import 'package:md_health/Screens/message/model/user_live_appoinment_model.dart';
// import 'package:md_health/Screens/message/model/videowShedule_model.dart';
// import 'package:md_health/Screens/message/repository/message_repo.dart';
// import 'package:md_health/Screens/message/repository/send_message_repo.dart';
// import 'package:md_health/Screens/message/repository/time_select_repo.dart';
// import 'package:md_health/Screens/message/repository/user_appoinment_repo.dart';
// import 'package:md_health/Screens/message/repository/video_shedule_repo.dart';
// import 'package:md_health/Screens/message/view/message_view.dart';
// import 'package:md_health/network/end_point.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:path/path.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart'; // For MultipartFile
// import 'package:path/path.dart'; // For basename

// class ConversationListController extends ChangeNotifier {
//   MessagelistRepo messagelistRepo = MessagelistRepo();
//   UserAppoinmnetrepo userAppoinmnetrepo = UserAppoinmnetrepo();
//   VideoSheduleRepo videoSheduleRepo = VideoSheduleRepo();
//   TimeSelectRepo timeSelectRepo = TimeSelectRepo();
//   SendMessageRepo sendMessageRepo = SendMessageRepo();
//   String? imgPath = "";
//   String? userId;
//   String? providerId;
//   String? selectedTime;
//   String? conversationSubject;
//   String? conversationDate;
//   String? conversationId;
//   List<Conversation>? conversations;
//   bool isLoading = true;

//   bool isCheckedOne = false;

//   Future<void> initState(context) async {
//     messageList(context);
//     // liveappointmentList(context);
//     // documentListRepo(context, pId);
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   void onCheckedOne(bool value) {
//     isCheckedOne = value;

//     notifyListeners();
//   }

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
//     }
//     notifyListeners();
//   }

//   String? selectedObject;

//   Future<void> onSelectObject(value) async {
//     selectedObject = value;
//     print(selectedObject);
//     notifyListeners();
//   }

//   String? selectedDate;

//   Future<void> onSelectDate(value) async {
//     selectedDate = value;
//     print(selectedDate);
//     notifyListeners();
//   }

//   int? selectedIndex;

//   // Method to handle selecting an item
//   void onSelectItem(int index) {
//     if (selectedIndex == index) {
//       selectedIndex = null; // Deselect the item if it's already selected
//     } else {
//       selectedIndex = index; // Select the item
//     }
//     notifyListeners();
//   }

//   List<TimeSelectData>? timeSelectData;

//   TimeActiveRequestModel get timeActiveRequestModel => TimeActiveRequestModel(
//       conversationObject: conversationSubject,
//       conversationId: conversationId,
//       conversationDate: conversationDate);

//   Future<void> timeSelecting(context, conId, conDate, cSubject) async {
//     // selectedTime = sTime.toString();
//     // conversationSubject = cSubject.toString();
//     conversationDate = conDate.toString();
//     conversationId = conId.toString();
//     conversationSubject = cSubject.toString();
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));

//     try {
//       final response = await timeSelectRepo.timeSelect(
//           timeActiveRequestModel, pref.getString("successToken"));

//       final result =
//           TimeActiveResponseModel.fromJson(jsonDecode(response.body));

//       if (response.statusCode == 200) {
//         log(response.body);
//         timeSelectData = result.timeSelectData;
//         showLoader(false);
//         notifyListeners();
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     } catch (e) {
//       Utils.showPrimarySnackbar(context, e.toString(),
//           type: SnackType.debugError);
//     }
//   }

//   //   showLoader(true);
//   //   SharedPreferences pref = await SharedPreferences.getInstance();
//   //   print(pref.getString("successToken"));
//   //   userAppoinmnetrepo
//   //       .appoinmentList(pref.getString("successToken"))
//   //       .then((response) {
//   //     log(response.body);
//   //     final result = LiveConvertionListResponseModel.fromJson(
//   //       jsonDecode(response.body),
//   //     );
//   //     if (response.statusCode == 200) {
//   //       if (result.status == 200) {
//   //         lisveConvertionList = result.lisveConvertionList;
//   //         showLoader(false);
//   //         Utils.showPrimarySnackbar(context, "", type: SnackType.success);
//   //         notifyListeners();
//   //       } else {
//   //         Utils.showPrimarySnackbar(context, "", type: SnackType.error);
//   //       }
//   //     } else {
//   //       Utils.showPrimarySnackbar(context, "", type: SnackType.error);
//   //     }
//   //   }).onError((error, stackTrace) {
//   //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//   //   }).catchError(
//   //     (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //     },
//   //     test: (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //       return false;
//   //     },
//   //   );
//   // }
//   String? messageText;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final ImagePicker _picker = ImagePicker();
//   String? selectedImagePath; // State variable to store the image path

//   TextEditingController messageController = TextEditingController();
//   String getCurrentDayOfWeek() {
//     final now = DateTime.now();
//     return DateFormat('EEEE').format(now);
//   }

//   int getCurrentUnixTimestamp() {
//     return DateTime.now().millisecondsSinceEpoch ~/ 1000;
//   }

//   String getCurrentTime() {
//     DateTime now = DateTime.now();
//     String formattedTime = DateFormat.Hm().format(now);
//     return formattedTime;
//   }

//   Future<void> sendMessage(context, messageText, imageUrl) async {
//     if ((messageText?.trim().isNotEmpty ?? false) || imageUrl != null) {
//       Map<String, dynamic> messageData = {
//         'text': messageText ?? '',
//         'sender_type': 'customer',
//         'env': 'development',
//         'current_time': getCurrentTime(),
//         'media_url': imageUrl ?? '', // Include image URL
//         'day_of_week': getCurrentDayOfWeek(),
//         'attachment_id': '',
//         'sender_id': userId.toString(),
//         'timestamp': getCurrentUnixTimestamp(),
//         'conversation_id': conversationId,
//       };

//       try {
//         await FirebaseFirestore.instance
//             .collection('messages')
//             .add(messageData); // Save the message in Firebase
//         messageController.clear();
//         // setState(() {
//         selectedImagePath = null; // Clear selected image after sending
//         notifyListeners();
//         // });
//       } catch (e) {
//         Utils.showPrimarySnackbar(context, "Failed to send message: $e",
//             type: SnackType.error);
//       }
//     } else {
//       Utils.showPrimarySnackbar(
//           context, "Please enter a message or select an image",
//           type: SnackType.error);
//     }
//   }

//   String? imagenew;

//   Future uploadImage(context) async {
//     // LoadingOverlay.of(context).show();
//     print("888888");
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String token = pref.getString("successToken").toString();
//     print(token);
//     var uri = Uri.parse(Endpoint.sendMessage);
//     http.MultipartRequest request = http.MultipartRequest('POST', uri);
//     request.headers['Authorization'] = "Bearer $token";
//     request.fields['senderId'] = userId.toString();
//     request.fields['sender_type'] = 'customer';
//     request.fields['conversation_id'] = conversationId.toString();

//     List<http.MultipartFile> newList = <http.MultipartFile>[];
//     File imageFile1 = fileImage1;

//     var stream1 =
//         http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));

//     var length1 = await imageFile1.length();
//     var multipartFile1 = http.MultipartFile("media", stream1, length1,
//         filename: basename(imageFile1.path));
//     newList.add(multipartFile1);

//     // print(newList);
//     request.files.addAll(newList);
//     print(request.fields);
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//     print(response.body);
//     if (response.statusCode == 200) {
//       // LoadingOverlay.of(context).hide();
//       // Navigator.pushReplacement(
//       //     context, MaterialPageRoute(builder: (context) => const KycCompletedView()));
//       // SharedPreferences pref = await SharedPreferences.getInstance();
//       // pref.setString('status', 'kycUploaded');
//       Utils.showPrimarySnackbar(context, "Updated Successfully",
//           type: SnackType.success);
//     } else {
//       // LoadingOverlay.of(context).hide();
//       Utils.showPrimarySnackbar(context, "Error on uploading",
//           type: SnackType.error);
//       return;
//     }
//   }

//   SendMessageRequestModel get sendMessageRequestModel =>
//       SendMessageRequestModel(
//         conversationId: conversationId,
//         senderId: userId.toString(),
//         senderType: "customer",
//         msgImgPath: fileImage1.path,
//       );
//   List<File> selectedFiles = []; // List to hold selected files

//   // Future<void> sendMessageApi(context, cId, sId, fileUri) async {
//   //   showLoader(true);
//   //   conversationId = cId;
//   //   userId = sId;
//   //   SharedPreferences pref = await SharedPreferences.getInstance();

//   //   sendMessageRepo
//   //       .sendMessage(sendMessageRequestModel, pref.get('successToken'))
//   //       .then((response) {
//   //     log(response.body);
//   //     final result =
//   //         SendMessageResponseModel.fromJson(jsonDecode(response.body));
//   //     print(response.statusCode);
//   //     if (response.statusCode == 200) {
//   //       print(response.body);
//   //       uploadImage(context);
//   //       imagenew = result.imagenew;
//   //       sendMessage(context, messageController.text, imagenew);
//   //       showLoader(false);
//   //       notifyListeners();
//   //     } else {
//   //       Utils.showPrimarySnackbar(context, result.message,
//   //           type: SnackType.error);
//   //     }
//   //   }).onError((error, stackTrace) {
//   //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//   //   }).catchError(
//   //     (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //     },
//   //     test: (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //       return false;
//   //     },
//   //   );
//   // }
//   Future<void> sendMessageApi(context, cId, sId, fileUri) async {
//     showLoader(true);
//     conversationId = cId;
//     userId = sId;
//     SharedPreferences pref = await SharedPreferences.getInstance();

//     try {
//       final response = await sendMessageRepo.sendMessage(
//           sendMessageRequestModel, pref.getString('successToken') ?? '');

//       log(response.body);

//       if (response.statusCode == 200) {
//         final result =
//             SendMessageResponseModel.fromJson(jsonDecode(response.body));
//         print("Status Code: ${response.statusCode}");
//         print("Response Body: ${response.body}");
//         print("Cleaned URL: ${result.imagenew}");

//         uploadImage(context);
//         imagenew = result.imagenew;
//         sendMessage(context, messageController.text, imagenew);
//       } else {
//         final result =
//             SendMessageResponseModel.fromJson(jsonDecode(response.body));
//         Utils.showPrimarySnackbar(context, result.message ?? 'Error occurred',
//             type: SnackType.error);
//       }
//     } catch (error) {
//       Utils.showPrimarySnackbar(context, error.toString(),
//           type: SnackType.debugError);
//     } finally {
//       showLoader(false);
//       notifyListeners();
//     }
//   }

//   Future<void> messageList(context) async {
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     messagelistRepo
//         .messageList(pref.getString("successToken"))
//         .then((response) {
//       log(response.body);
//       final result = ConversionListModel.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           conversations = result.conversations;
//           userId = result.userId.toString();
//           providerId = result.providerId;
//           conversationId = result.conversationId;
//           showLoader(false);
//           Utils.showPrimarySnackbar(context, "", type: SnackType.success);
//           notifyListeners();
//         } else {
//           Utils.showPrimarySnackbar(context, "", type: SnackType.error);
//         }
//       } else {
//         Utils.showPrimarySnackbar(context, "", type: SnackType.error);
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

//   /////////////////////////////////////
//   VideowSheduleRequestModel get videowSheduleRequestModel =>
//       VideowSheduleRequestModel(
//         selectedTime: selectedIndex.toString(),
//         conversationSubject: conversationSubject,
//         conversationDate: selectedDate,
//         conversationId: conversationId,

//         //  conversationSubject,
//       );

//   Future<void> videoSheduling(
//     context,
//     sTime,
//     cSubject,
//     conDate,
//     conId,
//   ) async {
//     selectedTime = sTime.toString();
//     conversationSubject = cSubject.toString();
//     conversationDate = conDate.toString();
//     conversationId = conId.toString();

//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));

//     try {
//       final response = await videoSheduleRepo.videoShedule(
//           videowSheduleRequestModel, pref.getString("successToken") ?? '');

//       final result =
//           VideowSheduleResponseModel.fromJson(jsonDecode(response.body));

//       if (response.statusCode == 200) {
//         print(response.body);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MessageListView()),
//         );
//         showLoader(false);
//         notifyListeners();
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     } catch (e) {
//       Utils.showPrimarySnackbar(context, e.toString(),
//           type: SnackType.debugError);
//     }
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/message/model/message_model.dart';
import 'package:md_health/Screens/message/model/send_message_model.dart';
import 'package:md_health/Screens/message/model/time_select_model.dart';
import 'package:md_health/Screens/message/model/user_live_appoinment_model.dart';
import 'package:md_health/Screens/message/model/videowShedule_model.dart';
import 'package:md_health/Screens/message/repository/message_repo.dart';
import 'package:md_health/Screens/message/repository/send_message_repo.dart';
import 'package:md_health/Screens/message/repository/time_select_repo.dart';
import 'package:md_health/Screens/message/repository/user_appoinment_repo.dart';
import 'package:md_health/Screens/message/repository/video_shedule_repo.dart';
import 'package:md_health/Screens/message/view/message_view.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // For MultipartFile
import 'package:path/path.dart'; // For basename

class ConversationListController extends ChangeNotifier {
  MessagelistRepo messagelistRepo = MessagelistRepo();
  UserAppoinmnetrepo userAppoinmnetrepo = UserAppoinmnetrepo();
  VideoSheduleRepo videoSheduleRepo = VideoSheduleRepo();
  TimeSelectRepo timeSelectRepo = TimeSelectRepo();
  SendMessageRepo sendMessageRepo = SendMessageRepo();
  String? imgPath = "";
  String? userId;
  String? providerId;
  String? selectedTime;
  String? conversationSubject;
  String? conversationDate;
  String? conversationId;
  List<Conversation>? conversations;
  bool isLoading = true;

  bool isCheckedOne = false;

  Future<void> initState(context) async {
    messageList(context);
    // liveappointmentList(context);
    // documentListRepo(context, pId);
    print('################');
    print(conversationId);
    print(conversationDate);
    print(conversationSubject);
    print('################');
    // timeSelecting(context,conversationId, conversationDate, conversationSubject);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  void onCheckedOne(bool value) {
    isCheckedOne = value;

    notifyListeners();
  }

  String networkImage1 = "";
  String fileName1 = "";
  File fileImage1 = File("");
  String image1Type = "";

  void onChooseFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );
    if (result != null && result.files.isNotEmpty) {
      networkImage1 = "";
      fileName1 = result.files.first.name;
      print(result.files.single.extension);
      fileImage1 = File(result.files.single.path ?? "");
      selectedImagePath =
          result.files.single.path; // Set the selected image path

      if (result.files.single.extension == "pdf") {
        image1Type = "pdf";
      } else {
        image1Type = "jpg";
      }
    }
    notifyListeners();
  }

  String? selectedObject;

  Future<void> onSelectObject(value) async {
    selectedObject = value;
    print(selectedObject);
    notifyListeners();
  }

  String? selectedDate;

  Future<void> onSelectDate(value) async {
    selectedDate = value;
    print(selectedDate);
    notifyListeners();
  }

  int? selectedIndex;

  // Method to handle selecting an item
  void onSelectItem(int index) {
    if (selectedIndex == index) {
      selectedIndex = null; // Deselect the item if it's already selected
    } else {
      selectedIndex = index; // Select the item
    }
    notifyListeners();
  }

  List<TimeSelectData>? timeSelectData;

  TimeActiveRequestModel get timeActiveRequestModel => TimeActiveRequestModel(
      conversationObject: conversationSubject,
      conversationId: conversationId,
      conversationDate: conversationDate);

  Future<void> timeSelecting(context, conId, conDate, cSubject) async {
    // selectedTime = sTime.toString();
    // conversationSubject = cSubject.toString();
    conversationDate = conDate.toString();
    conversationId = conId.toString();
    conversationSubject = cSubject.toString();
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));

    try {
      final response = await timeSelectRepo.timeSelect(
          timeActiveRequestModel, pref.getString("successToken"));

      final result =
          TimeActiveResponseModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        log(response.body);
        timeSelectData = result.timeSelectData;
        showLoader(false);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    } catch (e) {
      Utils.showPrimarySnackbar(context, e.toString(),
          type: SnackType.debugError);
    }
  }

  String? messageText;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final FirebaseStorage _storage = FirebaseStorage.instance;
  // final ImagePicker _picker = ImagePicker();
  String? selectedImagePath; // State variable to store the image path

  TextEditingController messageController = TextEditingController();
  String getCurrentDayOfWeek() {
    final now = DateTime.now();
    return DateFormat('EEEE').format(now);
  }

  int getCurrentUnixTimestamp() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(now);
    return formattedTime;
  }

  Future<void> sendMessage(context, messageText, imageUrl) async {
    if ((messageText?.trim().isNotEmpty ?? false) ||
        (selectedImagePath != null && selectedImagePath!.isNotEmpty)) {
      Map<String, dynamic> messageData = {
        'text': messageText ?? '',
        'sender_type': 'customer',
        'env': 'development',
        'current_time': getCurrentTime(),
        'media_url': imageUrl ?? '', // Include image URL
        'day_of_week': getCurrentDayOfWeek(),
        'attachment_id': '',
        'sender_id': userId.toString(),
        'timestamp': getCurrentUnixTimestamp(),
        'conversation_id': conversationId,
      };

      try {
        await FirebaseFirestore.instance
            .collection('messages')
            .add(messageData); // Save the message in Firebase
        messageController.clear();
        // setState(() {
        selectedImagePath = null; // Clear selected image after sending
        notifyListeners();
        // });
      } catch (e) {
        Utils.showPrimarySnackbar(context, "Failed to send message: $e",
            type: SnackType.error);
      }
    } else {
      Utils.showPrimarySnackbar(
          context, "Please enter a message or select an image",
          type: SnackType.error);
    }
  }

  String? imagenew;

  // Future uploadImage(context) async {
  //   // LoadingOverlay.of(context).show();
  //   print("888888");
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String token = pref.getString("successToken").toString();
  //   print(token);
  //   var uri = Uri.parse(Endpoint.sendMessage);
  //   http.MultipartRequest request = http.MultipartRequest('POST', uri);
  //   request.headers['Authorization'] = "Bearer $token";
  //   request.fields['senderId'] = userId.toString();
  //   request.fields['sender_type'] = 'customer';
  //   request.fields['conversation_id'] = conversationId.toString();
  //   List<http.MultipartFile> newList = <http.MultipartFile>[];
  //   File imageFile1 = fileImage1;

  //   var stream1 =
  //       http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));

  //   var length1 = await imageFile1.length();
  //   var multipartFile1 = http.MultipartFile("media", stream1, length1,
  //       filename: basename(imageFile1.path));
  //   newList.add(multipartFile1);

  //   // print(newList);
  //   print("second");

  //   request.files.addAll(newList);
  //   print(request.fields);
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     print("first");
  //     Utils.showPrimarySnackbar(context, "Updated Successfully",
  //         type: SnackType.success);
  //   } else {
  //     // LoadingOverlay.of(context).hide();
  //     Utils.showPrimarySnackbar(context, "Error on uploading",
  //         type: SnackType.error);
  //     return;
  //   }
  // }
  Future<String?> uploadImage(context, String fileUri) async {
    print("Uploading image...");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("successToken") ?? '';
    var uri = Uri.parse(Endpoint.sendMessage);
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = "Bearer $token";
    request.fields['senderId'] = userId.toString();
    request.fields['sender_type'] = 'customer';
    request.fields['conversation_id'] = conversationId.toString();

    File imageFile1 =
        File(fileUri); // Assuming fileUri is the path to the image file
    var stream1 =
        http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));
    var length1 = await imageFile1.length();
    var multipartFile1 = http.MultipartFile("media", stream1, length1,
        filename: basename(imageFile1.path));

    request.files.add(multipartFile1);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      print("Image uploaded successfully");
      // Assuming the response contains the URL of the uploaded image
      var responseBody = jsonDecode(response.body);
      return responseBody[
          'attachment_path']; // Adjust this based on your API response
    } else {
      Utils.showPrimarySnackbar(context, "Error uploading image",
          type: SnackType.error);
      return null; // Return null if the upload fails
    }
  }

  SendMessageRequestModel get sendMessageRequestModel =>
      SendMessageRequestModel(
        conversationId: conversationId,
        senderId: userId.toString(),
        senderType: "customer",
        msgImgPath: fileImage1.path,
      );
  List<File> selectedFiles = []; // List to hold selected files

  // Future<void> sendMessageApi(context, cId, sId, fileUri) async {
  //   showLoader(true);
  // conversationId = cId;
  // userId = sId;
  //   SharedPreferences pref = await SharedPreferences.getInstance();

  //   try {
  //     final response = await sendMessageRepo.sendMessage(
  //         sendMessageRequestModel, pref.getString('successToken') ?? '');

  //     log(response.body);

  //     if (response.statusCode == 200) {
  //       final result =
  //           SendMessageResponseModel.fromJson(jsonDecode(response.body));
  //       print("Status Code: ${response.statusCode}");
  //       print("Response Body: ${response.body}");
  //       print("Cleaned URL: ${result.imagenew}");

  // uploadImage(context);
  // imagenew = result.imagenew;

  // print("hbjdfhjhjfdhjfdhvjfdbhjdfjbfdjhgfdsahjkgfdsahgdsf");

  // print(imagenew);
  // print("hbjdfhjhjfdhjfdhvjfdbhjdfjbfdjhgfdsahjkgfdsahgdsf");
  // sendMessage(context, messageController.text, imagenew);
  //       notifyListeners();
  //     } else {
  //       final result =
  //           SendMessageResponseModel.fromJson(jsonDecode(response.body));
  //       Utils.showPrimarySnackbar(context, result.message ?? 'Error occurred',
  //           type: SnackType.error);
  //     }
  //   } catch (error) {
  //     Utils.showPrimarySnackbar(context, error.toString(),
  //         type: SnackType.debugError);
  //   } finally {
  //     showLoader(false);
  //     notifyListeners();
  //   }
  // }
  // Future<void> sendMessageApi(context, cId, sId, fileUri) async {
  //   conversationId = cId;
  //   userId = sId;
  //   showLoader(true);
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   sendMessageRepo
  //       .sendMessage(sendMessageRequestModel, pref.get('successToken'))
  //       .then((response) async {
  //     // log(response.body);
  //     debugPrint('/////////////');
  //     final result =
  //         SendMessageResponseModel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       uploadImage(context);
  //       imagenew = result.imagenew;

  //       sendMessage(context, messageController.text, imagenew);
  //       notifyListeners();
  //       showLoader(false);

  //       // LoadingOverlay.of(context).hide();
  //       Utils.showPrimarySnackbar(context, result.message,
  //           type: SnackType.success);
  //       notifyListeners();
  //     } else {
  //       // log(response.body);
  //       Utils.showPrimarySnackbar(context, result.message,
  //           type: SnackType.error);
  //     }
  //   }).onError((error, stackTrace) {
  //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
  //   }).catchError(
  //     (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //     },
  //     test: (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //       return false;
  //     },
  //   );
  // }
  Future<void> sendMessageApi(context, cId, sId, fileUri) async {
    conversationId = cId;
    userId = sId;
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();

    // First, upload the image and get the URL
    String? uploadedImageUrl = await uploadImage(context, fileUri);
    if (uploadedImageUrl == null) {
      showLoader(false);
      return; // Exit if upload fails
    }

    // Send message request
    sendMessageRepo
        .sendMessage(sendMessageRequestModel, pref.get('successToken'))
        .then((response) async {
      debugPrint('/////////////');
      final result =
          SendMessageResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        sendMessage(context, messageController.text,
            uploadedImageUrl); // Use the uploaded image URL
        showLoader(false);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError((Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }

  Future<void> messageList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    messagelistRepo
        .messageList(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ConversionListModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          conversations = result.conversations;
          userId = result.userId.toString();
          providerId = result.providerId;
          conversationId = result.conversationId;
          showLoader(false);
          Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        }
      } else {
        Utils.showPrimarySnackbar(context, "", type: SnackType.error);
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

  /////////////////////////////////////
  VideowSheduleRequestModel get videowSheduleRequestModel =>
      VideowSheduleRequestModel(
        selectedTime: selectedIndex.toString(),
        conversationSubject: conversationSubject,
        conversationDate: selectedDate,
        conversationId: conversationId,

        //  conversationSubject,
      );

  Future<void> videoSheduling(
    context,
    sTime,
    cSubject,
    conDate,
    conId,
  ) async {
    selectedTime = sTime.toString();
    conversationSubject = cSubject.toString();
    conversationDate = conDate.toString();
    conversationId = conId.toString();

    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));

    try {
      final response = await videoSheduleRepo.videoShedule(
          videowSheduleRequestModel, pref.getString("successToken") ?? '');

      final result =
          VideowSheduleResponseModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        print(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessageListView()),
        );
        showLoader(false);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    } catch (e) {
      Utils.showPrimarySnackbar(context, e.toString(),
          type: SnackType.debugError);
    }
  }
}
