import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/favourt/model/fav_count_model.dart';
import 'package:md_health/Screens/favourt/model/fav_list_Detail_view.dart';
import 'package:md_health/Screens/favourt/model/remoe_food_model.dart';
import 'package:md_health/Screens/favourt/model/remove_fav_packge_model.dart';
import 'package:md_health/Screens/favourt/repository/fav_count_repo.dart';
import 'package:md_health/Screens/favourt/repository/fav_list_detail_repo.dart';
import 'package:md_health/Screens/favourt/repository/remove_food_fav_repo.dart';
import 'package:md_health/Screens/favourt/repository/remove_pack_repo.dart';
import 'package:md_health/Screens/favourt/view/favt_list.dart';
import 'package:md_health/Screens/order/model/order_count_model.dart';
import 'package:md_health/Screens/order/repository/order_count_repo.dart';
import 'package:md_health/Screens/order_details/model/hs_list_model.dart';
import 'package:md_health/Screens/order_details/model/order_list_model.dart';
import 'package:md_health/Screens/order_details/model/shop_order_list_model.dart';
import 'package:md_health/Screens/order_details/repo/hs_list_repo.dart';
import 'package:md_health/Screens/order_details/repo/order_list_repo.dart';
import 'package:md_health/Screens/order_details/repo/shop_order_list_repo.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderListViewController extends ChangeNotifier {
  OrderListrepo orderListrepo = OrderListrepo();
  ShopOrderListRepo shopOrderListRepo = ShopOrderListRepo();
  HsOrderListrepo hsOrderListrepo = HsOrderListrepo();
  int? orderCount;
  List<ShopOrderListModel>? shopOrderList;
  List<HsOrderDetail>? hsorderDetails;

  // ShopOrderListResponseModel

  bool isLoading = true;

  Future<void> initState(context) async {
    await fooDorderList(context);
    await shopDorderList(context);
    await hsorderList(context);
    notifyListeners();
  }

/////////////////////////////

  Future<void> hsorderList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    hsOrderListrepo
        .hsorderList(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = HsOrderListResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          hsorderDetails = result.hsorderDetails;
          // addCount = result.addCount;
          showLoader(false);
          notifyListeners();

          Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
        }
      } else {
        Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    });
  }

  ///////////////////////////////////
  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> shopDorderList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    shopOrderListRepo
        .shoporderList(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ShopOrderListResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          // addCount = result.addCount;
          shopOrderList = result.shopOrderList;
          showLoader(false);
          notifyListeners();

          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    });
  }

  ///////////////////////////////////////////////////////////////////////
  List<OrderList>? orderList;

  Future<void> fooDorderList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    orderListrepo.orderList(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = OrderListReponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          // addCount = result.addCount;
          orderList = result.orderList;
          showLoader(false);
          notifyListeners();

          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
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
