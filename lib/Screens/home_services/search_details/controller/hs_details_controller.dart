import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/home_services/home_page_services/model/get_home_services_pop_list_model.dart';
import 'package:md_health/Screens/home_services/home_page_services/model/home_services_city_list_model.dart';
import 'package:md_health/Screens/home_services/home_page_services/repository/get_hs_pop_lisr_repo.dart';
import 'package:md_health/Screens/home_services/search_details/model/add_to_fav_model.dart';
import 'package:md_health/Screens/home_services/search_details/model/search_details_hS_model.dart';
import 'package:md_health/Screens/home_services/search_details/repository/add_to_fav_repo.dart';
import 'package:md_health/Screens/home_services/search_details/repository/hs_search_details_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsHomeServicesController extends ChangeNotifier {
  bool isLoading = true;
  String packageId = '';
  HomeServicesSearchDeatilsPackageData? homeServicesSearchDeatilsPackageData;

  HsSearchDetailsViewRepository hsSearchDetailsViewRepository =
      HsSearchDetailsViewRepository();
  HsAddToFAvRepository hsAddToFAvRepository = HsAddToFAvRepository();
  List<SelectHomeServicesList>? selecthomeServicesData;
  Future<void> initState(context, pcid) async {
    hssearchDetailsPackage(context, pcid);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  int? verifiedProvidersCount;
  int? excellentCount;
  int? veryGoodCount;
  int? goodCount;
  int? fairCount;
  int? badCount;
  int? allTreatmentCount;
  int? fullPackageCount;
  int? personalcare;
  int? companionship;
  int? mealplanning;
  int? privatedutynursingcare;
  int? physicaltherapy;
  int? babysitting;
  int? medicationAppointment;
  int? zerototen;
  int? tentotwenty;
  int? twentytofifty;
  int? fiftytoseventy;
  int? seventytohundres;
  int? hundrestoabove;
  /////////////////////////////////////////////////////////////////////

  HomeServicesDetailsViewRequestModel get homeServicesDetailsViewRequestModel =>
      HomeServicesDetailsViewRequestModel(
        packageId: packageId,
      );
  Future<void> hssearchDetailsPackage(context, pcid) async {
    showLoader(true);
    packageId = pcid;
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsSearchDetailsViewRepository
        .hsdetailsgetPackages(
            homeServicesDetailsViewRequestModel, pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result = HomeServicesDetailsViewResponseModel.fromJson(
          jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        homeServicesSearchDeatilsPackageData =
            result.homeServicesSearchDeatilsPackageData;
        verifiedProvidersCount = result.verifiedProvidersCount;
        excellentCount = result.excellentCount;
        veryGoodCount = result.veryGoodCount;
        goodCount = result.goodCount;
        fairCount = result.fairCount;
        badCount = result.badCount;
        allTreatmentCount = result.allTreatmentCount;
        fullPackageCount = result.fullPackageCount;
        personalcare = result.personalcare;
        companionship = result.companionship;
        mealplanning = result.mealplanning;
        privatedutynursingcare = result.privatedutynursingcare;
        physicaltherapy = result.physicaltherapy;
        babysitting = result.babysitting;
        medicationAppointment = result.medicationAppointment;
        zerototen = result.zerototen;
        tentotwenty = result.zerototen;
        twentytofifty = result.twentytofifty;
        fiftytoseventy = result.fiftytoseventy;
        seventytohundres = result.seventytohundres;
        hundrestoabove = result.hundrestoabove;
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

  HsAddFavRequestmodel get hsAddFavRequestmodel =>
      HsAddFavRequestmodel(id: packageId.toString());
  Future<void> hsremoveToFav(context, pcid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsAddToFAvRepository
        .hsAddfav(hsAddFavRequestmodel, pref.getString("successToken"))
        .then((response) async {
      log("response.body${response.body}");
      final result = HsAddFavResposeModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        hssearchDetailsPackage(context, pcid);
        // FavCountList(context);
        // FavListDetailView(context);
        hssearchDetailsPackage(context, pcid);
        notifyListeners();
      }
      Utils.showPrimarySnackbar(context, result.message,
          type: SnackType.success);
      notifyListeners();
    });
  }
}
