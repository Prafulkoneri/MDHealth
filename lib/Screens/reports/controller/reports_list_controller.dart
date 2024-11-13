import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/reports/repository/reports_list_repository.dart';
import 'package:md_health/Screens/reports/model/reports_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/utils.dart';

class ReportsListController extends ChangeNotifier {
  ReportsListRepository reportsListRepository = ReportsListRepository();
  bool isLoading = true;
  List<ProviderReportList>? providerReportList;

  Future<void> initState(
    context,
  ) async {
    getReportsList(context);
    notifyListeners();
  }

   showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getReportsList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    reportsListRepository
        .getReportsList(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ReportListModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          providerReportList =
              result.providerReportList;

          showLoader(false);
          Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, "", type: SnackType.error);//
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

  


//  ReportListDetailsRequestModel get reportListDetailsRequestModel =>
//       ReportListDetailsRequestModel(
//           purchesId: purcheseId.toString(), providerId: providerId);
  // Future<void> reportDetails(context, pId, purchesId) async {
  //   showLoader(true);
  //   providerId = pId;
  //   purcheseId = purchesId;
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   reportListDetailsRepo
  //       .reportListDetails(
  //           reportListDetailsRequestModel, pref.getString("successToken"))
  //       .then((response) async {
  //     // log(response.body);
  //     debugPrint('/////////////');
  //     final result =
  //         ReportListDetailsResponseModel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log(response.body);

  //       // customerPurchasePackageList = result.customerPurchasePackageList;
  //       // otherServices = result.otherServices;
  //       // print("juhujkiuyol,oi;l");
  //       // print("juhujkiuyol,oi;l");
  //       // print(customerPurchasePackageList?.companyLogoImagePathS ?? "");
  //       // print(customerPurchasePackageList?.companyName);

  //       // print("juhujkiuyol,oi;l");
  //       showLoader(false);
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
  // }
  
}