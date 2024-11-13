import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/review/model/reviw_model.dart';
import 'package:md_health/Screens/review/repository/review_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_product_model.dart';
// import 'package:md_health/Screens/shop_product_view/repository/shop_product_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewController extends ChangeNotifier {
  String? productId;
  List<CustomerReviewsDatum>? customerReviewsData;
  int? customerReviewsCount;
  String? customerReviewsAverage;
  bool isLoading = true;

  ReviewRepo reviewRepo = ReviewRepo();

  Future<void> initState(context, proId) async {
    await ReviewView(context, proId);
    notifyListeners();
  }
  ///////////////////////////////////////

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  ReviewRequestModel get reviewRequestModel => ReviewRequestModel(
        packageId: productId.toString(),
      );
  Future<void> ReviewView(context, proId) async {
    showLoader(true);
    productId = proId;
    SharedPreferences pref = await SharedPreferences.getInstance();
    reviewRepo
        .review(reviewRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result = BankListModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        customerReviewsData = result.customerReviewsData;
        customerReviewsCount = result.customerReviewsCount;
        customerReviewsAverage = result.customerReviewsAverage;
        // int? customerReviewsCount;
        // String? customerReviewsAverage;
        // productImages = result.data?.unitBasedProductImagePath?.imageList ?? [];
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
