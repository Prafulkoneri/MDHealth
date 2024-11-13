import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/get_who-purchase_model.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/calculation_repo.dart';
import 'package:md_health/Screens/order_details/model/country_list_model.dart';
import 'package:md_health/Screens/order_details/model/country_search_list_model.dart';
import 'package:md_health/Screens/order_details/model/submit_food_review.dart';
import 'package:md_health/Screens/order_details/model/invoice_food_download_model.dart';
import 'package:md_health/Screens/order_details/model/order_details_food_model.dart';
import 'package:md_health/Screens/order_details/model/shop_order_details_model.dart';
import 'package:md_health/Screens/order_details/model/show_food_review_model.dart';
import 'package:md_health/Screens/order_details/repo/food_add_review_new_pop_up.dart';
import 'package:md_health/Screens/order_details/repo/food_order_details_repo.dart';
import 'package:md_health/Screens/order_details/repo/invoices_food_repo.dart';
import 'package:md_health/Screens/order_details/repo/order_list_repo.dart';
import 'package:md_health/Screens/order_details/repo/order_search_package_repo.dart';
import 'package:md_health/Screens/order_details/repo/show_food_review_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderListFoodViewController extends ChangeNotifier {
  FoodOrderDetailsRepo foodOrderDetailsRepo = FoodOrderDetailsRepo();
  CountrySearchRepo countrySearchRepo = CountrySearchRepo();
  TextEditingController foodFeedBackController = TextEditingController();
  String foodOrderId = '';

  bool isLoading = true;

  Future<void> initState(context, fodId) async {
    await FoodOrderDetailsView(context, fodId);
    // getFoodReview(context, orId);
    notifyListeners();
  }

