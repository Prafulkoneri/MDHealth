import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/notification/model/notification_model.dart';
import 'package:md_health/Screens/notification/model/update_notification_model.dart';
import 'package:md_health/Screens/notification/repository/notification_repo.dart';
import 'package:md_health/Screens/notification/repository/update_notification_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationCOntroller extends ChangeNotifier {
  NotificationRepo notificationRepo = NotificationRepo();
  UpdateNotificationRepo updateNotificationRepo = UpdateNotificationRepo();

  bool isLoading = true;
  List<NotificationData>? notifications;

  Future<void> initState(context) async {
    await notificationLIst(context);

    notifyListeners();
  }

/////////////////////////////

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> notificationLIst(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    notificationRepo
        .notificationlist(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = NotificationResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          notifications = result.notifications;
          updatenotificationLIst(context);
          showLoader(false);
          notifyListeners();
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    });
  }

  Future<void> updatenotificationLIst(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    updateNotificationRepo
        .updatenotificationlist(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = UpdateNotificationResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          // notifications = result.notifications;
          showLoader(false);
          notifyListeners();
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    });
  }
}
