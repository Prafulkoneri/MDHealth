import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/home_services/home_page_services/model/get_home_services_pop_list_model.dart';
import 'package:md_health/Screens/home_services/home_page_services/model/home_services_city_list_model.dart';
import 'package:md_health/Screens/home_services/home_page_services/repository/get_hs_pop_lisr_repo.dart';
import 'package:md_health/Screens/home_services/hs_review/model/hs_review_list_model.dart';
import 'package:md_health/Screens/home_services/hs_review/repo/hs_review_list_repo.dart';
import 'package:md_health/Screens/home_services/search_details/model/search_details_hS_model.dart';
import 'package:md_health/Screens/home_services/search_details/repository/hs_search_details_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeServicesReviewListController extends ChangeNotifier {
  bool isLoading = true;
  String packageId = '';
  HomeServicesSearchDeatilsPackageData? homeServicesSearchDeatilsPackageData;

  HsReViewRepository hsReViewRepository = HsReViewRepository();
  HsReviewlistData? hsReviewlistdata;
  Future<void> initState(context, pcid) async {
    // hssearchDetailsPackage(context, pcid);
    hsReviewList(context, pcid);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////////////

  HomeServicesReViewlistRequestModel get homeServicesReViewlistRequestModel =>
      HomeServicesReViewlistRequestModel(
        packageId: packageId,
      );
  Future<void> hsReviewList(context, pcid) async {
    showLoader(true);
    packageId = pcid;
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsReViewRepository
        .hslistReview(
            homeServicesReViewlistRequestModel, pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          HsReviewListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        hsReviewlistdata = result.hsReviewlistdata;
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
