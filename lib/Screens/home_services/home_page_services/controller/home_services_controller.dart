import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/home_services/home_page_services/model/get_home_services_pop_list_model.dart';
import 'package:md_health/Screens/home_services/home_page_services/model/home_services_city_list_model.dart';
import 'package:md_health/Screens/home_services/home_page_services/model/top_provider_model.dart';
import 'package:md_health/Screens/home_services/home_page_services/repository/getHSCity_repo.dart';
import 'package:md_health/Screens/home_services/home_page_services/repository/get_hs_pop_lisr_repo.dart';
import 'package:md_health/Screens/home_services/home_page_services/repository/top_provider_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeServicesController extends ChangeNotifier {
  bool isLoading = true;
  TextEditingController searchHSpackageController = TextEditingController();
  String selectedTextcty = '';
  int selectedTextIndexcity = -1;
  String selectedText = '';
  int selectedTextIndex = -1; // Assuming -1 represents no selection
  TopProviderlistHomeServicesRepo topProviderlistHomeServicesRepo =
      TopProviderlistHomeServicesRepo();
  HSpopListRepo hSpopListRepo = HSpopListRepo();
  GetHSCityRepo getHSCityRepo = GetHSCityRepo();
  List<SelectHomeServicesList>? selecthomeServicesData;
  List<TopHomeProviderServicesData>? tophomeProviderservicesData;
  late List<HomeListCityData>? homesCitydata;
  String? servicesNMame;
  Future<void> initState(context, srvName) async {
    // selectedText = '';
    await cityPackageHs(context, srvName);
    await packageTopProviderHs(context);
    await homeServiceslist(context);
    selectedTextcty = '';
    selectedTextIndexcity = -1;
    selectedText = '';
    selectedTextIndex = -1;
    selectdate = '';
    searchHSpackageController.clear();
    notifyListeners();
  }

  String selectdate = '';
  void onDateSelected(date) {
    selectdate = date;
    notifyListeners();
  }

  void setSelectedText(value, index) {
    selectedText = value;
    selectedTextIndex = index;
    notifyListeners();
  }

  void setSelectedCityText(value, index) {
    selectedTextcty = value;
    selectedTextIndexcity = index;

    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> homeServiceslist(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    hSpopListRepo
        .homeservicesListRepo(pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          GetServicesListReponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);

        selecthomeServicesData = result.selecthomeServicesData;
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

  ///////////////////////////////////////

  Future<void> packageTopProviderHs(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    topProviderlistHomeServicesRepo
        .servicesPackage(pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result = TopProviderHomeServicesResponseModel.fromJson(
          jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);

        tophomeProviderservicesData = result.tophomeProviderservicesData;
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

  /////////////////////////////////////////////////////////////////////

  HsCityRequestModel get hsCityRequestModel =>
      HsCityRequestModel(servicesName: servicesNMame ?? '');
  Future<void> cityPackageHs(context, srvName) async {
    showLoader(true);
    servicesNMame = srvName;
    SharedPreferences pref = await SharedPreferences.getInstance();
    getHSCityRepo
        .hsCityRepo(hsCityRequestModel, pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result = GetHomeSerivesCityList.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        homesCitydata = result.homesCitydata;
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
