import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/food/Vendro_food_list/model/vendor_list_model.dart';
import 'package:md_health/Screens/food/Vendro_food_list/repo/vendor_list_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VendorFoodController extends ChangeNotifier {
  bool isLoading = true;
  String? foodVendorId;
  FoodVendorListRepo foodVendorListRepo = FoodVendorListRepo();
  Future<void> initState(context, fvID) async {
    vendorFoodList(context, fvID);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  List<VendorFoodPackagesSearch>? vendorfoodPackagesSearch;
  FoodVendorListData? foofvendorlistdata;

  VendorFoodListRequestModel get vendorFoodListRequestModel =>
      VendorFoodListRequestModel(foodVendorId: foodVendorId);
  Future<void> vendorFoodList(context, fvID) async {
    foodVendorId = fvID;
    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    foodVendorListRepo
        .foodVendorlist(
            vendorFoodListRequestModel, pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      final result =
          VendorFoodListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        foofvendorlistdata = result.foofvendorlistdata;
        vendorfoodPackagesSearch = foofvendorlistdata?.vendorfoodPackagesSearch;
        print("juhujkiuyol,oi;l");
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
