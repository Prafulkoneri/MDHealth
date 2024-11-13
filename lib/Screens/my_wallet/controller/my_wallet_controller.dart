import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/my_wallet/model/get_link_model.dart';
import 'package:md_health/Screens/my_wallet/model/netWorkRepo_model.dart';
import 'package:md_health/Screens/my_wallet/model/send_invite_link_model.dart';
import 'package:md_health/Screens/my_wallet/model/use_coin_model.dart';
import 'package:md_health/Screens/my_wallet/repository/getLink_repo.dart';
import 'package:md_health/Screens/my_wallet/repository/network_repo.dart';
import 'package:md_health/Screens/my_wallet/repository/send_initation.dart';
import 'package:md_health/Screens/my_wallet/repository/use_my_coin_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWalletScreenController extends ChangeNotifier {
  bool isLoading = true;
  String? invitationLink;
  TextEditingController emailIdController = TextEditingController();
  TextEditingController twoemailIdController = TextEditingController();
  TextEditingController threeemailIdController = TextEditingController();
  TextEditingController fouremailIdController = TextEditingController();
  TextEditingController fiveemailIdController = TextEditingController();

  Future<void> initState(context) async {
    emailIdController.clear();
    print("object");
    print(coins ?? 0);

    print("object");
    useMyCoins(context);
    await getInvitess(context);
    // await walletCount(context);
    await getNetWorks(context);
    // await sendInvite(context, email, link);
    notifyListeners();
  }

  UseMycoinRepo useMycoinRepo = UseMycoinRepo();
  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  void sendTelegramInvitation(BuildContext context) async {
    final telegramLink =
        'tg://resolve?domain='; // You can add the username here

    if (await canLaunch(telegramLink)) {
      await launch(telegramLink);
    } else {
      // If the app is not installed, open the Telegram page on the Play Store
      await launch(
          'https://play.google.com/store/apps/details?id=org.telegram.messenger');
    }
  }

  // GetInviteLink getInviteLink = GetInviteLink();NetWorlRepo
  GetInviteLink getinviteLink = GetInviteLink();
  sendinitelinkRepo SendinitelinkRepo = sendinitelinkRepo();
  Future<void> getInvitess(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    getinviteLink.inviteLink(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = GetInvitationLink.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          invitationLink = result.invitationLink;
          notifyListeners();
          // showLoader(false);
          Utils.showPrimarySnackbar(context, "", type: SnackType.success);
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

  String? coins = '';

///////////////////////////////////
  Future<void> useMyCoins(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    useMycoinRepo.useCoin(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = UseCoinsResMOdel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        log(response.body);
        print(response.body);
        // if (result.status == 200) {
        coins = result.coins.toString() ?? '';
        notifyListeners();
        showLoader(false);
        Utils.showPrimarySnackbar(context, "", type: SnackType.success);
        // } else {
        //   Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        // }
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

  ////////////////////////////////
  NetWorlRepo netWorlRepo = NetWorlRepo();
  String? networkCount;
  String? pendingInvite;
  String? leftinviteCount;
  Future<void> getNetWorks(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    netWorlRepo.netWork(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = NetWorkResponseMOdel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          networkCount = result.networkCount.toString();
          pendingInvite = result.pendingInvite.toString();
          leftinviteCount = result.leftinviteCount.toString();
          notifyListeners();
          // showLoader(false);
          Utils.showPrimarySnackbar(context, "", type: SnackType.success);
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

///////////////////////////////////////
  List<String?> emails = [];
  SendInviteLinkRequestModel get sendInviteLinkRequestModel =>
      SendInviteLinkRequestModel(
          emails: emails, invitationLink: invitationLink);
  Future<void> sendInvite(context, emailList, link) async {
    emails = emailList;
    invitationLink = link;
    SharedPreferences pref = await SharedPreferences.getInstance();

    SendinitelinkRepo.sendInvite(
            sendInviteLinkRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      final result = SendInviteLinkRepons.fromJson(jsonDecode(response.body));

      if (result.status == 200) {
        log(response.body);
        emailIdController.clear();
        getNetWorks(context);
        notifyListeners();
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
        return false;
      },
    );
  }
  ////////////////////////////

////////////////////////////////////////////////////
  // Future<void> walletCount(context) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   mdCoinRepo
  //       .mdCoinWallet(pref.getString("successToken"))
  //       .then((response) async {
  //     // log(response.body);
  //     debugPrint('/////////////');
  //     final result = UseCoinsResMOdel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       coins = result.coins;
  //       notifyListeners();
  //     } else {
  //       log(response.body);
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
  // }UseMycoinRepo
}
