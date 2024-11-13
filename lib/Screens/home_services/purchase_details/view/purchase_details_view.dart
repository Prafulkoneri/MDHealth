import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/Screens/home_services/hs_other_form/view/other_form_view.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/bank_payment_view.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/card_payment-view.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/wallet_payment_view.dart';
import 'package:md_health/Screens/home_services/purchase_details/controller/hs_purchase_details_controller.dart';
import 'package:md_health/Screens/home_services/search_details/view/search_details_hs.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/form_popup_widget.dart';
import 'package:provider/provider.dart';

class HSPurchaseDetailsView extends StatefulWidget {
  final String? packageId;
  final String? servicesDate;
  final String? packageName;
  final String? index;
  final String? screenName;
  final String? price;
  final String? paymentType;
  final String? patientID;
  final String? purchaseType;

  final bool? refreshPage;
  const HSPurchaseDetailsView(
      {super.key,
      required this.packageId,
      this.index,
      this.servicesDate,
      // this.id,
      this.price,
      this.refreshPage,
      this.paymentType,
      this.screenName,
      this.patientID,
      required this.purchaseType,
      this.packageName});

  @override
  State<HSPurchaseDetailsView> createState() => _HSPurchaseDetailsViewState();
}

class _HSPurchaseDetailsViewState extends State<HSPurchaseDetailsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation _animation;

  // var serviceInfo;

  @override
  void initState() {
    super.initState();
    print(widget.packageId);

    print('***********************************************************');
    print(widget.servicesDate);
    print('***********************************************************');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<HsPaymentDetailsController>()
          .initState(context, widget.packageId, widget.purchaseType);
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

  DateTimeRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    final read = context.read<HsPaymentDetailsController>();
    final watch = context.watch<HsPaymentDetailsController>();
    // Get current date
    // DateTime now = DateTime.now();
    // Define start and end dates
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now();

    // Format dates
    String formattedStartDate = DateFormat('dd-MM-yyyy').format(startDate);
    String formattedEndDate = DateFormat('dd-MM-yyyy').format(endDate);

    // // Format date
    // String formattedDate = selectedDateRange != null
    //     ? '${selectedDateRange!.start.day}/${selectedDateRange!.start.month}/${selectedDateRange!.start.year}'
    //     : 'Select a date';
    return BaseScreen(
        onWillPop: () async {
          widget.screenName == "infotmation"
              ? Navigator.pushReplacement(
                  context,
                  SlidePageRoute(
                    page: HSotherFormView(
                      selectedDate: widget.servicesDate,
                      packageId: watch.packageId,
                      screenName: "infotmation",
                      // packageId: watch.packageId,
                    ),
                    direction:
                        SlideDirection.left, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                  // MaterialPageRoute(
                  //     builder: (context) => InformationFormView
                  //             // SearchDetailsView
                  //             (
                  //           packageId: watch.packageId,
                  //           screenName: "infotmation",
                  //           // packageId: watch.packageId,
                  //         ))
                )
              : Navigator.pushReplacement(
                  context,
                  SlidePageRoute(
                    page: HomeServicesSearchDetails(
                      packageId: watch.packageId,
                      // purchaseType: widget.purchaseType,
                      treatmentDate: widget.servicesDate,
                      // packageId: watch.packageId,
                    ),
                    direction:
                        SlideDirection.left, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                  // MaterialPageRoute(
                  //     builder: (context) => SearchDetailsView(
                  //           packageId: watch.packageId,
                  //         ))
                );

          return false;
        },
        backgroundColor: const Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            hasMdTitle: false,
            hasBackButton: true,
            onBackPressed: () {
              widget.screenName == "infotmation"
                  ? Navigator.pushReplacement(
                      context,
                      SlidePageRoute(
                        page: HSotherFormView(
                          selectedDate: widget.servicesDate,
                          packageId: watch.packageId,
                          screenName: "infotmation",
                          // packageId: watch.packageId,
                        ),
                        direction: SlideDirection
                            .left, // Specify the slide direction here
                        delay: const Duration(milliseconds: 5000),
                      ),
                      // MaterialPageRoute(
                      //     builder: (context) => InformationFormView
                      //             // SearchDetailsView
                      //             (
                      //           packageId: watch.packageId,
                      //           screenName: "infotmation",
                      //           // packageId: watch.packageId,
                      //         ))
                    )
                  : Navigator.pushReplacement(
                      context,
                      SlidePageRoute(
                        page: HomeServicesSearchDetails(
                          packageId: watch.packageId,
                          treatmentDate: widget.servicesDate,
                          // packageId: watch.packageId,
                        ),
                        direction: SlideDirection
                            .left, // Specify the slide direction here
                        delay: const Duration(milliseconds: 5000),
                      ),
                      // MaterialPageRoute(
                      //     builder: (context) => SearchDetailsView(
                      //           packageId: watch.packageId,
                      //         ))
                    );
            },
          ),
        ),
        content:
            //  watch.isLoading
            //     ? Builder(builder: (context) {
            //         return Column(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           children: [
            //             SizedBox(
            //               height: 200.h,
            //             ),
            //             Loader(),
            //           ],
            //         );
            //       })
            //     :
            Column(
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
                padding: EdgeInsets.only(left: 18, right: 14.w, top: 18.w),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          watch.purchaseDetails?.packageName ?? ' ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Campton',
                              fontSize: 16.sp,
                              letterSpacing: -1),
                        ),
                      ),
                      Container(
                        child: Row(children: [
                          watch.purchaseDetails?.verified != "yes"
                              ? Image.asset(
                                  'assets/images/verifiedByHome.png',
                                  width: 70.w,
                                  height: 25.h,
                                )
                              : Container(),
                        ]),
                      )
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/mdi_location.svg'),
                          // SizedBox(

                          //   width: 2.w,
                          // ),
                          Text(
                            watch.purchaseDetails?.cityName ?? ' ',
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
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/icons/material-symbols_avg_time.svg'),
                          // SizedBox(

                          //   width: 2.w,
                          // ),
                          Text(
                            "Service Periods-${watch.purchaseDetails?.treatmentPeriodInDays ?? ''} Days",
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
                  widget.servicesDate == ''
                      ? GestureDetector(
                          onTap: () async {
                            DateTimeRange? pickedRange =
                                await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2090),
                              initialDateRange: selectedDateRange ??
                                  DateTimeRange(
                                    start: DateTime.now(),
                                    end: DateTime.now().add(Duration(days: 1)),
                                  ),
                            );

                            if (pickedRange != null) {
                              setState(() {
                                selectedDateRange = pickedRange;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Change Appointment Date",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SvgPicture.asset('assets/icons/change.svg'),
                                ],
                              ),
// Appointment Date
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Appointment Date : ',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    selectedDateRange == null
                                        ? ' $formattedStartDate $formattedEndDate'
                                        : '${DateFormat('dd-MM-yyyy').format(selectedDateRange!.start)} to ${DateFormat('dd-MM-yyyy').format(selectedDateRange!.end)}',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              // Text(
                              //   'Start Date: $formattedStartDate $formattedEndDate',
                              //   style: TextStyle(fontSize: 20),
                              // ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Change Appointment Date",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      DateTimeRange? pickedRange =
                                          await showDateRangePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2090),
                                        initialDateRange: selectedDateRange ??
                                            DateTimeRange(
                                              start: DateTime.now(),
                                              end: DateTime.now()
                                                  .add(Duration(days: 1)),
                                            ),
                                      );
                                      if (pickedRange != null) {
                                        setState(() {
                                          selectedDateRange = pickedRange;
                                        });
                                      }
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/change.svg')),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Appointment Date : ',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                Text(
                                  selectedDateRange == null
                                      ? "${widget.servicesDate}" // Display initial date if no range selected
                                      : "${DateFormat('dd-MM-yyyy').format(selectedDateRange!.start)} to ${DateFormat('dd-MM-yyyy').format(selectedDateRange!.end)}",
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
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
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: watch.otherServices?.length ?? 0,
                              itemBuilder: (BuildContext, index) {
                                final element = watch.otherServices?[index];
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
                                        " ${element?.title}",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Treatment Prices :',
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: kDefaultActiveColor),
                            ),
                            Text(
                              ' ${watch.purchaseDetails?.treatmentPrice}',
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              ' ₺',
                              style: TextStyle(
                                  // fontFamily: 'Campton',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ],
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
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: watch.otherServices?.length ?? 0,
                itemBuilder: (context, index) {
                  final element = watch.otherServices?[index];
                  Color priceTextColor = Colors.black; // Default color

                  // Check if the checkbox is unchecked, then set the text color to red
                  // if (!watch.selectAddonServicesList[index]) {
                  //   priceTextColor = Color(0xffF31D1D);
                  // }
                  return Container(
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10.w),
                                        child: Text(
                                          "${element?.title}",
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
                                          'Per Night Price',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              color: kDefaultActiveColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Row(
                                          children: [
                                            // if (!watch
                                            //         .selectAddonServicesList[
                                            //     index])
                                            // Text(
                                            //   "-",
                                            //   style: TextStyle(
                                            //     fontWeight: FontWeight.w700,
                                            //     fontSize: 16.sp,
                                            //     fontFamily: 'Campton',
                                            //     color: priceTextColor,
                                            //     letterSpacing: -1,
                                            //   ),
                                            // ),
                                            // SizedBox(
                                            //   width: 5.w,
                                            // ),
                                            RichText(
                                              text: TextSpan(
                                                  text:
                                                      "${(element?.pricePercentage) ?? ''}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Campton',
                                                    color: priceTextColor,
                                                    letterSpacing: -1,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                        text: " ₺",
                                                        style:
                                                            GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16.sp,
                                                            color:
                                                                priceTextColor,
                                                            letterSpacing: -1,
                                                          ),
                                                        ))
                                                  ]),
                                            ),
                                            // Row(
                                            //   children: [
                                            //     Text(
                                            // "${(element?.pricepercetage) ?? ''}",
                                            // style: TextStyle(
                                            //   fontWeight:
                                            //       FontWeight.w700,
                                            //   fontSize: 16.sp,
                                            //   fontFamily: 'Campton',
                                            //   color: priceTextColor,
                                            //   letterSpacing: -1,
                                            // ),
                                            //     ),
                                            //     Text(
                                            // " ₺",
                                            // textAlign:
                                            //     TextAlign.end,
                                            // style: TextStyle(
                                            //   fontWeight:
                                            //       FontWeight.w700,
                                            //   fontSize: 16.sp,
                                            //   // fontFamily: 'Campton',
                                            //   color: priceTextColor,
                                            //   letterSpacing: -1,
                                            // ),
                                            //     ),
                                            //   ],
                                            // ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "*( ${element?.price}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13.sp,
                                                    fontFamily: 'Campton',
                                                    color: priceTextColor,
                                                    letterSpacing: -1,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: ' ₺ )',
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            color: Colors.black,
                                                            // letterSpacing: .5,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            // Row(
                                            //   // crossAxisAlignment:
                                            //   //     CrossAxisAlignment
                                            //   //         .start,
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment
                                            //           .center,
                                            //   children: [
                                            //     Text(
                                            //       "*( ${element?.price} ",
                                            // style: TextStyle(
                                            //   fontWeight:
                                            //       FontWeight.w500,
                                            //   fontSize: 13.sp,
                                            //   fontFamily: 'Campton',
                                            //   color: priceTextColor,
                                            //   letterSpacing: -1,
                                            // ),
                                            //     ),
                                            //     Text(
                                            //       " ₺ )",
                                            // style: TextStyle(
                                            //   fontWeight:
                                            //       FontWeight.w500,
                                            //   fontSize: 13.sp,
                                            //   // fontFamily: 'Campton',
                                            //   color: priceTextColor,
                                            //   letterSpacing: -1,
                                            // ),
                                            //     ),
                                            //   ],
                                            // ),
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
                                        element?.pricePercentage,
                                        element?.title,
                                        context,
                                      );
                                    },
                                    value: watch.selectAddonServicesList[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 34.w, top: 23.w, bottom: 26.w),
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
                                if ((double.tryParse(
                                            watch.purchaseDetails?.salePrice ??
                                                '') ??
                                        0) <
                                    (double.tryParse(watch.purchaseDetails
                                                ?.packagePrice ??
                                            '0') ??
                                        0))
                                  Positioned.fill(
                                    child: CustomPaint(
                                      painter:
                                          SlantedLinePainter(color: Colors.red),
                                    ),
                                  ),
                                if ((double.tryParse(
                                            watch.purchaseDetails?.salePrice ??
                                                '') ??
                                        0) <
                                    (double.tryParse(watch.purchaseDetails
                                                ?.packagePrice ??
                                            '0') ??
                                        0))
                                  Text(
                                    '${watch.purchaseDetails?.packagePrice ?? ''} ₺',
                                    style: TextStyle(
                                      // fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration
                                          .none, // Remove default line-through
                                    ),
                                  ),
                                // RichText(
                                //   text: TextSpan(
                                //       text:
                                //           "${watch.purchaseDetails?.packagePrice ?? ''} ",
                                //       style: TextStyle(
                                //         fontFamily: 'Campton',
                                //         color: Colors.black,
                                //         fontSize: 17.sp,
                                //         letterSpacing: -1,
                                //         fontWeight: FontWeight.w600,
                                //         decoration: TextDecoration
                                //             .none, // Remove default line-through
                                //       ),
                                //       children: [
                                //         TextSpan(
                                //           text: ' ₺',
                                //           style: GoogleFonts.inter(
                                //             textStyle: TextStyle(
                                //               fontFamily: 'Campton',
                                //               color: Colors.black,
                                //               fontSize: 17.sp,
                                //               letterSpacing: -1,
                                //               fontWeight: FontWeight.w600,
                                //             ),
                                //           ),
                                //         ),
                                //       ]),
                                // ),
                              ],
                            ),
                          ),
                          TextSpan(
                            text:
                                "   ( ${watch.purchaseDetails?.packageDiscount ?? ''}% Discount )",
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: kDefaultActiveColor,
                              fontSize: 14.sp,
                              // letterSpacing: -1,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration
                                  .none, // Remove default line-through
                            ),
                          ),
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
                        // print(watch.radioValue[0]);
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
                              element?.minimumDiscount == "Min.Requirement"
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
                      // return;
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page: HSardPaymentView(
                            paymentType: 'card',
                            packageName:
                                watch.purchaseDetails?.packageName ?? '',
                            // purchaseType: widget.purchaseType,
                            // patientID: widget.patientID.toString(),
                            // packageId: watch.packageId.toString(),
                            // percetagePrise: watch.selectedPrice,
                            // percetage: watch.selectedPercetage,
                            // price: watch.salePrice,
                            // selectedNames: watch.selectedNames,
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
                      print(widget.purchaseType);
                      // print(widget.paymentType='Bank');

                      // return;
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page: HsBankTransferView(
                            paymentType: 'bank',
                            packageName:
                                watch.purchaseDetails?.packageName ?? '',
                            purchaseType: widget.purchaseType,
                            // patientID: widget.patientID.toString() ?? '',
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
                            page: HsMyWalletScreenView(
                              paymentType: "wallet",
                              packageName:
                                  watch.purchaseDetails?.packageName ?? '',
                              purchaseType: widget.purchaseType,
                              patientID: widget.patientID.toString(),
                              packageId: watch.packageId.toString(),
                              percetagePrise: watch.selectedPrice,
                              percetage: watch.selectedPercetage,
                              price: watch.salePrice,
                              selectedNames: watch.selectedNames,
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
/////////////////////////////////
//  Text(
//                     ' ${watch.now}',
//                     // 'Select Your Payment Plan',
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w700,
//                       // letterSpacing: -1,
//                       color: kDefaultActiveColor,
//                       fontSize: 19.sp,
//                     ),
//                   ),
// GestureDetector(
//   onTap: () async {
//     DateTimeRange? pickedRange = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2090),
//       initialDateRange: selectedDateRange ??
//           DateTimeRange(
//             start: DateTime.now(),
//             end: DateTime.now().add(Duration(days: 1)),
//           ),
//     );

//     if (pickedRange != null) {
//       setState(() {
//         selectedDateRange = pickedRange;
//       });
//     }
//   },
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         selectedDateRange == null
//             ? "*Select Date Range"
//             : "${selectedDateRange!.start.toLocal().toString().split(' ')[0]} to ${selectedDateRange!.end.toLocal().toString().split(' ')[0]}",
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       Icon(Icons.calendar_today_outlined,
//           color: Colors.green),
//     ],
//   ),
// ),
