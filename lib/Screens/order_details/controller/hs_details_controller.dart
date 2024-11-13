import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
import 'package:md_health/Screens/order_details/model/country_list_model.dart';
import 'package:md_health/Screens/order_details/model/country_search_list_model.dart';
import 'package:md_health/Screens/order_details/model/hs_list_details_model.dart';
import 'package:md_health/Screens/order_details/model/invoices_hs_dowload_model.dart';
import 'package:md_health/Screens/order_details/model/order_details_food_model.dart';
import 'package:md_health/Screens/order_details/model/shop_order_details_model.dart';
import 'package:md_health/Screens/order_details/model/show_hs_review_model.dart';
import 'package:md_health/Screens/order_details/model/submit_hs_review_model.dart';
import 'package:md_health/Screens/order_details/repo/food_order_details_repo.dart';
import 'package:md_health/Screens/order_details/repo/hs_details_repo.dart';
import 'package:md_health/Screens/order_details/repo/invoices_hs_repo.dart';
import 'package:md_health/Screens/order_details/repo/order_list_repo.dart';
import 'package:md_health/Screens/order_details/repo/order_search_package_repo.dart';
import 'package:md_health/Screens/order_details/repo/show_hs_repo.dart';
import 'package:md_health/Screens/order_details/repo/submit_hs_repo.dart';
import 'package:md_health/Screens/order_details/view/show_hs_review_pop.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HsDetailsViewController extends ChangeNotifier {
  HsDetailsRepo hsDetailsRepo = HsDetailsRepo();
  HSDonloadInvoiceRepo hSDonloadInvoiceRepo = HSDonloadInvoiceRepo();
  HsDetailsViewData? hsDetailsviewdata;
  String hsOrderId = '';

  bool isLoading = true;

  Future<void> initState(context, hsId, puId, pId) async {
    await hsOrderDetailsView(context, hsId);
    notifyListeners();
  }

/////////////////////////////

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  OrderFoodDetails? orderFoodDetails;

  HsOrderListRequestModel get hsOrderListRequestModel =>
      HsOrderListRequestModel(
        hSorderId: hsOrderId,
      );
  Future<void> hsOrderDetailsView(context, hsId) async {
    hsOrderId = hsId.toString();

    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsDetailsRepo
        .hsDetails(hsOrderListRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result =
          HsOrderListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        hsDetailsviewdata = result.hsDetailsviewdata;
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
  HSDonloadInvoiceRepo hsDonloadInvoiceRepo = HSDonloadInvoiceRepo();

  String? orderId;
  HSInvoicesdownloadrequestModel get hsinvoicesdownloadrequestModel =>
      HSInvoicesdownloadrequestModel(orderId: orderId);
  Future<void> hsdownloadInvoise(context, od) async {
    orderId = od;
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    hSDonloadInvoiceRepo
        .hsdownloadIn(
            hsinvoicesdownloadrequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          HSInvoicesDownloadResponseModel.fromJson(jsonDecode(response.body));
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

  ////////////////////////////////////////////
  SubmitHSreviewRepo submitHSreviewRepo = SubmitHSreviewRepo();
  ShowHSreviewRepo showHSreviewRepo = ShowHSreviewRepo();
  double? treatmentRating;
  double? behaviourRating;
  double? recommanededcount;

  void onTaptreatment(value) {
    treatmentRating = value;
    notifyListeners();
  }

  void onTapBehaviour(value) {
    behaviourRating = value;
    notifyListeners();
  }

  void onTapRecommanded(value) {
    recommanededcount = value;
    notifyListeners();
  }

  String packageId = '';
  String purchaseId = '';
  TextEditingController feedbackHSController = TextEditingController();
  HSAddReviewNewRequestModel get hSAddReviewNewRequestModel =>
      HSAddReviewNewRequestModel(
        purchaseId: purchaseId ?? '',
        packageId: packageId ?? '',
        treatment: treatmentRating.toString() ?? '',
        behaviourReviews: behaviourRating.toString() ?? '',
        recommendedService: recommanededcount.toString() ?? '',
        feedback: feedbackHSController.text,
      );
  Future<void> homeServicesAddReview(
      context,
      // hsId,
      puID,
      pId,
      double? hsTre,
      double? hsBe,
      double? hsRe,
      hsf,
      hsId) async {
    purchaseId = puID;
    packageId = pId;
    treatmentRating = hsTre;
    behaviourRating = hsBe;
    recommanededcount = hsRe;

    feedbackHSController.text = hsf;
    hsOrderId = hsId.toString();

    if (treatmentRating == null || packageId.isEmpty || purchaseId.isEmpty) {
      Utils.showPrimarySnackbar(context, "Please fill all fields",
          type: SnackType.error);
      return;
    }
    LoadingOverlay.of(context).show();

    // type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    submitHSreviewRepo
        .submitHSreview(
            hSAddReviewNewRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          HSAddReviewNewResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        final result =
            HSAddReviewNewResponseModel.fromJson(jsonDecode(response.body));
        Navigator.pop(context);
        print('objeciytdgjhdjhggdjhhgdgdjhfgjjht');
        hsOrderDetailsView(context, hsId);

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
  /////////////////////////

  ShowHSOrderReviewRequestModel get showHSOrderReviewRequestModel =>
      ShowHSOrderReviewRequestModel(orderID: orderId);
  ShowHSReviewdata? showhsreviewdata;

  Future<void> getHsReview(context, orId) async {
    // showLoader(true);
    orderId = orId;
    LoadingOverlay.of(context).show();

    // purcheseId = purchesId;
    // type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    showHSreviewRepo
        .showHSreview(
            showHSOrderReviewRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ShowHSOrderResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        showhsreviewdata = result.showhsreviewdata;
        // rating = showfoodreviewdata?.rating.toString();
        // feedback = showfoodreviewdata?.feedback ?? '';
        // recommendation = showfoodreviewdata?.recommendation.toString();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                contentPadding: EdgeInsets.only(top: 0.0),
                content: ShowHsReviewPopUp(orderId: orderId)));
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
}
