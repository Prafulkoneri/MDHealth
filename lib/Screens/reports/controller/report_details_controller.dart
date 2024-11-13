
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/reports/model/report_list_details_model.dart';
import 'package:md_health/Screens/reports/repository/report_list_details_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReoprtDetailsController extends ChangeNotifier {
   String? providerId;
  String? purcheseId;
  bool isLoading = true;
  List<ProviderReportList>? providerReportList;

  Future<void> initState(context, pId, purchesId,) async {
    reportDetails(context, pId, purchesId);
    print("object");
    // getPaymentDetailsList(context, pId);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  ReportListDetailsRepo reportListDetailsRepo = ReportListDetailsRepo();

   ReportListDetailsRequestModel get reportListDetailsRequestModel =>
      ReportListDetailsRequestModel(
          purchesId: purcheseId.toString(), providerId: providerId);

    
  Future<void> reportDetails(context, pId, purchesId) async {
    showLoader(true);
    providerId = pId;
    purcheseId = purchesId;
    SharedPreferences pref = await SharedPreferences.getInstance();
    reportListDetailsRepo
        .reportListDetails(
            reportListDetailsRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ReportListDetailsResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        providerReportList= result.providerReportList;
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
}

