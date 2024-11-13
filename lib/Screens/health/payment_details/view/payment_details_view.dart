import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/health/bank_transfer/view/bank_tranfer.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_details_view.dart';
import 'package:md_health/Screens/health/information_form/view/information_form_view.dart';
import 'package:md_health/Screens/health/payment_details/controller/payment_details_controller.dart';
import 'package:md_health/Screens/health/payment_details/view/wallet_view.dart';
import 'package:md_health/Screens/payment/view/payment_view.dart';
import 'package:md_health/Screens/health/search/view/search_details_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/form_popup_widget.dart';
import 'package:md_health/widget/loader.dart';
import 'package:provider/provider.dart';

class PaymentDetailsView extends StatefulWidget {
  final String? packageId;
  final String? treatmentName;
  final String? packageName;
  final String? index;
  final String? screenName;
  final String? price;
  final String? paymentType;
  final String? patientID;
  final String? purchaseType;
  final String? code;

  final bool? refreshPage;
  const PaymentDetailsView(
      {super.key,
      this.packageId,
      this.index,
      this.code,
      this.price,
      this.refreshPage,
      this.paymentType,
      this.screenName,
      this.patientID,
      required this.purchaseType,
      this.packageName,
      this.treatmentName});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation _animation;

  // var serviceInfo;

