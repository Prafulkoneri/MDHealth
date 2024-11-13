import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/favourt/model/fav_count_model.dart';
import 'package:md_health/Screens/favourt/model/fav_list_Detail_view.dart';
import 'package:md_health/Screens/order/model/hs_order_count_model.dart';

import 'package:md_health/Screens/order/model/order_count_model.dart';
import 'package:md_health/Screens/order/model/shop_countOrder.dart';
import 'package:md_health/Screens/order/repository/hs_order_count_repo.dart';
import 'package:md_health/Screens/order/repository/order_count_repo.dart';
import 'package:md_health/Screens/order/repository/shop_orderCount_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietOrderCountController extends ChangeNotifier {
  OrderCountRepo orderCountRepo = OrderCountRepo();
  HsOrderCountRepo hsOrderCountRepo = HsOrderCountRepo();
  ShopCountOrderRepo shopCountOrderRepo = ShopCountOrderRepo();
  int? orderCount;
  int? shopOrderCount;
  int? hsorddercount;

  bool isLoading = true;
  AddFavCount? addCount;
  List<FavDetailViewList>? favdetailViewList;

  Future<void> initState(context) async {
    await foodOrderCount(context);
    await shoOrderCount(context);
    await hsorder(context);
    notifyListeners();
  }

/////////////////////////////

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> foodOrderCount(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    orderCountRepo.orderCount(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = OrderCountResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          orderCount = result.orderCount;
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

  Future<void> hsorder(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    hsOrderCountRepo
        .hsorderCount(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = HsOrderCountResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          hsorddercount = result.hsorddercount;
          // orderCount = result.orderCount;
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
  //////////////////////////////////////////////////

  Future<void> shoOrderCount(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    shopCountOrderRepo
        .shopCountO(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ShopCountResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          shopOrderCount = result.shopOrderCount;
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
