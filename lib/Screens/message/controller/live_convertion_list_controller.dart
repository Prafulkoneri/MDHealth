// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/message/model/message_model.dart';
// import 'package:md_health/Screens/message/repository/message_repo.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class LiveConvertionListController extends ChangeNotifier {

//   ConversationListRepo conversationListRepo =  ConversationListRepo();
//   String packageId = '';
//   String removeId = '';
//   String documentPath = '';
//   String patientId = '';
//   String purchaseId = '';
//   bool isLoading = true;
//   // List<Conversation>? conversationList;
//   // List<Datadocumentd>? documentData;

//   Future<void> initState(context) async {

//     // getUserConversations(context);
//     // documentListRepo(context, pId);
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   //////////////////////////////////

//   // Future getUserConversations(context) async {
//   //   // LoadingOverlay.of(context).show();
//   //   print("888888");
//   //   SharedPreferences pref = await SharedPreferences.getInstance();
//   //   String token = pref.getString("successToken").toString();
//   //   print(token);

//   //   conversationListRepo
//   //       .getConversationList( pref.getString("successToken"))
//   //       .then((response) async {
//   //     // log(response.body);
//   //     debugPrint('/////////////');
//   //     final result = GetConversationsResponseModel.fromJson(jsonDecode(response.body));
//   //     if (response.statusCode == 200) {
//   //       log(response.body);
//   //       conversationList = result.conversations;
//   //       showLoader(false);
//   //       notifyListeners();
//   //     } else {
//   //       log(response.body);
//   //       Utils.showPrimarySnackbar(context, result.message,
//   //           type: SnackType.error);
//   //     }
//   //   }).onError((error, stackTrace) {
//   //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//   //   }).catchError(
//   //         (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //     },
//   //     test: (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //       return false;
//   //     },
//   //   );
//   // }

// }
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/message/model/liveCall_cancelled_model.dart';
import 'package:md_health/Screens/message/model/live_cam_model.dart';
import 'package:md_health/Screens/message/model/message_model.dart';
import 'package:md_health/Screens/message/model/user_live_appoinment_model.dart';
import 'package:md_health/Screens/message/model/videowShedule_model.dart';
import 'package:md_health/Screens/message/repository/live_call_cancel_repo.dart';
import 'package:md_health/Screens/message/repository/live_camp_repo.dart';
import 'package:md_health/Screens/message/repository/message_repo.dart';
import 'package:md_health/Screens/message/repository/user_appoinment_repo.dart';
import 'package:md_health/Screens/message/repository/video_shedule_repo.dart';
import 'package:md_health/Screens/message/view/message_view.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveConvertionListController extends ChangeNotifier {
  UserAppoinmnetrepo userAppoinmnetrepo = UserAppoinmnetrepo();
  LiveCallVideo liveCallVideo = LiveCallVideo();
  CancelledLiveCallVideo cancelledLiveCallVideo = CancelledLiveCallVideo();
  String? roomId;
  bool isLoading = true;

  Future<void> initState(context) async {
    liveappointmentList(context);
    // documentListRepo(context, pId);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  List<LiveConverTionList>? lisveConvertionList;

  Future<void> liveappointmentList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    userAppoinmnetrepo
        .appoinmentList(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = LiveConvertionListResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        lisveConvertionList = result.lisveConvertionList;
        showLoader(false);
        notifyListeners();

        // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
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

  String? url;

  ////////////////////////////////
  LiveRequestModel get liveRequestModel => LiveRequestModel(roomId: roomId);
  Future<void> goLive(context, rId) async {
    roomId = rId;
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    liveCallVideo
        .mdLivecamview(liveRequestModel, pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      final result = LiveResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        String url = Uri.encodeFull(result.url.toString());
        if (await canLaunch(url)) {
          launch(url);
        } else {
          throw 'Could not launch $url';
        }
        showLoader(false);
        notifyListeners();

        // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
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

  /////////////////////////
  CaLiveRequestModel get caLiveRequestModel =>
      CaLiveRequestModel(roomId: roomId);
  Future<void> cancelledgoLive(context, rId) async {
    roomId = rId;
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    cancelledLiveCallVideo
        .cancelledMdLivecamview(
            caLiveRequestModel, pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      final result = CancelledLiveResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        showLoader(false);
        notifyListeners();

        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
      } else {
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
}
