import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:md_health/Screens/health/packages/model/active_review_model.dart';

import 'package:md_health/Screens/health/packages/model/review_model.dart';
import 'package:md_health/Screens/health/packages/repository/review_repo.dart';
import 'package:md_health/Screens/health/packages/repository/three_review_repo.dart';
// import 'package:md_health/Screens/health/repository/package_detail_view_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WriteReviewController extends ChangeNotifier {
  WriteReviewRepo writeReviewRepo = WriteReviewRepo();
  ThreeReviewRepo threeReviewRepo = ThreeReviewRepo();
  TextEditingController reviewController = TextEditingController();

  String packageId = '';
  String purcheseId = '';
  bool isLoading = true;
  double? cleanless;
  double? ratingValues;
  double? transportationValueratingValue;
  double? behaviorValueratingValue;
  double? newStartOne;
  double? newStartTwo;
  double? newStartThree;
  double? comfort;
  double? food;

  Future<void> initState(context, pId, puId
      // valueTreatment, valueTransportation,
      //     valueBehaviorValue, valueacommmodation
      ) async {
    // await threeReview(context, puId);
    notifyListeners();
  }

/////////////////////////////

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  void onRatingSelectsCleanless(value) {
    cleanless = value;
    notifyListeners();
  }

  void onRatingSelectsComfort(value) {
    comfort = value;
    notifyListeners();
  }

  void onRatingSelectsFood(value) {
    food = value;
    notifyListeners();
  }

  void onRatingSelectsBehavior(value) {
    behaviorValueratingValue = value;
    notifyListeners();
  }
  /////////////////////////

  void onRatingNewOne(value) {
    newStartOne = value;
    notifyListeners();
  }

  void onRatingNewTWO(value) {
    newStartTwo = value;
    notifyListeners();
  }

  void onRatingNewtHREE(value) {
    newStartThree = value;
    notifyListeners();
  }

  double? recommanededcount;

  void onTapRecommanded(value) {
    recommanededcount = value;
    notifyListeners();
  }

  WirteReviewRequestModel get wirteReviewRequestModel =>
      WirteReviewRequestModel(
        treatment: comfort.toString(),
        recommanded: recommanededcount.toString(),
        purchaseId: purcheseId ?? '',
        packageId: packageId ?? '',
        notes: reviewController.text ?? '',
        behaviorValue: behaviorValueratingValue.toString() ?? '',

        // treatmentValue: treatmentValueratingValue.toString(),
        // notes: reviewController.text,
        // transportationValue: transportationValueratingValue.toString(),
        // behaviorValue: behaviorValueratingValue.toString(),
        // acommmodationValue: acommmodationValueratingValue.toString(),
        // packageId: packageId
      );
  Future<void> writeReview(context, pId, puId
      // valueTreatment, valueTransportation,
      //     valueBehaviorValue, valueacommmodation
      ) async {
    print('########$pId');
    print('########$puId');
    showLoader(true);
    packageId = pId;
    purcheseId = puId;
    // treatmentValueratingValue = valueTreatment;
    // transportationValueratingValue = valueTransportation;
    // behaviorValueratingValue = valueBehaviorValue;
    // acommmodationValueratingValue = valueacommmodation;
    SharedPreferences pref = await SharedPreferences.getInstance();
    writeReviewRepo
        .writereview(wirteReviewRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          WirteReviewResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        // customerReviewsData = result.customerReviewsData;
        // reviewController.text = customerReviewsData?.extraNotes ?? "";
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

  // ReviewsScreenData? reviewsScreenDatas;

  ///////////////
  // ActiveReviewRequestMOdel get activeReviewRequestMOdel =>
  //     ActiveReviewRequestMOdel(
  //       purchaseId: purcheseId.toString(),
  //     );
  // Future<void> threeReview(context, puId) async {
  //   showLoader(true);
  //   purcheseId = puId;

  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   threeReviewRepo
  //       .threeReview(activeReviewRequestMOdel, pref.getString("successToken"))
  //       .then((response) async {
  //     debugPrint('/////////////');
  //     final result =
  //         ActiveReviewResponseMOdel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       reviewsScreenDatas = result.reviewsScreenDatas;
  //       showLoader(false);
  //       notifyListeners();
  //     } else {
  //       log(response.body);
  //       Utils.showPrimarySnackbar(context, result.message,
  //           type: SnackType.error);
  //     }
  //   }).onError((error, stackTrace) {
  //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
  //   }).catchError(
  //     (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //     },
  //     test: (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //       return false;
  //     },
  //   );
  // }
}
