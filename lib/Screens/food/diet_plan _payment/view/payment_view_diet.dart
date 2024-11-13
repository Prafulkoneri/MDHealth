import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/food/card_diet/view/card_diet_view.dart';
import 'package:md_health/Screens/food/dietBank/view/bank_transfer.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/controller/diet_plan_controller.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/view/food_address_list.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/Screens/food/diet_wallet/view/diet_wallet.dart';
import 'package:md_health/Screens/order_details/view/order_detail_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/form_popup_widget.dart';
import 'package:md_health/widget/loader.dart';
import 'package:provider/provider.dart';

import 'add_food_address.dart';

class PaymentDetailsViewDiet extends StatefulWidget {
  final String? foodPackageId;
  final String? subscriptionStartDate;
  final String? subscriptionType;
  final String? type;
  final String? patientId;
  final String? salePrice;
  final String? selectedMeals;
  final String? screenName;
  final String? orderId;
  const PaymentDetailsViewDiet({
    super.key,
    this.foodPackageId,
    this.subscriptionStartDate,
    this.subscriptionType,
    this.type,
    this.patientId,
    this.salePrice,
    this.selectedMeals,
    this.screenName,
    this.orderId,
  });

  @override
  State<PaymentDetailsViewDiet> createState() => _PaymentDetailsViewDietState();
}

