import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/home_services/purchase_details/model/he_purchase_details.dart';
import 'package:md_health/Screens/home_services/purchase_details/model/hs_get_percentage.dart';
import 'package:md_health/Screens/home_services/purchase_details/repo/hs_get_percentage_repo.dart';
import 'package:md_health/Screens/home_services/purchase_details/repo/purchase_details_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HsPaymentDetailsController extends ChangeNotifier {
  HSpurchasePackgeRepo hSpurchasePackgeRepo = HSpurchasePackgeRepo();
  HSgetPercentageRepo hSgetPercentageRepo = HSgetPercentageRepo();
  String packageId = '';
  String salePrice = '';
  String purchaseType = '';
  Future<void> initState(context, pId, type) async {
    await getPaymentDetailsList(context, pId, type);
    await getDisscountamount(context);

    notifyListeners();
  }

  PurchaseDetails? purchaseDetails;
  List<OtherService>? otherServices;
  HsPurchaseDetailsRequestModel get hsPurchaseDetailsRequestModel =>
      HsPurchaseDetailsRequestModel(
        packageId: packageId.toString(),
        purchaseType: purchaseType,
      );
  Future<void> getPaymentDetailsList(context, pId, type) async {
    packageId = pId;
    purchaseType = type;
    SharedPreferences pref = await SharedPreferences.getInstance();
    hSpurchasePackgeRepo
        .hspurchasePackage(
            hsPurchaseDetailsRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          HsPurchaseDetailsResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        purchaseDetails = result.purchaseDetails;
        otherServices = result.otherServices;
        int otherServiceLength = otherServices?.length ?? 0;
        print(otherServices?.length);
        salePrice = result.purchaseDetails?.salePrice ?? "";
        selectAddonServicesList =
            List<bool>.filled(otherServices?.length ?? 0, true, growable: true);
        selectedNames.clear();
        for (int i = 0; i < otherServiceLength; i++) {
          selectedNames.add(otherServices?[i].title ?? "");
        }
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

  //////////////////////////////////////////
  List<bool> selectAddonServicesList = [true];
  List selectedAddOnServicesId = [];
  List<String> selectedNames = [];
  List<String> selectedPrices = [];
  void onAddOnOtherServicesSelected(index, id, pricepercetage, title, context) {
    selectAddonServicesList[index] = !selectAddonServicesList[index];
    if (selectAddonServicesList[index]) {
      selectedAddOnServicesId.removeWhere((item) => item == id);
      selectedAddOnServicesId.insert(0, id);
      salePrice =
          (double.parse(salePrice) + double.parse(pricepercetage.toString()))
              .toString();
    } else {
      selectedAddOnServicesId.removeWhere((item) => item == id);
      salePrice =
          (double.parse(salePrice) - double.parse(pricepercetage.toString()))
              .toString();
    }

    // Clear the selectedNames and selectedPrices lists
    selectedNames.clear();
    selectedPrices.clear();

    otherServices?.forEach((element) {
      if (selectAddonServicesList[otherServices!.indexOf(element)]) {
        // Add only the selected item to the lists
        selectedNames.add(element.title.toString());
        selectedPrices.add(element.pricePercentage.toString());
      }
    });

    print("object");
    print(pricepercetage);
    print("object");
    print(selectedAddOnServicesId);
    print("Selected Names: $selectedNames");
    print("Selected Prices: $selectedPrices");
    getDisscountamount(context);
    notifyListeners();
  }

  /////////////////////////////////////////////////
  List<Discount>? discounts;
  String selectedPrice = "0";
  List<bool> radioValue = [true];
  String selectedPercetage = "0";
  String selectedPlanId = "0";
  String radioGrpValue = "1";

  void onRadioBtnChanged(value, id, price) {
    int selectedIndex =
        discounts?.indexWhere((discount) => discount?.id == id) ?? -1;
    if (selectedIndex != -1) {
      for (int i = 0; i < radioValue.length; i++) {
        radioValue[i] = (i == selectedIndex);
      }
      selectedPrice = discounts?[selectedIndex].price ?? "";
      selectedPercetage = discounts?[selectedIndex].percentage ?? "";
      selectedPlanId = id.toString();
      notifyListeners();
    }
  }

  DateTime now = DateTime.now();

  HsDisscountRequestModel get hsDisscountRequestModel =>
      HsDisscountRequestModel(
        packageId: packageId.toString(),
        salePrice: salePrice,
      );
  Future<void> getDisscountamount(context) async {
    // salePrice = pId;
    SharedPreferences pref = await SharedPreferences.getInstance();
    hSgetPercentageRepo
        .hsgetpercentage(hsDisscountRequestModel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          HsgetPercentengeResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        discounts = result.discounts;
        selectedPrice = result.discounts?[0].price ?? "";
        selectedPercetage = result.discounts?[0].percentage ?? "";
        int length = discounts?.length ?? 0;
        radioValue.clear();
        for (int i = 0; i < length; i++) {
          radioValue.add(false);
        }
        radioValue[0] = true;

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