/////////////////////////////
  double? foodReview;

  void onTapFoodReview(value) {
    foodReview = value;
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  OrderFoodDetails? orderFoodDetails;
  List<Sale>? sales;
  List<MenuList>? menuList;
  List<MealType>? mealType;
  List<String>? newMealTypes;
  List<String>? mealName;

  OrderListDetailsRequestModel get orderListDetailsRequestModel =>
      OrderListDetailsRequestModel(
        foodOrderId: foodOrderId,
      );
  Future<void> FoodOrderDetailsView(context, fodId) async {
    foodOrderId = fodId.toString();

    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    foodOrderDetailsRepo
        .foodOrderDetails(
            orderListDetailsRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result = OrderListReponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        orderFoodDetails = result.orderFoodDetails;
        sales = result.sales;
        menuList = orderFoodDetails?.menuList;
        mealType = menuList?.first.mealType;
        newMealTypes = orderFoodDetails?.mealTypes;
        mealName = mealType?.first.mealName;
        log(response.body);
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.success);
        showLoader(false);
        notifyListeners();
      }
      notifyListeners();
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
  ////////////////////////////////

  String? invoices;
  FoodDonloadInvoiceRepo foodDonloadInvoiceRepo = FoodDonloadInvoiceRepo();
  ShowFoodreviewRepo showFoodreviewRepo = ShowFoodreviewRepo();

  String? orderId;
  FoodInvoicesdownloadrequestModel get foodinvoicesdownloadrequestModel =>
      FoodInvoicesdownloadrequestModel(orderId: orderId);
  Future<void> fooddownloadInvoise(context, od) async {
    // showLoader(true);
    orderId = od;
    LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    foodDonloadInvoiceRepo
        .fooddownloadIn(
            foodinvoicesdownloadrequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          FoodInvoicesDownloadResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        invoices = result.invoices;
        String url = Uri.encodeFull(result.invoices.toString());
        if (await canLaunch(url)) {
          launch(url);
        } else {
          throw 'Could not launch $url';
        }
        LoadingOverlay.of(context).hide();
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
  //////////////////////////////////////////////////////
  ////////////////////////////////////Review///////////////////////////////////////

  String? feedback;
  String? rating;
  String? recommendation;
  String? productId;
  FoodAddReviewNewPopUpRepo foodAddReviewNewPopUpRepo =
      FoodAddReviewNewPopUpRepo();
  double? foodRecommanded;

  void onTapFoodRecommanded(value) {
    foodRecommanded = value;
    notifyListeners();
  }

  FoodAddReviewNewRequestModel get foodAddReviewNewRequestModel =>
      FoodAddReviewNewRequestModel(
          recommendation: foodRecommanded.toString(),
          rating: foodReview.toString(),
          productId: productId,
          feedback: foodFeedBackController.text,
          orderId: orderId);
  Future<void> foodAddReview(context, od, pId, fFeed, fR, fRc) async {
    // showLoader(true);
    orderId = od;
    productId = pId;
    foodFeedBackController.text = fFeed;
    foodReview = fR;
    foodRecommanded = fRc;

    LoadingOverlay.of(context).show();

    // type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    foodAddReviewNewPopUpRepo
        .writeFoodReview(
            foodAddReviewNewRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          FoodAddReviewNewResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),

                  // insetPadding:
                  //    EdgeInsets.all(0),
                  contentPadding: EdgeInsets.only(top: 0.0),

                  content: Container(
                    width: ScreenUtil().screenWidth,
                    height: 350.h,
                    // padding:
                    //     EdgeInsets.only(bottom: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(15), // Image border
                                child: SizedBox.fromSize(
                                  // size: Size.fromRadius(
                                  //     10), // Image radius
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/green_pop_up.png")),
                                ),
                              ),

                              // Image(
                              //     image: AssetImage(
                              //         "assets/images/pop__new_.png")),
                            ),
                            Positioned(
                                top: 15,
                                right: 0,
                                left: 0,
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icons/happy_pop_up.svg"),
                                    // Text(
                                    //   "Delete",
                                    //   style: TextStyle(
                                    //       color: Colors.white,
                                    //       // letterSpacing: .5,
                                    //       fontSize: 30.sp,
                                    //       fontWeight: FontWeight.w700),
                                    // ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Thank',
                                        style: TextStyle(
                                            letterSpacing: -1,
                                            fontFamily: 'Campton',
                                            color: Colors.white,
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w700),

                                        /*defining default style is optional */
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' You!',
                                            style: TextStyle(
                                                letterSpacing: -1,
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        Text(
                          "Thank you for your review.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: -1,
                              fontFamily: 'Campton',
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'The reward will be credited to your\n',
                            style: TextStyle(
                                letterSpacing: -1,
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'MD',
                                style: TextStyle(
                                    letterSpacing: -1,
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text: 'Coin account as soon as possible.',
                                style: TextStyle(
                                    letterSpacing: -1,
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 22.w, right: 21.w),
                          child: PrimaryButton(
                            // width:
                            //     125.w,
                            // height:
                            //     35.w,
                            // borderRadius: BorderRadius.circular(),
                            borderRadius: 25,
                            // width: ScreenUtil().screenWidth,
                            color: Color(0xff4CDB06),
                            onTap: () {
                              // Navigator.pop(this.context);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: -1,
                                  fontFamily: 'Campton',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
        FoodOrderDetailsView(context, od);
        LoadingOverlay.of(context).hide();
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
  /////////////////////////////////////////////

  ShowFoodOrderReviewRequestModel get showFoodOrderReviewRequestModel =>
      ShowFoodOrderReviewRequestModel(orderID: orderId);
  ShowFoodReviewdata? showfoodreviewdata;

  Future<void> getFoodReview(context, orId) async {
    // showLoader(true);
    orderId = orId;
    LoadingOverlay.of(context).show();

    // purcheseId = purchesId;
    // type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    showFoodreviewRepo
        .showfoodreview(
            showFoodOrderReviewRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ShowFoodOrderResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        showfoodreviewdata = result.showfoodreviewdata;
        // rating = showfoodreviewdata?.rating.toString();
        // feedback = showfoodreviewdata?.feedback ?? '';
        // recommendation = showfoodreviewdata?.recommendation.toString();
        LoadingOverlay.of(context).hide();
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

  bool showMenuDetails = false;

  void toggleMenuDetails() {
    showMenuDetails = !showMenuDetails;
    notifyListeners(); // Notify listeners when the state changes
  }

  ////////////////////////////////////////////////////////////////////////
  List<MealTypeWho>? mealTypeswho;

  int selectedTextIndextype = -1;
  void setSelectedTexttype1(context, value, index) {
    selectedTexttype = value;
    selectedTextIndextype = index;
    calculationprice(
      context: context,
      saPrices: '',
      cheStatus: 'true' ?? '',
      fpId: foodOrderId.toString() ?? '',
      mType: "rfduhj" ?? "",
      stype: '',
    );
    notifyListeners();
  }

  String? salesPrice;

  CalculationData? calculationdata;
  String selectedTexttype = '';
  String? mealTypeRenew;
  CalculationRepo calculationRepo = CalculationRepo();
  String newSalePrice = '';
  String subscriptionType = '';
  String? status;

  CalculationRequestModel get calculationRequestModel =>
      CalculationRequestModel(
        foodpackageId: foodOrderId.toString(),
        subscriptionType: selectedTexttype.toString(),
        salePrice: salesPrice.toString(),
        mealType: mealTypeRenew,
        status: 'true',
      );
  Future<void> calculationprice({
    required BuildContext context,
    required String saPrices,
    required String mType,
    required String fpId,
    required String stype,
    required String cheStatus,
  }) async {
    salesPrice = saPrices;
    mealTypeRenew = mType;
    foodOrderId = fpId;
    subscriptionType = stype;
    status = cheStatus;

    // Debug logs to verify parameter values////
    log('Sales Price: $salesPrice');
    log('Meal Type: $mealType');
    log('Food Package ID: ');
    log('Subscription Type: $subscriptionType');
    log('Status: $status');

    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    calculationRepo
        .calcluationprice(
            calculationRequestModel, pref.getString("successToken"))
        .then((response) async {
      log('Request URL: ${response.request?.url}');
      log('Response Body: ${response.body}');
      final result =
          CalculationMealResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log('Calculation Result: ${result.calculationdata}');
        newSalePrice = result.calculationdata?.salePrices.toString() ?? '';
        log('New Sale Price: $newSalePrice');
        showLoader(false);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError((Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }
}
