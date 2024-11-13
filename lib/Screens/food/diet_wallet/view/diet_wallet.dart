import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/food/card_diet/view/payment_processing.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/view/payment_view_diet.dart';
import 'package:md_health/Screens/health/payment/controller/payment_controller.dart';
import 'package:md_health/Screens/my_wallet/controller/my_wallet_controller.dart';
import 'package:md_health/Screens/my_wallet/view/invite_frients_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class DietMyWalletScreenView extends StatefulWidget {
  final String? foodPackageId;
  final String? foodPackageName;
  final String? foodPackageSalePrice;
  final String? subscriptionType;
  final String? subscriptionStartDate;
  final String? patientId;
  final String? subscriptionEndDate;
  final String? paymentMethod;
  final String? platformType;
  final String? type;
  final String? daysInWords;
  DietMyWalletScreenView({
    super.key,
    this.foodPackageId,
    this.foodPackageName,
    this.foodPackageSalePrice,
    this.subscriptionType,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
    this.patientId,
    this.paymentMethod,
    this.platformType,
    this.type,
    this.daysInWords,
  });
  @override
  State<DietMyWalletScreenView> createState() => _MyWalletScreenViewPayState();
}

class _MyWalletScreenViewPayState extends State<DietMyWalletScreenView> {
  // @override
  // void initState() {
  //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
  //     log(widget.packageId ?? '');
  //     context.read<PaymentController>().initState(
  //         context,
  //         widget.packageId,
  //         widget.price,
  //         widget.percetagePrise,
  //         widget.percetage,
  //         widget.selectedNames,
  //         widget.puchesId,
  //         widget.patientID,
  //         widget.purchaseType,
  //         widget.bankName,
  //         "");
  //   });
  // }
  @override
  void initState() {
    print('wallet patient id ********** ${widget.patientId}');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MyWalletScreenController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final read = context.read<PaymentController>();
    // final watch = context.watch<PaymentController>();
    final watch = context.watch<MyWalletScreenController>();
    final readPayment = context.watch<PaymentController>();
    return BaseScreen(
      onWillPop: () async {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => PaymentDetailsViewDiet(
        //               type: widget.type,
        //               subscriptionType: widget.subscriptionType,
        //               subscriptionStartDate: widget.subscriptionEndDate,
        //               foodPackageId: widget.foodPackageId,
        //             )));
        Navigator.push(
          context,
          SlidePageRoute(
            page: PaymentDetailsViewDiet(
              type: widget.type,
              subscriptionType: widget.subscriptionType,
              subscriptionStartDate: widget.subscriptionStartDate,
              foodPackageId: widget.foodPackageId,

              // price: watch.salePrice,
            ),
            direction: SlideDirection.right, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );
        return false;
      },
      backgroundColor: const Color(0xffFBFBFB),
      //  backgroundColor: Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.w),
        child: CustomAppBar(
          hasBackButton: true,
          onBackPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: PaymentDetailsViewDiet(
                  type: widget.type,
                  subscriptionType: widget.subscriptionType,
                  subscriptionStartDate: widget.subscriptionStartDate,
                  foodPackageId: widget.foodPackageId,

                  // price: watch.salePrice,
                ),
                direction:
                    SlideDirection.right, // Specify the slide direction here
                delay: Duration(milliseconds: 5000),
              ),
            );
          },
          hasMdTitle: false,
          drawerTitle: "Wallet",
        ),
      ),
      content: Builder(builder: (context) {
        return Column(
          children: [
            SizedBox(
              height: 28.h,
            ),
            RichText(
              text: TextSpan(
                text: "1 MD",
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(
                    text: ' coin ',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => SignUpView()),
                        // );
                      },
                  ),
                  TextSpan(
                    text: '= 1 Turkish Lira',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => SignUpView()),
                        // );
                      },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PAYMENT",
                  style: TextStyle(
                    fontFamily: 'Campton',
                    color: kDefaultActiveColor,
                    fontSize: 29.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 230, 230, 230).withOpacity(0.60),
                      offset: Offset(2, 2),
                      blurRadius: 10.0,
                    ),
                  ]),
              child: Card(
                elevation: 2.0,
                color: Color.fromARGB(255, 255, 254, 254),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 18.w, top: 21.w, right: 20.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${widget.foodPackageName}",
                                    // "package Name",
                                    // "${watch.purchaseDetailsDataLast?.treatmentName}",
                                    style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    " ${widget.subscriptionType}",
                                    // "package Name",
                                    // "${watch.purchaseDetailsDataLast?.treatmentName}",
                                    style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              // Text(
                              //   "${widget.foodPackageSalePrice}",

                              //   style: TextStyle(
                              //     fontFamily: 'Campton',
                              //     color: Colors.black,
                              //     fontSize: 16.sp,
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),
                              RichText(
                                text: TextSpan(
                                    text: "${widget.foodPackageSalePrice} ",
                                    style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '₺',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF1F1F1),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20.0),
                        ),
                      ),
                      // width: 400.w,
                      height: 61.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Payment",
                              style: TextStyle(
                                fontFamily: 'Campton',
                                color: kDefaultActiveColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "${widget.foodPackageSalePrice} ",
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '₺',
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            // Text(
                            //   "${widget.foodPackageSalePrice}",
                            //   style: TextStyle(
                            //     fontFamily: 'Campton',
                            //     color: black,
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.w700,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.w, top: 17.w, right: 20.w),
              child: Stack(
                children: [
                  Image.asset("assets/images/Rectangle.png"),
                  Positioned(
                    left: 20.w,
                    // right: 5,
                    top: 50.w,
                    // bottom: 0,
                    child:
                        // Text("data")
                        RichText(
                      text: TextSpan(
                        text: "Available",
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' MD',
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {},
                          ),
                          TextSpan(
                            text: 'coins\n',
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => SignUpView()),
                                // );
                              },
                          ),
                          TextSpan(
                            text: '${watch.coins ?? 0}',
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 34.sp,
                                fontWeight: FontWeight.w700),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => SignUpView()),
                                // );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Image.asset(
                      "assets/images/md coin 3d.png",
                      height: 154.h,
                      width: 154.w,
                    ),
                  ),
                  Positioned(
                    bottom: 30.w,
                    left: 15.w,
                    child: PrimaryButton(
                      width: 120.w,
                      height: 35.h,
                      borderColor: Colors.black,
                      borderRadius: 30,
                      color: Colors.transparent,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  backgroundColor: Color(0xff4CDB06),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  content: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "assets/images/md coin 3d.png",
                                              height: 154.h,
                                              width: 154.w,
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: SvgPicture.asset(
                                                  "assets/icons/red_close.svg"),
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Text(
                                            "You don't have enough MDCoin.You can earn MDCoin by inviting friends.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                // letterSpacing: .5,
                                                fontSize: 19.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 18.0.w, right: 18.0.w),
                                          child: PrimaryButton(
                                            // borderColor: Colors.black,
                                            width: 352.w,
                                            height: 40.w,

                                            borderRadius: 30,

                                            color: black,
                                            // color: kDefaultActiveColor,
                                            onTap: () {
                                              Navigator.pop(context);

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        InviteFriendsView()),
                                              );
                                            },
                                            child: Text(
                                              "Invite Friends",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.white,
                                                  // letterSpacing: .5,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LoginScreenView()),
                        // );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Use My MD",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                // letterSpacing: .5,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "coin",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                // letterSpacing: .5,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      // Text(
                      //   "Use My MDcoin",
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       color: Colors.black,
                      //       // letterSpacing: .5,
                      //       fontSize: 15.sp,
                      //       fontWeight: FontWeight.w700),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            PrimaryButton(
              height: 40.h,
              width: 310.w,
              borderRadius: 30,
              color: Color(0xff4CDB06),
              onTap: () async {
                print(
                  widget.type,
                );
                print(
                  widget.subscriptionStartDate,
                );
                print(
                  widget.subscriptionEndDate,
                );
                print(
                  widget.platformType,
                );
                print(
                  widget.paymentMethod,
                );
                print(
                  widget.foodPackageSalePrice,
                );
                print(
                  widget.foodPackageId,
                );
                print(watch.coins);
                // return;
                double percentagePrice =
                    double.tryParse(widget.foodPackageSalePrice ?? '0') ?? 0;
                double coinAmount = double.tryParse(watch.coins ?? '0') ?? 0;

                if (percentagePrice > coinAmount) {
                  // Show error message in Snackbar

                  Utils.showPrimarySnackbar(
                      context, "Purchase price is greater than available coins",
                      type: SnackType.error);
                } else {
                  // Continue with payment
                  readPayment.cardDietPayment(
                    context,
                    widget.type,
                    widget.subscriptionStartDate,
                    widget.subscriptionEndDate,
                    widget.patientId,
                    widget.platformType,
                    widget.paymentMethod,
                    widget.foodPackageSalePrice,
                    widget.foodPackageId,
                    "",
                    widget.subscriptionType,
                    "",
                    '',
                    readPayment.randomNumber,
                    "",
                    '',
                    "",
                    '',
                    "",
                    '',
                    "",
                  );
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: DietPaymentProcessingView(
                        mdCoins: watch.coins,
                        type: widget.type,
                        subscriptionStartDate: widget.subscriptionStartDate,
                        subscriptionEndDate: widget.subscriptionEndDate,
                        platformtype: widget.platformType,
                        paymentMethod: widget.paymentMethod,
                        foodPackageTotalPrice: widget.foodPackageSalePrice,
                        foodPackageId: widget.foodPackageId,
                        patiendId: widget.patientId,
                      ),
                      // DietPaymentProcessingView(
                      //   mdCoins: watch.coins,
                      //   type: widget.type,
                      //   subscriptionStartDate: widget.subscriptionStartDate,
                      //   subscriptionEndDate: widget.subscriptionEndDate,
                      //   platformtype: widget.platformType,
                      //   paymentMethod: widget.paymentMethod,
                      //   foodPackageTotalPrice: widget.foodPackageSalePrice,
                      //   foodPackageId: widget.foodPackageId,
                      // ),
                      direction: SlideDirection
                          .right, // Specify the slide direction here
                      delay: Duration(milliseconds: 5000),
                    ),
                  );
                }
              },
              child: Text(
                "Proceed Payment",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        );
      }),
    );
  }
}
