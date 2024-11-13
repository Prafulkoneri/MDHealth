import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/view/md_shop_home_page.dart';
import 'package:md_health/Screens/shop/shop_cart/model/all_cart_delete_model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/cart_decrement_model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/cart_increment_%20model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/cart_view_model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/one_item_delete_model.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/all_cart_delete_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/cart_count_decrease_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/cart_count_increase_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/delete_one_cart_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/get_cart_details_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/controller/s_product_view_controller.dart';
import 'package:md_health/Screens/shop/shop_vendors/model/shop_vendor_model.dart';
import 'package:md_health/Screens/shop/shop_vendors/repository/shop_vendor_repo.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopVendorListCOntroller extends ChangeNotifier {
  ShopListVendorRepo shopListVendorRepo = ShopListVendorRepo();

  Future<void> initState(context, vId) async {
    vendorShopList(context, vId);
    notifyListeners();
  }

  String? vedorId;
  List<ShopVendorData>? productData;

  ShopVendorRequestModel get shopVendorRequestModel => ShopVendorRequestModel(
        vedorId: vedorId.toString(),
      );
  Future<void> vendorShopList(context, vId) async {
    vedorId = vId.toString();
    SharedPreferences pref = await SharedPreferences.getInstance();
    shopListVendorRepo
        .shopVendor(shopVendorRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          ShopVendorResponseModel.fromJson(jsonDecode(response.body));
      if (result.status == 200) {
        log(response.body);
        productData = result.productData;
        // Add null check here

        notifyListeners();
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