  @override
  void initState() {
    super.initState();
    print(widget.packageId);
    print(widget.treatmentName);
    print("gfhbjghbjguig");
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PaymentDetailsController>().initState(context,
          widget.packageId.toString(), widget.purchaseType, widget.code);
    });

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  void _showDialog() {
    _animationController.reset();
    _animationController.forward();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      0, MediaQuery.of(context).size.height * _animation.value),
                  child: const FormPopUp(),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PaymentDetailsController>();
    final watch = context.watch<PaymentDetailsController>();

    return BaseScreen(
        onWillPop: () async {
          if (widget.screenName == "infotmation") {
            Navigator.pushReplacement(
              context,
              SlidePageRoute(
                page: InformationFormView(
                  packageId: watch.packageId,
                  screenName: "infotmation",
                ),
                direction: SlideDirection.left,
                delay: const Duration(milliseconds: 5000),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              SlidePageRoute(
                page: SearchDetailsView(
                  treatmentName: widget.treatmentName,
                  packageId: watch.packageId,
                ),
                direction: SlideDirection.left,
                delay: const Duration(milliseconds: 5000),
              ),
            );
          }
          return false;
        },
        backgroundColor: const Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            hasMdTitle: false,
            hasBackButton: true,
            onBackPressed: () {
              if (widget.screenName == "infotmation") {
                Navigator.pushReplacement(
                  context,
                  SlidePageRoute(
                    page: InformationFormView(
                      packageId: watch.packageId,
                      screenName: "infotmation",
                    ),
                    direction: SlideDirection.left,
                    delay: const Duration(milliseconds: 5000),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  SlidePageRoute(
                    page: SearchDetailsView(
                      treatmentName: widget.treatmentName,
                      packageId: watch.packageId,
                    ),
                    direction: SlideDirection.left,
                    delay: const Duration(milliseconds: 5000),
                  ),
                );
              }
            },
          ),
        ),
        content: watch.isLoading
            ? Builder(builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 200.h,
                    ),
                    const Loader(),
                  ],
                );
              })
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 28.h,
                  ),
                  Center(
                    child: Text('Package Details',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            fontWeight: FontWeight.w700,
                            fontSize: 29.sp,
                            color: kDefaultActiveColor,
                            letterSpacing: -1)),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color(0xffFBFBFB),
                    shadowColor: Colors.black,
                    // elevation: 2
                    margin: EdgeInsets.only(
                      left: 18,
                      right: 18.w,
                    ),
                    // width: 394.w,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 18, right: 14.w, bottom: 15.w, top: 18.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    watch.purchaseDetails?.packageName ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Campton',
                                        fontSize: 16.sp,
                                        letterSpacing: -1),
                                  ),
                                ),
                                watch.purchaseDetails?.verified != 'no'
                                    ? Image.asset(
                                        'assets/images/Group 9.png',
                                        width: 70.w,
                                        height: 25.h,
                                      )
                                    : Container()
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/mdi_location.svg'),
                                    // SizedBox(

                                    //   width: 2.w,
                                    // ),
                                    Text(
                                      watch.purchaseDetails?.cityName ?? '',
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.italic,
                                          letterSpacing: -1),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 25.w,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/material-symbols_avg_time.svg'),
                                      // SizedBox(

                                      //   width: 2.w,
                                      // ),
                                      Text(
                                        "Treatment Periods-${watch.purchaseDetails?.treatmentPeriodInDays} Days",
                                        style: TextStyle(
                                            fontFamily: 'Campton',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic,
                                            letterSpacing: -1),
                                      ),
                                      watch.purchaseDetails?.featuredStatus !=
                                              'pending'
                                          ? Container(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  top: 4,
                                                  right: 8.w,
                                                  bottom: 4),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.yellow),
                                              child: Text(
                                                "Featured",
                                                // "Nivea",featured
                                                style: TextStyle(
                                                    // decoration:
                                                    // TextDecoration.underline,
                                                    // letterSpacing: 3.5,
                                                    color: black,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.w),
                                      child: Text(
                                        'Package Included',
                                        style: TextStyle(
                                            fontFamily: 'Campton',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                            color: kDefaultActiveColor),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            watch.otherServices?.length ?? 0,
                                        itemBuilder: (BuildContext, index) {
                                          final element =
                                              watch.otherServices?[index];
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 5.w),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/katman_1.png',
                                                  height: 7.h,
                                                  width: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  " ${element?.title}",
                                                  // watch.purchaseDetails
                                                  //         ?.otherServices?[index] ??
                                                  //     '',
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: -0.5,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Treatment Price :",
                                  // watch.purchaseDetails
                                  //         ?.otherServices?[index] ??
                                  //     '',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.5,
                                      color: Colors.black),
                                ),
                                Text(
                                  " ${watch.purchaseDetails?.treatmentDiscountPrices ?? ''} ₺ (${watch.purchaseDetails?.treatmentPrice} ₺)",
                                  // watch.purchaseDetails
                                  //         ?.otherServices?[index] ??
                                  //     '',
                                  style: TextStyle(
                                      // fontFamily: 'Campton',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.5,
                                      color: Colors.black),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Assuming `read` is your instance of `YourController`
                      read.deselectAllAddOnServices(context);
                      Utils.showPrimarySnackbar(
                          context, "All items have been deleted",
                          type: SnackType.info);
                    },
                    child: Center(
                      child: Text(
                        "Delete All Items",
                        // watch.purchaseDetails
                        //         ?.otherServices?[index] ??
                        //     '',
                        style: TextStyle(
                            // fontFamily: 'Campton',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: watch.otherServices?.length ?? 0,
                      itemBuilder: (context, index) {
                        final element = watch.otherServices?[index];
                        Color priceTextColor = Colors.black;

                        if (!watch.selectAddonServicesList[index]) {
                          priceTextColor = const Color(0xffF31D1D);
                        }
                        return Container(
                          margin: EdgeInsets.only(
                            left: 18,
                            right: 18.w,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                                child: SvgPicture.asset(
                                    'assets/icons/Group_5.svg'),
                              ),
                              GestureDetector(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  shadowColor: const Color(0xffFBFBFB),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 14.w, top: 15.w, bottom: 14.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10.w),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${element?.title}",
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        letterSpacing: -1),
                                                  ),
                                                  element?.title !=
                                                          'Accommodation'
                                                      ? Container()
                                                      : Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 5.w),
                                                          child: Text(
                                                            'Guest',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Campton',
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    kDefaultActiveColor),
                                                          ),
                                                        ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  element?.title !=
                                                          'Accommodation'
                                                      ? Container()
                                                      : Container(
                                                          width: 100.h,
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xffF5F5F5),
                                                                ),
                                                                // color: Colors
                                                                //     .yellow,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right: 14
                                                                            .w),
                                                                child:
                                                                    ExpansionTile(
                                                                  controller: watch
                                                                      .principleOutExpansionTileController,
                                                                  title: Text(
                                                                    "  ${watch.disSubCode ?? "1"}",
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: const Color(
                                                                            0xff413185),
                                                                        fontSize:
                                                                            14.sp,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  trailing: watch
                                                                          .isExpanded
                                                                      ? const Icon(
                                                                          Icons
                                                                              .arrow_drop_up)
                                                                      : const Icon(
                                                                          Icons
                                                                              .arrow_drop_down),
                                                                  onExpansionChanged:
                                                                      (isExpanded) {
                                                                    watch.toggleExpansion(
                                                                        isExpanded);
                                                                  },
                                                                  children: <Widget>[
                                                                    Container(
                                                                      // color: Colors
                                                                      //     .green,
                                                                      height:
                                                                          50.h,
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      child: ListView
                                                                          .builder(
                                                                        physics:
                                                                            const BouncingScrollPhysics(),
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          bottom:
                                                                              10.w,
                                                                        ),
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount:
                                                                            watch.numbersdata?.length ??
                                                                                0,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          final element =
                                                                              watch.numbersdata?[index];
                                                                          return Column(
                                                                            children: [
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  watch.selectsubCode(context, element?.id.toString() ?? '');
                                                                                  read.getPaymentDetailsList(context, widget.packageId, widget.purchaseType, watch.disSubCode);
                                                                                  read.getDisscountamount(context);
                                                                                },
                                                                                child: Container(
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "${element?.id}",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Campton',
                                                                                        fontSize: 20.sp,
                                                                                        fontWeight: FontWeight.w400,
                                                                                        letterSpacing: -1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5.h,
                                                                              )
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5.w),
                                              child: Row(
                                                children: [
                                                  if (!watch
                                                          .selectAddonServicesList[
                                                      index])
                                                    Text(
                                                      "-",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16.sp,
                                                        fontFamily: 'Campton',
                                                        color: priceTextColor,
                                                        letterSpacing: -1,
                                                      ),
                                                    ),
                                                  // SizedBox(
                                                  //   width: 5.w,
                                                  // ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text:
                                                            "${(element?.pricepercetage) ?? ''}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16.sp,
                                                          fontFamily: 'Campton',
                                                          color: priceTextColor,
                                                          letterSpacing: -1,
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                              text: " ₺",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                textStyle:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      16.sp,
                                                                  color:
                                                                      priceTextColor,
                                                                  letterSpacing:
                                                                      -1,
                                                                ),
                                                              ))
                                                        ]),
                                                  ),

                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text:
                                                            "*( ${element?.price}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13.sp,
                                                          fontFamily: 'Campton',
                                                          color: priceTextColor,
                                                          letterSpacing: -1,
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: ' ₺ )',
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle:
                                                                  TextStyle(
                                                                      color:
                                                                          priceTextColor,
                                                                      // letterSpacing: .5,
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        PrimaryCheckBox(
                                          color: Colors.red,
                                          size: 22.w,
                                          onChanged: (value) {
                                            print("object");
                                            read.onAddOnOtherServicesSelected(
                                              index,
                                              element?.id,
                                              element?.pricepercetage,
                                              element?.title,
                                              context,
                                            );
                                          },
                                          value: watch
                                              .selectAddonServicesList[index],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 34.w, top: 23.w, bottom: 26.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  fontFamily: 'Campton',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -1),
                              children: [
                                TextSpan(
                                    text: 'Price\n',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kDefaultActiveColor)),
                                WidgetSpan(
                                  child: Stack(
                                    children: [
                                      // Your other content here
                                      if ((double.tryParse(watch.salePrice) ??
                                              0) <
                                          (double.tryParse(watch.purchaseDetails
                                                      ?.packagePrice ??
                                                  '0') ??
                                              0))
                                        Positioned.fill(
                                          child: CustomPaint(
                                            painter: SlantedLinePainter(
                                                color: Colors.red),
                                          ),
                                        ),
                                      if ((double.tryParse(watch.salePrice) ??
                                              0) <
                                          (double.tryParse(watch.purchaseDetails
                                                      ?.packagePrice ??
                                                  '0') ??
                                              0))
                                        // Text(
                                        //   '${watch.purchaseDetails?.packagePrice ?? ''} ₺',
                                        // style: TextStyle(
                                        //   fontFamily: 'Campton',
                                        //   color: Colors.black,
                                        //   fontSize: 17.sp,
                                        //   letterSpacing: -1,
                                        //   fontWeight: FontWeight.w600,
                                        //   decoration: TextDecoration
                                        //       .none, // Remove default line-through
                                        // ),
                                        // ),
                                        RichText(
                                          text: TextSpan(
                                              text:
                                                  "${watch.purchaseDetails?.packagePrice ?? ''} ",
                                              style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                fontSize: 17.sp,
                                                letterSpacing: -1,
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration
                                                    .none, // Remove default line-through
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: ' ₺',
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Colors.black,
                                                      fontSize: 17.sp,
                                                      letterSpacing: -1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                    ],
                                  ),
                                ),
                                // TextSpan(
                                //     text: '${watch.salePrice} ₺',
                                // style: TextStyle(
                                //     fontFamily: 'Campton',
                                //     fontSize: 19.sp,
                                //     fontWeight: FontWeight.w700,
                                //     color: Colors.black)
                                // )
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "${watch.salePrice}",
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                  text: '₺',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                        ),
                        // Text("${watch.salePrice} ₺",
                        //     style: TextStyle(
                        //         fontFamily: 'Campton',
                        //         fontSize: 22.sp,
                        //         fontWeight: FontWeight.w700,
                        //         color: Colors.black))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 34.w, bottom: 26.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Your Payment Plan',
                          style: TextStyle(
                            fontFamily: 'Campton',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                            color: kDefaultActiveColor,
                            fontSize: 19.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: watch.discounts?.length ?? 0,
                            itemBuilder: (context, index) {
                              final element = watch.discounts?[index];
                              print(watch.radioValue[0]);
                              return Container(
                                margin: EdgeInsets.only(bottom: 10.w),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    PrimaryCheckBox(
                                      value: watch.radioValue[index],
                                      groupValue: watch.radioGrpValue,
                                      onChanged: (value) {
                                        read.onRadioBtnChanged(
                                            value, element?.id, element?.price);
                                      },
                                    ),
                                    Text(
                                      "${element?.percentage}% ",
                                      style: TextStyle(
                                        fontFamily: 'Campton',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -1,
                                        color: Colors.black,
                                        fontSize: 19.sp,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "(${element?.price}",
                                          style: TextStyle(
                                            fontFamily: 'Campton',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -1,
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' ₺)',
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  //  fontFamily: 'Campton',
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: -1,
                                                  color: Colors.black,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    // Text(
                                    //   "(${element?.price}₺)",
                                    // style: TextStyle(
                                    //   fontFamily: 'Campton',
                                    //   fontWeight: FontWeight.w700,
                                    //   letterSpacing: -1,
                                    //   color: Colors.black,
                                    //   fontSize: 14.sp,
                                    // ),
                                    // ),
                                    element?.minimumDiscount ==
                                            "Min.Requirement"
                                        ? Text(
                                            " ${element?.minimumDiscount}",
                                            style: TextStyle(
                                              fontFamily: 'Campton',
                                              fontWeight: FontWeight.w700,
                                              // letterSpacing: -1,
                                              color: Colors.red,
                                              fontSize: 14.sp,
                                            ),
                                          )
                                        : Text(
                                            " ${element?.minimumDiscount}",
                                            style: TextStyle(
                                              fontFamily: 'Campton',
                                              fontWeight: FontWeight.w700,
                                              // letterSpacing: -1,
                                              color: kDefaultActiveColor,
                                              fontSize: 14.sp,
                                            ),
                                          )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 34.w,
                      // top: 10.w,
                    ),
                    child: Text(
                      'Pay Via',
                      style: TextStyle(
                          fontFamily: 'Campton',
                          fontSize: 19.sp,
                          color: kDefaultActiveColor,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(
                                "111111111111111111111${widget.patientID.toString()}");
                            print(watch.packageId.toString());
                            print(
                              watch.selectedPrice,
                            );
                            print(watch.selectedPercetage);
                            print(watch.salePrice);
                            print("objecteeeeeeeeeeeeeeeeeeeeeeeeee");
                            print(
                              watch.selectedNames, // Pass the list here
                            );
                            print(
                              watch.selectedPrices, // Pass the list here
                            );
                            // return;
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: PaymentView(
                                  purchaseType: widget.purchaseType,
                                  patientID: widget.patientID.toString(),
                                  packageId: watch.packageId.toString(),
                                  percetagePrise: watch.selectedPrice,
                                  percetage: watch.selectedPercetage,
                                  price: watch.salePrice,
                                  selectedNames: watch.selectedNames,
                                  paymentType: 'card',
                                ),
                                direction: SlideDirection
                                    .right, // Specify the slide direction here
                                delay: const Duration(milliseconds: 5000),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/icons/Group_9.svg',
                            height: 92.h,
                            width: 394.w,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // return;
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: BankTransferView(
                                  packageName:
                                      watch.purchaseDetails?.packageName ?? '',
                                  purchaseType: widget.purchaseType,
                                  patientID: widget.patientID.toString(),
                                  packageId: watch.packageId.toString(),
                                  percetagePrise: watch.selectedPrice,
                                  percetage: watch.selectedPercetage,
                                  price: watch.salePrice,
                                  selectedNames: watch.selectedNames,
                                  paymentType: 'bank',

                                  // packageName: widget.packageName,
                                  // purchaseType: widget.purchaseType,
                                  // patientID: widget.patientID.toString(),
                                  // packageId: watch.packageId.toString(),
                                  // percetagePrise: watch.selectedPrice,
                                  // percetage: watch.selectedPercetage,
                                  // price: watch.salePrice,
                                  // selectedNames: watch.selectedNames,
                                ),
                                direction: SlideDirection
                                    .right, // Specify the slide direction here
                                delay: const Duration(milliseconds: 5000),
                              ),
                              // MaterialPageRoute(
                              //     builder: (context) => BankTransferView())
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/icons/Group_7.svg',
                            height: 92.h,
                            width: 394.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 100.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: MyWalletScreenViewPay(
                                    paymentType: "wallet",
                                    purchaseType: widget.purchaseType,
                                    patientID: widget.patientID.toString(),
                                    packageId: watch.packageId.toString(),
                                    percetagePrise: watch.selectedPrice,
                                    percetage: watch.selectedPercetage,
                                    price: watch.salePrice,
                                    selectedNames: watch.selectedNames,
                                  ),
                                  direction: SlideDirection
                                      .right, // Specify the slide direction here
                                  delay: const Duration(milliseconds: 5000),
                                ),
                                // MaterialPageRoute(
                                //     builder: (context) => BankTransferView())
                              );

                              // _showDialog();
                            },
                            child: SvgPicture.asset(
                              'assets/icons/Group_8.svg',
                              height: 92.h,
                              width: 394.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
  }
}
