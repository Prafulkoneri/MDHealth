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

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/message/model/message_model.dart';
// import 'package:md_health/Screens/message/model/time_select_model.dart';
// import 'package:md_health/Screens/message/model/user_live_appoinment_model.dart';
// import 'package:md_health/Screens/message/model/videowShedule_model.dart';
// import 'package:md_health/Screens/message/repository/message_repo.dart';
// import 'package:md_health/Screens/message/repository/time_select_repo.dart';
// import 'package:md_health/Screens/message/repository/user_appoinment_repo.dart';
// import 'package:md_health/Screens/message/repository/video_shedule_repo.dart';
// import 'package:md_health/Screens/message/view/message_view.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ConversationListController extends ChangeNotifier {
//   MessagelistRepo messagelistRepo = MessagelistRepo();
//   UserAppoinmnetrepo userAppoinmnetrepo = UserAppoinmnetrepo();
//   VideoSheduleRepo videoSheduleRepo = VideoSheduleRepo();
//   TimeSelectRepo timeSelectRepo = TimeSelectRepo();
//   int? userId;
//   String? providerId;
//   String? selectedTime;
//   String? conversationSubject;
//   String? conversationDate;
//   String? conversationId;
//   List<Conversation>? conversations;
//   bool isLoading = true;
//   // MessagelistRepo
//   bool isCheckedTwo = false;
//   bool isCheckedThree = false;
//   bool isCheckedFour = false;
//   bool isCheckedFive = false;
//   bool isCheckedSix = false;
//   bool isCheckedSeven = false;
//   bool isCheckedEight = false;
//   // bool isChecked = false;
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
//     if (value) {
//       isCheckedTwo = false;
//       isCheckedThree = false;
//       isCheckedFour = false;
//       isCheckedFive = false;
//       isCheckedSix = false;
//       isCheckedSeven = false;
//       isCheckedEight = false;
//     }
//     notifyListeners();
//   }

//   void onCheckedTwo(bool value) {
//     isCheckedTwo = value;
//     if (value) {
//       isCheckedOne = false;
//       isCheckedThree = false;
//       isCheckedFour = false;
//       isCheckedFive = false;
//       isCheckedSix = false;
//       isCheckedSeven = false;
//       isCheckedEight = false;
//     }
//     notifyListeners();
//   }

//   void onCheckedThree(bool value) {
//     isCheckedThree = value;
//     if (value) {
//       isCheckedOne = false;
//       isCheckedTwo = false;
//       isCheckedFour = false;
//       isCheckedFive = false;
//       isCheckedSix = false;
//       isCheckedSeven = false;
//       isCheckedEight = false;
//     }
//     notifyListeners();
//   }

//   void onCheckedFour(bool value) {
//     isCheckedFour = value;
//     if (value) {
//       isCheckedOne = false;
//       isCheckedTwo = false;
//       isCheckedThree = false;
//       isCheckedFive = false;
//       isCheckedSix = false;
//       isCheckedSeven = false;
//       isCheckedEight = false;
//     }
//     notifyListeners();
//   }

// ////////////////////////////////////
//   void onCheckedFive(bool value) {
//     isCheckedFive = value;
//     if (value) {
//       isCheckedOne = false;
//       isCheckedTwo = false;
//       isCheckedThree = false;
//       isCheckedFour = false;
//       isCheckedSix = false;
//       isCheckedSeven = false;
//       isCheckedEight = false;
//     }
//     notifyListeners();
//   }

//   void onCheckedSix(bool value) {
//     isCheckedSix = value;
//     if (value) {
//       isCheckedOne = false;
//       isCheckedTwo = false;
//       isCheckedThree = false;
//       isCheckedFour = false;
//       isCheckedFive = false;
//       isCheckedSeven = false;
//       isCheckedEight = false;
//     }
//     notifyListeners();
//   }

//   void onCheckedSeven(bool value) {
//     isCheckedSeven = value;
//     if (value) {
//       isCheckedOne = false;
//       isCheckedTwo = false;
//       isCheckedThree = false;
//       isCheckedFour = false;
//       isCheckedFive = false;
//       isCheckedSix = false;
//       isCheckedEight = false;
//     }
//     notifyListeners();
//   }

//   void onCheckedEight(bool value) {
//     isCheckedEight = value;
//     if (value) {
//       isCheckedOne = false;
//       isCheckedTwo = false;
//       isCheckedThree = false;
//       isCheckedFour = false;
//       isCheckedFive = false;
//       isCheckedSix = false;
//       isCheckedSeven = false;
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

//   // List<LiveConverTionList>? lisveConvertionList;

//   // Future<void> liveappointmentList(context) async {
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
//           userId = result.userId;
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

//   List<TimeSelectData>? timeSelectData;

//   TimeActiveRequestModel get timeActiveRequestModel => TimeActiveRequestModel(
//       conversationId: conversationId, conversationDate: conversationDate);

//   Future<void> timeSelecting(context, conId, conDate) async {
//     // selectedTime = sTime.toString();
//     // conversationSubject = cSubject.toString();
//     conversationDate = conDate.toString();
//     conversationId = conId.toString();
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

//   /////////////////////////////////////
//   VideowSheduleRequestModel get videowSheduleRequestModel =>
//       VideowSheduleRequestModel(
//         selectedTime: "10:00",
//         conversationSubject: "About Treatments",
//         conversationId: conversationId,
//         conversationDate: conversationSubject,
//       );

//   Future<void> videoSheduling(context, sTime, cSubject, conDate, conId) async {
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
