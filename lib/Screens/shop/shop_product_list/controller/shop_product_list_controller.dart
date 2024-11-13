import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/shop/shop_product_list/model/shop_product_list_model.dart';
import 'package:md_health/Screens/shop/shop_product_list/repository/shop_product_list_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_add_fav_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/add_to_fav_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopProductListConoller extends ChangeNotifier {
  ShopProductLIstRepo shopProductLIsstRepo = ShopProductLIstRepo();
  ShopProductAddToFavRepo shopProductAddToFavRepo = ShopProductAddToFavRepo();

  String? searchproductName;
  String? userPincode;
  String? rating;
  String? verifiedProvidersCount;
  String? freeShipping;
  String? minPrice;
  String? categoryId;
  String? subCategoryId;
  String? message;
  bool isLoading = true;
  int? id;
  bool isFavProduct = true;
  Future<void> initState(
      context, sePN, pincode, ratig, vpcount, fShip, mPri, cId, subCId) async {
    print('------------------------------------');
    print(pincode);

    print('------------------------------------');
    shopProductLIst(
        context, sePN, pincode, ratig, vpcount, fShip, mPri, cId, subCId);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  List<Product>? products;

  ShopProductListRequestModel get shopProductListRequestModel =>
      ShopProductListRequestModel(
          verifiedProvidersCount: verifiedProvidersCount ?? '',
          userPincode: userPincode ?? '',
          subCategoryId: subCategoryId ?? '',
          rating: rating ?? '',
          productName: searchproductName ?? '',
          minPrice: minPrice ?? "",
          freeShipping: freeShipping ?? '',
          categoryId: categoryId ?? '');

  Future<void> shopProductLIst(
      context, sePN, pincode, ratig, vpcount, fShip, mPri, cId, subCId) async {
    print('------------------------------------');
    print(mPri);
    print('------------------------------------');
    searchproductName = sePN;
    userPincode = pincode;
    rating = ratig;
    verifiedProvidersCount = vpcount;
    freeShipping = fShip;
    minPrice = mPri;
    categoryId = cId;
    subCategoryId = subCId;
    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    shopProductLIsstRepo
        .productsshop(shopProductListRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          ShopProductListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        print("tygiunjytmki");
        products = result.products;
        // Add null check here
        showLoader(false);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, "Didn't find products",
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

  ShopProductAddToFavRequestModel get shopProductAddToFavRequestModel =>
      ShopProductAddToFavRequestModel(
        shopType: "shop",
        productId: id.toString(),
      );
  Future<void> addToFavProducthome(context, addPId, mPri, fShip, vpcount, ratig,
      sePN, pincode, cId, subCId) async {
    id = addPId;
    LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    shopProductAddToFavRepo
        .shopProductaddfav(
            shopProductAddToFavRequestModel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ShopProductAddToFavResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // log(response.body);
        shopProductLIst(
            context, mPri, fShip, vpcount, ratig, sePN, pincode, cId, subCId);
        if (result.favStatus == "added") {
          isFavProduct = true;
          // shopHomePage(context);
          LoadingOverlay.of(context).hide();
        } else {
          isFavProduct = false;
          LoadingOverlay.of(context).hide();
        }
        // shopHomePage(context);
        LoadingOverlay.of(context).hide();
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
        notifyListeners();
      } else {
        // log(response.body);
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

  static const double fixedStartValue = 0.0;
  static const double maxRangeValue =
      10000; // Match this value with the slider's max

  RangeValues currentRangeValues = RangeValues(fixedStartValue, maxRangeValue);

  RangeValues getRangeValues() => currentRangeValues;

  void updateEndValue(double newEndValue) {
    newEndValue = newEndValue.clamp(fixedStartValue,
        maxRangeValue); // Ensure the newEndValue is within range
    currentRangeValues = RangeValues(fixedStartValue, newEndValue);
    notifyListeners();
  }

  // static const double fixedStartValue = 0.0;
  // RangeValues currentRangeValues = RangeValues(fixedStartValue, 50000);

  // RangeValues getRangeValues() => currentRangeValues;

  // void updateEndValue(double newEndValue) {
  //   currentRangeValues = RangeValues(fixedStartValue, newEndValue);
  //   notifyListeners();
  // }

  // RangeValues currentRangeValues = const RangeValues(0, 50000);
  // RangeValues getRangeValues() => currentRangeValues;
  // void updateRangeValues(RangeValues newValues) {
  //   currentRangeValues = newValues;
  //   notifyListeners();
  // }
  bool isCheckedExcellent = false;
  bool isCheckedVGood = false;
  bool isCheckedGood = false;
  bool isCheckedfair = false;
  bool isCheckedBad = false;
  String exellentselectedPrices = '';
  String verygoodselectedPrices = '';
  String goodselectedPrices = '';
  String fairselectedPrices = '';
  String badselectedPrices = '';
  String allSelectedReviews = '';

  updateAllSelectedReviews() {
    allSelectedReviews = '';
    if (exellentselectedPrices.isNotEmpty)
      allSelectedReviews += exellentselectedPrices + ', ';
    if (verygoodselectedPrices.isNotEmpty)
      allSelectedReviews += verygoodselectedPrices + ', ';
    if (goodselectedPrices.isNotEmpty)
      allSelectedReviews += goodselectedPrices + ', ';
    if (fairselectedPrices.isNotEmpty)
      allSelectedReviews += fairselectedPrices + ', ';
    if (badselectedPrices.isNotEmpty)
      allSelectedReviews += badselectedPrices + ', ';

    if (allSelectedReviews.isNotEmpty) {
      allSelectedReviews = allSelectedReviews.substring(
          0, allSelectedReviews.length - 2); // Remove trailing comma and space
    }
  }

  void etoggleCheckBox(bool value, String text) {
    isCheckedExcellent = value;
    if (value) {
      exellentselectedPrices = text;
    } else {
      exellentselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  void vtoggleCheckBox(bool value, String text) {
    isCheckedVGood = value;
    if (value) {
      verygoodselectedPrices = text;
    } else {
      verygoodselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  void gtoggleCheckBox(bool value, String text) {
    isCheckedGood = value;
    if (value) {
      goodselectedPrices = text;
    } else {
      goodselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  void ftoggleCheckBox(bool value, String text) {
    isCheckedfair = value;
    if (value) {
      fairselectedPrices = text;
    } else {
      fairselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  void btoggleCheckBox(bool value, String text) {
    isCheckedBad = value;
    if (value) {
      badselectedPrices = text;
    } else {
      badselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  //////////////////////////////////////////
  bool isVerifiedProducts = false;

  String verifiedProduct = '';
  String selectedVerifiedProduct = '';
  void sOnetoggleCheckBox(bool value, String text) {
    isVerifiedProducts = value;
    if (value) {
      verifiedProduct = text;
    } else {
      verifiedProduct = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  updateAllSelectedServices() {
    selectedVerifiedProduct = '';
    if (verifiedProduct.isNotEmpty)
      selectedVerifiedProduct += verifiedProduct + ', ';

    if (selectedVerifiedProduct.isNotEmpty) {
      selectedVerifiedProduct = selectedVerifiedProduct.substring(
          0, selectedVerifiedProduct.length - 2);
    }
  }

  //////////////////////////////////////
  bool isFreeshipping = false;

  String freeShippingProduct = '';
  String selectedFreeShippping = '';
  void freetoggeleCheck(bool value, String text) {
    isFreeshipping = value;
    if (value) {
      freeShippingProduct = text;
    } else {
      freeShippingProduct = '';
    }
    updateFreeshipping();
    notifyListeners();
  }

  updateFreeshipping() {
    selectedFreeShippping = '';
    if (freeShippingProduct.isNotEmpty)
      selectedFreeShippping += freeShippingProduct + ', ';

    if (selectedFreeShippping.isNotEmpty) {
      selectedFreeShippping =
          selectedFreeShippping.substring(0, selectedFreeShippping.length - 2);
    }
  }
}