class _PaymentDetailsViewDietState extends State<PaymentDetailsViewDiet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation _animation;

  // var serviceInfo;

  @override
  void initState() {
    super.initState();
    // print(widget.packageId);
    print('************ ${widget.patientId}');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DietPlanPaymertController>().initState(
            context,
            widget.foodPackageId,
            widget.subscriptionStartDate,
            widget.subscriptionType,
            widget.type,
            widget.patientId,
            widget.salePrice,
          );
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
    final read = context.read<DietPlanPaymertController>();
    final watch = context.watch<DietPlanPaymertController>();

    return BaseScreen(
        onWillPop: () async {
          widget.screenName != "renewPopUp"
              ? Navigator.pushReplacement(
                  context,
                  SlidePageRoute(
                    page: DietPlanResult(
                      calories: '',
                      food: widget.foodPackageId,
                      subscriptionType: widget.subscriptionType,
                    ),
                    direction: SlideDirection.left,
                    delay: Duration(milliseconds: 5000),
                  ),
                )
              : Navigator.pushReplacement(
                  context,
                  SlidePageRoute(
                    page: FoodOrderDetailsOrderView(
                      foodOrderID: widget.orderId,
                    ),
                    direction: SlideDirection.left,
                    delay: Duration(milliseconds: 5000),
                  ),
                );

          return false;
        },
        backgroundColor: const Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: CustomAppBar(
            hasMdTitle: false,
            hasBackButton: true,
            onBackPressed: () {
              // Navigator.pushReplacement(
              //   context,
              //   SlidePageRoute(
              //     page: DietPlanResult(
              //       calories: '', food: widget.foodPackageId,
              //       subscriptionType: widget.subscriptionType,
              //       // packageId: watch.packageId,
              //       // screenName: "infotmation",
              //       // packageId: watch.packageId,
              //     ),
              //     direction:
              //         SlideDirection.left, // Specify the slide direction here
              //     delay: Duration(milliseconds: 5000),
              //   ),
              //   // MaterialPageRoute(
              //   //     builder: (context) => InformationFormView
              //   //             // SearchDetailsView
              //   //             (
              //   //           packageId: watch.packageId,
              //   //           screenName: "infotmation",
              //   //           // packageId: watch.packageId,
              //   //         ))
              // );
              widget.screenName != "renewPopUp"
                  ? Navigator.pushReplacement(
                      context,
                      SlidePageRoute(
                        page: DietPlanResult(
                          calories: '',
                          food: widget.foodPackageId,
                          subscriptionType: widget.subscriptionType,
                        ),
                        direction: SlideDirection.left,
                        delay: Duration(milliseconds: 5000),
                      ),
                    )
                  : Navigator.pushReplacement(
                      context,
                      SlidePageRoute(
                        page: FoodOrderDetailsOrderView(
                          foodOrderID: widget.orderId,
                        ),
                        direction: SlideDirection.left,
                        delay: Duration(milliseconds: 5000),
                      ),
                    );
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
                    child: Text('Payment Details',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            fontWeight: FontWeight.w700,
                            fontSize: 29.sp,
                            color: kDefaultActiveColor,
                            letterSpacing: -1)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.pushReplacement(
                  //         context,
                  //         SlidePageRoute(
                  //           page: DietPlanView(
                  //               // packageId: watch.packageId,
                  //               // screenName: "infotmation",
                  //               // packageId: watch.packageId,
                  //               ),
                  //           direction: SlideDirection
                  //               .left, // Specify the slide direction here
                  //           delay: Duration(milliseconds: 5000),
                  //         ),
                  //       );
                  //     },
                  //     child: Text('Clear the Cart',
                  //         style: TextStyle(
                  //             decoration: TextDecoration.underline,
                  //             fontFamily: 'Campton',
                  //             fontWeight: FontWeight.w700,
                  //             fontSize: 16.sp,
                  //             color: Colors.red,
                  //             letterSpacing: -1)),
                  //   ),
                  // ),
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
                      padding:
                          EdgeInsets.only(left: 18, right: 14.w, top: 18.w),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                watch.dietPaymentdetailsdata?.packageName ?? "",
                                // "watch.?.packageName ?? '',",plo
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Campton',
                                    fontSize: 16.sp,
                                    letterSpacing: -1),
                              ),
                            ),
                            Container(
                              child: Row(children: [
                                // element?.verified == "yes"
                                //                       ?
                                Image(
                                  image: AssetImage(
                                    "assets/images/new_group.png",
                                  ),
                                  width: 75.w,
                                  // height: 60.h,
                                )
                                // : Container()
                                // SvgPicture.asset(
                                //   'assets/icons/Group_4.svg',
                                //   height: 22.h,
                                //   width: 22.w,
                                // ),
                                // RichText(
                                //     text: TextSpan(
                                //         style: TextStyle(
                                //             fontFamily: 'Campton',
                                //             fontWeight: FontWeight.w400,
                                //             fontSize: 12.sp,
                                //             letterSpacing: -1,
                                //             color: Colors.black),
                                //         children: const [
                                //       TextSpan(text: 'Verified by\n'),
                                //       TextSpan(
                                //           text: 'MD',
                                //           style:
                                //               TextStyle(fontWeight: FontWeight.w700)),
                                //       TextSpan(text: 'health')
                                //     ]))
                              ]),
                            )
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/mdi_location.svg'),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  watch.dietPaymentdetailsdata?.cityName ?? "",
                                  // "      watch.purchaseDetails?.cityName ?? ''",
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
                              height: 5.w,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/Vector (9).svg'),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  watch.dietPaymentdetailsdata
                                          ?.subscriptionType ??
                                      "",
                                  // "      watch.purchaseDetails?.cityName ?? ''",
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                      letterSpacing: -1),
                                )
                              ],
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
                                    itemCount: watch.dietPaymentdetailsdata
                                            ?.mealTypes?.length ??
                                        0,
                                    itemBuilder: (BuildContext, index) {
                                      final element = watch
                                          .dietPaymentdetailsdata
                                          ?.mealTypes?[index];
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 5.w),
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
                                              "${element}",
                                              // " {element?.title}",
                                              // watch.purchaseDetails
                                              //         ?.otherServices?[index] ??
                                              //     '',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
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
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 18,
                      right: 18.w,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                          child: SvgPicture.asset('assets/icons/Group_5.svg'),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.w),
                                    child: Text(
                                      "Subscripton Type",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -1),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Text(
                                      watch.dietPaymentdetailsdata
                                              ?.subscriptionType ??
                                          "",
                                      // 'Per Night Price',
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: kDefaultActiveColor),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Start Date",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                            fontFamily: 'Campton',
                                            color: black,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 5.w,
                                        // ),
                                        Text(
                                          "End Date",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                            fontFamily: 'Campton',
                                            color: black,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          watch.dietPaymentdetailsdata
                                                  ?.subscriptionStartDate ??
                                              'Date',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            fontFamily: 'Campton',
                                            color: black,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 5.w,
                                        // ),
                                        Text(
                                          watch.dietPaymentdetailsdata
                                                  ?.subscriptionEndDate ??
                                              '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            fontFamily: 'Campton',
                                            color: black,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 18,
                      right: 18.w,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                          child: SvgPicture.asset('assets/icons/Group_5.svg'),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 5.w, right: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Address",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -1),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // showStepOneDialog();

                                            Navigator.push(
                                              context,
                                              SlidePageRoute(
                                                page: FoodSelectAddressView(
                                                  salePrice: widget.salePrice,
                                                  type: widget.type,
                                                  subscriptionType:
                                                      widget.subscriptionType,
                                                  //     .whoPurhasedata
                                                  //     ?.subscriptionType?[
                                                  // watch.selectedTextIndextype],
                                                  subscriptionStartDate: widget
                                                      .subscriptionStartDate,
                                                  foodPackageId:
                                                      watch.foodpackageId,
                                                ),
                                                direction: SlideDirection.right,
                                                delay: Duration(
                                                    milliseconds: 5000),
                                              ),
                                              // MaterialPageRoute(
                                              //     builder: (context) => ProfileView()
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/change.svg'),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "Change Address",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontFamily: 'Campton',
                                                    color: Colors.red,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: -1),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Text(
                                      '${watch.customerList?.firstName}',
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: kDefaultActiveColor),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Text(
                                          '${watch.customerList?.address}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
                                            fontFamily: 'Campton',
                                            color: black,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: Text(
                                          watch.customerList?.postalCode ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
                                            fontFamily: 'Campton',
                                            color: black,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Country  : ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp,
                                              fontFamily: 'Campton',
                                              color: black,
                                              letterSpacing: -1,
                                            ),
                                          ),
                                          Text(
                                            '${watch.customerList?.countryName}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              fontFamily: 'Campton',
                                              color: black,
                                              letterSpacing: -1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 10.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              'City  : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.sp,
                                                fontFamily: 'Campton',
                                                color: black,
                                                letterSpacing: -1,
                                              ),
                                            ),
                                            Text(
                                              '${watch.customerList?.cityName}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                                fontFamily: 'Campton',
                                                color: black,
                                                letterSpacing: -1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
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
                                    text: 'Service Price\n',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kDefaultActiveColor)),
                                WidgetSpan(
                                    child: Container(
                                  child: watch.dietPaymentdetailsdata
                                                  ?.packagePrice !=
                                              null &&
                                          watch.dietPaymentdetailsdata
                                                  ?.salesPrice !=
                                              null &&
                                          double.tryParse(watch
                                                  .dietPaymentdetailsdata!
                                                  .packagePrice!)! >
                                              double.tryParse(watch
                                                  .dietPaymentdetailsdata!
                                                  .salesPrice!)!
                                      ? Row(
                                          children: [
                                            Stack(
                                              children: [
                                                // Your other content here
                                                Positioned.fill(
                                                  child: CustomPaint(
                                                    painter: SlantedLinePainter(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                                // Text(
                                                //   '${watch.dietPaymentdetailsdata?.packagePrice ?? ''} ₺',
                                                //   style: TextStyle(
                                                // fontFamily: 'Campton',
                                                // color: Colors.black,
                                                // fontSize: 17.sp,
                                                // letterSpacing: -1,
                                                // fontWeight: FontWeight.w600,
                                                // decoration: TextDecoration.none,
                                                //   ),
                                                // ),
                                                RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "${watch.dietPaymentdetailsdata?.packagePrice ?? ''}",
                                                      style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 17.sp,
                                                        letterSpacing: -1,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: ' ₺',
                                                          style:
                                                              GoogleFonts.inter(
                                                            textStyle:
                                                                TextStyle(
                                                              // fontFamily: 'Campton',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17.sp,
                                                              letterSpacing: -1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              // discount percentage
                                              '  ( ${watch.dietPaymentdetailsdata?.discountPrice ?? ''} % Discount )',
                                              // "",
                                              style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: kDefaultActiveColor,
                                                fontSize: 17.sp,
                                                letterSpacing: -1,
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                )),
                              ]),
                        ),
                        // Text('${watch.dietPaymentdetailsdata?.salesPrice ?? ''} ₺',
                        //     style: TextStyle(
                        // fontFamily: 'Campton',
                        // fontSize: 22.sp,
                        // fontWeight: FontWeight.w700,
                        // color: Colors.black))
                        RichText(
                          text: TextSpan(
                              text:
                                  "${watch.dietPaymentdetailsdata?.salesPrice ?? ''}",
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                  text: ' ₺',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontFamily: 'Campton',
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
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
                            // print(
                            //     "111111111111111111111${widget.patientID.toString()}");
                            // print(watch.packageId.toString());
                            // print(
                            //   watch.selectedPrice,
                            // );
                            // print(watch.selectedPercetage);
                            // print(watch.salePrice);
                            // print("objecteeeeeeeeeeeeeeeeeeeeeeeeee");
                            // print(
                            //   watch.selectedNames, // Pass the list here
                            // );
                            // print(
                            //   watch.selectedPrices, // Pass the list here
                            // );
                            print(watch
                                .dietPaymentdetailsdata?.subscriptionStartDate);
                            print(watch.foodpackageId);
                            print(
                                watch.dietPaymentdetailsdata?.subscriptionType);
                            print("object");
                            print(watch.foodpackageId);
                            print("object");
                            // return;
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: CardDietPaymentView(
                                  daysInWords:
                                      watch.dietPaymentdetailsdata?.daysInWords,
                                  subscriptionType: watch
                                      .dietPaymentdetailsdata?.subscriptionType,
                                  type: widget.type,
                                  subscriptionStartDate: watch
                                      .dietPaymentdetailsdata
                                      ?.subscriptionStartDate,
                                  subscriptionEndDate: watch
                                      .dietPaymentdetailsdata
                                      ?.subscriptionEndDate,
                                  patientId: widget.patientId,
                                  platformType: "android",
                                  paymentMethod: "Card",
                                  foodPackageSalePrice:
                                      watch.dietPaymentdetailsdata?.salesPrice,
                                  foodPackageName:
                                      watch.dietPaymentdetailsdata?.packageName,
                                  foodPackageId: watch.foodpackageId,
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
                                delay: Duration(milliseconds: 5000),
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
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: DietBankTransferView(
                                  // subscriptionType: watch.subscriptionType,
                                  // type: watch.type,
                                  // subscriptionStartDate: watch
                                  //     .dietPaymentdetailsdata?.subscriptionStartDate,
                                  // subscriptionEndDate: watch
                                  //     .dietPaymentdetailsdata?.subscriptionEndDate,
                                  // platformType: "android",
                                  // paymentMethod: "bank",
                                  // foodPackageSalePrice:
                                  //     watch.dietPaymentdetailsdata?.salesPrice,
                                  // foodPackageName:
                                  //     watch.dietPaymentdetailsdata?.packageName,
                                  // foodPackageId: watch.foodpackageId,
                                  daysInWords:
                                      watch.dietPaymentdetailsdata?.daysInWords,
                                  subscriptionType: watch
                                      .dietPaymentdetailsdata?.subscriptionType,
                                  type: widget.type,
                                  subscriptionStartDate: watch
                                      .dietPaymentdetailsdata
                                      ?.subscriptionStartDate,
                                  subscriptionEndDate: watch
                                      .dietPaymentdetailsdata
                                      ?.subscriptionEndDate,
                                  platformType: "android",
                                  paymentMethod: "bank",
                                  foodPackageSalePrice:
                                      watch.dietPaymentdetailsdata?.salesPrice,
                                  foodPackageName:
                                      watch.dietPaymentdetailsdata?.packageName,
                                  foodPackageId: watch.foodpackageId,
                                  patientID: widget.patientId,
                                ),
                                direction: SlideDirection
                                    .right, // Specify the slide direction here
                                delay: Duration(milliseconds: 5000),
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
                                  page: DietMyWalletScreenView(
                                    daysInWords: watch
                                        .dietPaymentdetailsdata?.daysInWords,
                                    subscriptionType: watch.subscriptionType,
                                    type: watch.type,
                                    subscriptionStartDate: watch
                                        .dietPaymentdetailsdata
                                        ?.subscriptionStartDate,
                                    subscriptionEndDate: watch
                                        .dietPaymentdetailsdata
                                        ?.subscriptionEndDate,
                                    patientId: widget.patientId,
                                    platformType: "android",
                                    paymentMethod: "md_coin",
                                    foodPackageSalePrice: watch
                                        .dietPaymentdetailsdata?.salesPrice,
                                    foodPackageName: watch
                                        .dietPaymentdetailsdata?.packageName,
                                    foodPackageId: watch.foodpackageId,
                                    // paymentType: "wallet",
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
                                  delay: Duration(milliseconds: 5000),
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
