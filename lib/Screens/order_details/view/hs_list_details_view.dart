import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/bank_payment_view.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/card_payment-view.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/wallet_payment_view.dart';
import 'package:md_health/Screens/order_details/controller/hs_details_controller.dart';
import 'package:md_health/Screens/order_details/view/hs_list_view.dart';
import 'package:md_health/Screens/order_details/view/submit_hs_review_pop_up.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HsOderDetailsOrderView extends StatefulWidget {
  final String? hsOrderId;
  final String? packageFor;
  const HsOderDetailsOrderView({super.key, this.hsOrderId, this.packageFor});

  @override
  State<HsOderDetailsOrderView> createState() => _HsOderDetailsOrderViewState();
}

class _HsOderDetailsOrderViewState extends State<HsOderDetailsOrderView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context.read<HsDetailsViewController>().initState(
            context,
            widget.hsOrderId,
            '',
            '',
          );
    });
  }

  Future<void> downloadFile(String url, String savePath) async {
    try {
      final response = await http.get(Uri.parse(url));
      final File file = File(savePath);
      await file.writeAsBytes(response.bodyBytes);
      print('File downloaded to: $savePath');
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  Widget build(BuildContext context) {
    final read = context.read<HsDetailsViewController>();
    final watch = context.watch<HsDetailsViewController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.push(
          context,
          SlidePageRoute(
            page: const HsOrderView(
                // packageId:MdShopView
                //     widget.packageId,
                ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: const Duration(milliseconds: 5000),
          ),
        );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: CustomAppBar(
          onBackPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: const HsOrderView(
                    // packageId:MdShopView
                    //     widget.packageId,
                    ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: const Duration(milliseconds: 5000),
              ),
            );
          },
          // hasHiText: true,
          hasBackButton: true,
          hasMdTitle: false,
          drawerTitle: "Order No : ${watch.hsDetailsviewdata?.orderId ?? '0'}",
          //  ${watch.hsOrderId.toString()}
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 25.w,
              top: 30.w,
            ),
            child: Text(
              '${watch.hsDetailsviewdata?.packageName ?? ''}',
              // 'Home Service Package',
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.black,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          //  padding: EdgeInsets.only(
          //       left: 18.w, top: 17.w, bottom: 9.h, right: 18.w),
          Container(
              margin: EdgeInsets.only(
                  left: 18.w, top: 17.w, bottom: 9.h, right: 18.w),
              padding: EdgeInsets.only(
                  left: 15.w, top: 5.w, bottom: 5.w, right: 8.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      // offset: Offset(2, 2),
                      blurRadius: 20,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image(
                      //   image: AssetImage("assets/images/product_Square.png"),
                      //   height: 50.h,
                      //   width: 50.w,
                      // ),
                      watch.hsDetailsviewdata?.providerLogo == ""
                          ? SizedBox(
                              height: 50.w,
                              width: 50.w,
                              child: Image.asset(
                                "assets/images/defaultimage.png",
                                fit: BoxFit.cover,
                              ),
                            )
                          : SizedBox(
                              height: 50.w,
                              width: 50.w,
                              child: AppNetworkImages(
                                imageUrl:
                                    "${watch.hsDetailsviewdata?.providerLogo}",
                                fit: BoxFit.cover,
                              ),
                            ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  watch.hsDetailsviewdata?.packageName ?? '',
                                  // 'Product Name',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Price :",
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Text(
                                //   '${watch.orderFoodDetails?.foodPackageTotalPrice ?? ""}',
                                //   style: TextStyle(
                                //       fontFamily: 'Campton',
                                //       color: Colors.black,
                                //       fontSize: 16.sp,
                                //       fontWeight: FontWeight.w600),
                                // ),
                                RichText(
                                  text: TextSpan(
                                    text: watch.hsDetailsviewdata?.salePrice ??
                                        '',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),

                                    /*defining default style is optional */
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '₺',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              // letterSpacing: .5,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/time.svg',
                                  alignment: Alignment.topRight,
                                ),
                                Text(
                                  "Treatment Periods-${watch.hsDetailsviewdata?.treatmentPeriodInDays ?? '0'} Days",
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: const Color(0xff212121),
                                      fontSize: 13.sp,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status: ',
                      style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 20.w, top: 5.w, bottom: 5.w, right: 18.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.w),
                        color: watch.hsDetailsviewdata?.purchaseType ==
                                "Pending"
                            ? const Color(0xffF3771D)
                            : watch.hsDetailsviewdata?.purchaseType ==
                                    "in_progress"
                                ? Colors.yellow
                                : watch.hsDetailsviewdata?.purchaseType ==
                                        "Completed"
                                    ? const Color(0xff4CDB06)
                                    : watch.hsDetailsviewdata?.purchaseType ==
                                            "cancelled"
                                        ? Colors.red
                                        : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          watch.hsDetailsviewdata?.purchaseType ?? '',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Total Price: ',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: const Color(0xff4CDB06),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),

                        /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ${watch.hsDetailsviewdata?.salePrice}',
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: '₺',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  // letterSpacing: .5,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // GestureDetector(
                    //   onTap: () async {
                    //     String url =
                    //         ' ${watch.hsDetailsviewdata?.invoicePdfPath.toString()}';
                    //     if (url != null) {
                    //       // Open the URL using url_launcher
                    //       await launchUrl(Uri.parse(url));

                    //       // Download the file using http
                    //       await downloadFile(url,
                    //           '/path/to/save/file'); // Specify the desired save path
                    //     }
                    //     // showDialog(
                    //     //     context: context,
                    //     //     builder: (context) => AlertDialog(
                    //     //         shape: RoundedRectangleBorder(
                    //     //             borderRadius: BorderRadius.all(
                    //     //                 Radius.circular(15.0))),
                    //     //         contentPadding: EdgeInsets.only(top: 0.0),
                    //     //         content: PackageCancellationPopUp1(
                    //     //             packageId: " element?.id.toString(),")));
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.only(
                    //         left: 10.w, top: 5.w, bottom: 5.w, right: 12.w),
                    //     decoration: BoxDecoration(
                    //         color: const Color(0xff4CDB06),
                    //         borderRadius: BorderRadius.circular(5)),
                    //     child: Center(
                    //       child: Text(
                    //         'Download Invoice',
                    //         style: TextStyle(
                    //             fontFamily: 'Campton',
                    //             color: Colors.white,
                    //             fontSize: 12.sp,
                    //             fontWeight: FontWeight.w600),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    watch.hsDetailsviewdata?.invoiceType == "invoice1"
                        ? GestureDetector(
                            onTap: () async {
                              // call functionality from 200 of below method's api call.
                              String url = Uri.encodeFull(watch
                                  .hsDetailsviewdata!.invoicePdfPath
                                  .toString());
                              if (await canLaunch(url)) {
                                launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                              // read.hsdownloadInvoise(
                              // context, watch.hsDetailsviewdata?.orderId);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10.w,
                                      top: 5.w,
                                      bottom: 5.w,
                                      right: 12.w),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff4CDB06),
                                      borderRadius: BorderRadius.circular(5)),
                                  child:
                                      const Center(child: Icon(Icons.download)),
                                ),
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              read.hsdownloadInvoise(
                                  context, watch.hsDetailsviewdata?.orderId);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10.w,
                                      top: 5.w,
                                      bottom: 5.w,
                                      right: 12.w),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff4CDB06),
                                      borderRadius: BorderRadius.circular(5)),
                                  child:
                                      const Center(child: Icon(Icons.download)),
                                ),
                              ],
                            ),
                          ),
                    watch.hsDetailsviewdata?.purchaseType == "Completed"
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              watch.hsDetailsviewdata?.reviewFound == "no"
                                  ? GestureDetector(
                                      onTap: () {
                                        print(
                                            watch.hsDetailsviewdata?.packageId);
                                        print(watch
                                            .hsDetailsviewdata?.purchaseId);
                                        print("object");
                                        print(watch.hsDetailsviewdata?.orderId);
                                        // return;

                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15.0))),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 0.0),
                                                content: SubmitHSReviewPopUp(
                                                  packageId: watch
                                                      .hsDetailsviewdata
                                                      ?.packageId
                                                      .toString(),
                                                  purchaseID: watch
                                                      .hsDetailsviewdata
                                                      ?.purchaseId
                                                      .toString(),
                                                  orderId: watch
                                                      .hsDetailsviewdata?.id,
                                                )));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w,
                                            top: 5.w,
                                            bottom: 5.w,
                                            right: 12.w),
                                        decoration: BoxDecoration(
                                            color: const Color(0xff4CDB06),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            'Rate Product',
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        print(
                                            watch.hsDetailsviewdata?.packageId);
                                        print(watch
                                            .hsDetailsviewdata?.purchaseId);
                                        print(
                                          watch.hsDetailsviewdata?.id
                                              .toString(),
                                        );
                                        // return;
                                        read.getHsReview(
                                          context,
                                          watch.hsDetailsviewdata?.id
                                              .toString(),
                                        );
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (context) => AlertDialog(
                                        //         shape: const RoundedRectangleBorder(
                                        //             borderRadius: BorderRadius.all(
                                        //                 Radius.circular(15.0))),
                                        //         contentPadding:
                                        //             EdgeInsets.only(top: 0.0),
                                        //         content: ShowHsReviewPopUp(
                                        // orderId: watch.hsDetailsviewdata?.id
                                        //     .toString(),
                                        //         )));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w,
                                            top: 5.w,
                                            bottom: 5.w,
                                            right: 12.w),
                                        decoration: BoxDecoration(
                                            color: const Color(0xff4CDB06),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            'View Review',
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 18.w, top: 23.w, right: 18.w),
            padding: EdgeInsets.only(left: 28.w, top: 28.w, right: 14.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    // offset: Offset(2, 2),
                    blurRadius: 20,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Company Name ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "${watch.hsDetailsviewdata?.companyName}",

                  // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Service Details ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      watch.hsDetailsviewdata?.otherServices?.length ?? 0,
                  itemBuilder: (context, index) {
                    final mealType =
                        watch.hsDetailsviewdata?.otherServices?[index];
                    return Container(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        "$mealType",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.w),
                Text(
                  'Address ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  'Delivery Address ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Text(
                  "${watch.hsDetailsviewdata?.customerAddress} ",

                  // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 13.w,
                ),
                Text(
                  '${watch.hsDetailsviewdata?.customerCountry} / ${watch.hsDetailsviewdata?.customerCity} ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 22.w,
                ),
                Text(
                  'Invoice Address ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Text(
                  "${watch.hsDetailsviewdata?.customerAddress} ",
                  // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Text(
                  '${watch.hsDetailsviewdata?.customerCountry} / ${watch.hsDetailsviewdata?.customerCity} ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 22.w,
                ),
                Text(
                  'Payment Info ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 11.w,
                ),
                watch.hsDetailsviewdata?.paymentMethod == "bank"
                    ? Text(
                        "Bank Transfer",
                        // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )
                    : Container(),
                SizedBox(
                  height: 6.w,
                ),
                watch.hsDetailsviewdata?.paymentMethod == "card"
                    ? Text(
                        'Card Payment',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )
                    : Container(),
                watch.hsDetailsviewdata?.paymentMethod == "md_coin"
                    ? Text(
                        "MD Coin",
                        // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )
                    : Container(),
                watch.hsDetailsviewdata?.paymentMethod == "bank"
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Transaction ID : ",
                                // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "${watch.hsDetailsviewdata?.transactionId ?? ''}",
                                // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.w),
                          Row(
                            children: [
                              Text(
                                "Bank Description : ",
                                // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                watch.hsDetailsviewdata?.bankDesc ?? '',
                                // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20.w,
                ),
                Text(
                  'Scheduled Date : ${watch.hsDetailsviewdata?.updatedAt} ${watch.hsDetailsviewdata?.createdAt}',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 45.w,
                ),

                // SizedBox(
                //   height: 11.h,
                // ),

                // SizedBox(
                //   height: 20.h,
                // ),
                // Text(
                //   'Pay Via',
                //   style: TextStyle(
                //       fontFamily: 'Campton',
                //       fontSize: 19.sp,
                //       color: kDefaultActiveColor,
                //       fontWeight: FontWeight.w700,
                //       letterSpacing: -1),
                // ),
                // Container(
                //   // padding:
                //   //     EdgeInsets.only(left: 18.w, right: 18.w, bottom: 26.w),
                //   child: Column(
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => PaymentView(
                //                         // watch.hsDetailsviewdata?.salePrice
                //                         // watch.hsDetailsviewdata?.packageName

                //                         price:
                //                             watch.hsDetailsviewdata?.salePrice,
                //                         packageId:
                //                             watch.hsDetailsviewdata?.packageId,
                //                         percetagePrise: watch
                //                             .hsDetailsviewdata?.pendingPayment,
                //                         percetage: watch.hsDetailsviewdata
                //                             ?.pendingPercentage,
                //                       )));
                //         },
                //         child: SvgPicture.asset(
                //           'assets/icons/Group_9.svg',
                //           // height: 92.h,
                //           // width: 394.w,
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           print(watch.hsDetailsviewdata?.patientId.toString());
                //           print(watch.hsDetailsviewdata?.purchaseId.toString());
                //           print(watch.hsDetailsviewdata?.pendingPayment
                //               .toString());
                //           // return;
                //           Navigator.push(
                //             context,
                //             SlidePageRoute(
                //               page: HsBankTransferView(
                //                 price: watch.hsDetailsviewdata?.pendingPayment,
                //                 packageId: watch.hsDetailsviewdata?.packageId
                //                     .toString(),
                //                 percetage:
                //                     watch.hsDetailsviewdata?.pendingPercentage,
                //                 // paymentType: 'Bank',
                //                 // packageName:
                //                 //     watch.hsDetailsviewdata?.packageName ?? '',
                //                 purchseId: watch.hsDetailsviewdata?.purchaseId
                //                     .toString(),
                //                 patientID: watch.hsDetailsviewdata?.patientId
                //                     .toString(),
                //                 // packageId: watch.hsDetailsviewdata?.packageId
                //                 //     .toString(),

                //                 // price: watch.hsDetailsviewdata?.pendingPayment,
                //                 // selectedNames:
                //                 //     watch.hsDetailsviewdata?.otherServices ??
                //                 //         ["trffg", "yuytt"],
                //               ),
                //               direction: SlideDirection
                //                   .right, // Specify the slide direction here
                //               delay: const Duration(milliseconds: 5000),
                //             ),
                //             // MaterialPageRoute(
                //             //     builder: (context) => BankTransferView())
                //           );
                //           // _showDialog();
                //         },
                //         child: SvgPicture.asset(
                //           'assets/icons/Group_7.svg',
                //           // height: 92.h,
                //           // width: 394.w,
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           // _showDialog();
                //         },
                //         child: SvgPicture.asset(
                //           'assets/icons/Group_8.svg',
                //           // height: 92.h,
                //           // width: 394.w,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 25.w,
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w),
            // padding: EdgeInsets.only(left: 10.w, top: 10.w, right: 10.w),
            child: Card(
              elevation: 5,
              // color: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 16.w, right: 18.w, top: 29.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            "Your Paid Payments ",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                // letterSpacing: .5,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                // "${watch.customerPurchasePackageList?.completedPercentage}%",
                                "${watch.hsDetailsviewdata?.paymentPercentage}%",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              RichText(
                                text: TextSpan(
                                    text:
                                        // " (${watch.customerPurchasePackageList?.completedPayment ?? 0})",
                                        "  (${watch.hsDetailsviewdata?.paidAmount ?? 0}",
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                        text: ' ₺)',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              // fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ]),
                              ),
                              // Text(
                              //   " (${watch.customerPurchasePackageList?.completedPayment ?? 0} ₺)",
                              //   style: TextStyle(
                              // fontFamily: 'Campton',
                              // color: Colors.black,
                              // fontSize: 16.sp,
                              // fontWeight: FontWeight.w600),
                              // ),
                            ],
                          ),
                          Text(
                            "Payment date",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: kDefaultActiveColor,
                                // letterSpacing: .5,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payment Completed.",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: kDefaultActiveColor,
                                // letterSpacing: .5,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            // "${watch.customerPurchasePackageList?.createdAt}",
                            "${watch.hsDetailsviewdata?.createdAt}",
                            // "15:20:30  |  01/22/2023",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                // letterSpacing: .5,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Divider(
                    //   color: kDefaultActiveColor,
                    //   thickness: 1,
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // watch.customerPurchasePackageList?.paymentStatus ==
                    watch.hsDetailsviewdata?.paymentPercentage == "100"
                        ? Container()
                        : Column(
                            children: [
                              watch.hsDetailsviewdata?.paymentStatus ==
                                      "Completed"
                                  ? Container(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                // "${watch.customerPurchasePackageList?.pendingPercentage}%",
                                                "${watch.hsDetailsviewdata?.pendingPercentage}%",
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        // " (${watch.customerPurchasePackageList?.pendingPayment ?? 0})",
                                                        "  (${watch.hsDetailsviewdata?.pendingPayment}",
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    children: [
                                                      TextSpan(
                                                        text: ' ₺)',
                                                        style:
                                                            GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              // fontFamily: 'Campton',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                              // Text(
                                              //   " (${watch.customerPurchasePackageList?.pendingPayment ?? 0} ₺)",
                                              //   style: TextStyle(
                                              //       fontFamily: 'Campton',
                                              //       color: Colors.black,
                                              //       fontSize: 16.sp,
                                              //       fontWeight:
                                              //           FontWeight.w600),
                                              // ),
                                            ],
                                          ),
                                          Text(
                                            "Payment date",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: kDefaultActiveColor,
                                                // letterSpacing: .5,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              // watch.customerPurchasePackageList?.paymentStatus ==
                              watch.hsDetailsviewdata?.paymentStatus ==
                                      "Completed"
                                  ? Container(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Payment Completed.",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: kDefaultActiveColor,
                                                // letterSpacing: .5,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            // "${watch.customerPurchasePackageList?.createdAt}",
                                            "${watch.hsDetailsviewdata?.createdAt}",
                                            // "15:20:30  |  01/22/2023",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                // letterSpacing: .5,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              watch.hsDetailsviewdata?.paymentStatus ==
                                      "Completed"
                                  ? SizedBox(
                                      height: 10.h,
                                    )
                                  : Container(),
                              watch.hsDetailsviewdata?.paymentStatus !=
                                      "Completed"
                                  ? const Divider(
                                      color: kDefaultActiveColor,
                                      thickness: 1,
                                    )
                                  : Container(),
                              watch.hsDetailsviewdata?.paymentStatus !=
                                      "Completed"
                                  ? SizedBox(
                                      height: 10.h,
                                    )
                                  : Container(),
                              watch.hsDetailsviewdata?.paymentStatus !=
                                      "Completed"
                                  ? Container(
                                      // height: ScreenUtil().scaleHeight,
                                      padding: EdgeInsets.only(
                                        left: 10.w,
                                        top: 4.w,
                                        bottom: 3.w,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: kDefaultActiveColor)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                // "${watch.cPercentage}%",   // coming from watch.cPercentage some logic
                                                "${watch.hsDetailsviewdata?.pendingPercentage ?? ""}%",
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    // letterSpacing: .5,
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        "  (${watch.hsDetailsviewdata?.pendingPayment ?? 0}",
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    children: [
                                                      TextSpan(
                                                        text: ' ₺)',
                                                        style:
                                                            GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              //  fontFamily: 'Campton',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                              // Text(
                                              //   " (${watch.customerPurchasePackageList?.pendingPayment ?? 0} ₺)",
                                              //   style: TextStyle(
                                              //       fontFamily: 'Campton',
                                              //       color: Colors.black,
                                              //       fontSize: 16.sp,
                                              //       fontWeight:
                                              //           FontWeight.w600),
                                              // ),
                                            ],
                                          ),
                                          Text(
                                            "Pending",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: const Color(0xffF3771D),
                                                // letterSpacing: .5,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 16.h,
                              ),
                              watch.hsDetailsviewdata?.paymentStatus !=
                                      "Completed"
                                  ? Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                "PuexhesId  ${watch.hsDetailsviewdata?.purchaseId.toString()}");
                                            print(
                                                "Payment% ${watch.hsDetailsviewdata?.paymentPercentage.toString()}");
                                            print(
                                                "paidAmount ${watch.hsDetailsviewdata?.paidAmount.toString()}");
                                            print(
                                                "pendingPayment ${watch.hsDetailsviewdata?.pendingPayment.toString()}");
                                            print(
                                              "packageID ********************** ${watch.hsDetailsviewdata?.packageId //
                                                  .toString()}",
                                            );
                                            //  print(
                                            //   "packageID ${watch.customerPurchasePackageList?.patientID //
                                            //       .toString()}",
                                            // );
                                            // print(widget.type);
                                            // return;
                                            Navigator.push(
                                              context,
                                              SlidePageRoute(
                                                page: HSardPaymentView(
                                                  //              purchaseType: widget.purchaseType,
                                                  // patientID: widget.patientID.toString(),
                                                  // packageId: watch.packageId.toString(),
                                                  // percetagePrise: watch.selectedPrice,
                                                  // percetage: watch.selectedPercetage,
                                                  // price: watch.salePrice,
                                                  // selectedNames: watch.selectedNames,
                                                  // type: widget.type,
                                                  paymentType: "card",
                                                  // watch
                                                  //     .hsDetailsviewdata
                                                  //     ?.paymentMethod,
                                                  puchesId: watch
                                                      .hsDetailsviewdata
                                                      ?.purchaseId
                                                      .toString(),
                                                  patientID: watch
                                                      .hsDetailsviewdata
                                                      ?.patientId
                                                      .toString(),
                                                  purchaseType:
                                                      // watch
                                                      //         .hsDetailsviewdata
                                                      //         ?.type ??
                                                      "Myself", // add this
                                                  packageId: watch
                                                      .hsDetailsviewdata
                                                      ?.packageId
                                                      .toString(),
                                                  percetagePrise: watch
                                                      .hsDetailsviewdata
                                                      ?.pendingPayment
                                                      .toString(),
                                                  percetage: watch
                                                      .hsDetailsviewdata
                                                      ?.paymentPercentage
                                                      .toString(),
                                                  price: watch.hsDetailsviewdata
                                                      ?.pendingPayment
                                                      .toString(),
                                                  selectedNames: [
                                                    "trffg",
                                                    "yuytt"
                                                  ],
                                                  screenName:
                                                      "PackageDetailView",
                                                ),
                                                direction: SlideDirection
                                                    .right, // Specify the slide direction here
                                                delay: const Duration(
                                                    milliseconds: 5000),
                                              ),
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/Group_9.svg',
                                            height: 92.h,
                                            width: 394.w,
                                          ),
                                        ),
                                        SizedBox(height: 5.w),
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                "PuexhesId  ${watch.hsDetailsviewdata?.purchaseId.toString()}");
                                            print(
                                                "Payment% ${watch.hsDetailsviewdata?.paymentPercentage.toString()}");
                                            print(
                                                "paidAmount ${watch.hsDetailsviewdata?.paidAmount.toString()}");
                                            print(
                                                "pendingPayment ${watch.hsDetailsviewdata?.pendingPayment.toString()}");
                                            print(
                                              "packageID ********************** ${watch.hsDetailsviewdata?.packageId //
                                                  .toString()}",
                                            );
                                            //  print(
                                            //   "packageID ${watch.customerPurchasePackageList?.patientID //
                                            //       .toString()}",
                                            // );
                                            // print(widget.type);
                                            // return;
                                            Navigator.push(
                                              context,
                                              SlidePageRoute(
                                                page: HsBankTransferView(
                                                  paymentType: "bank",
                                                  // watch
                                                  //     .hsDetailsviewdata
                                                  //     ?.paymentMethod,
                                                  puchesId: watch
                                                      .hsDetailsviewdata
                                                      ?.purchaseId
                                                      .toString(),
                                                  patientID: watch
                                                      .hsDetailsviewdata
                                                      ?.patientId
                                                      .toString(),
                                                  purchaseType:
                                                      // watch
                                                      //         .hsDetailsviewdata
                                                      //         ?.type ??
                                                      "Myself", // add this
                                                  packageId: watch
                                                      .hsDetailsviewdata
                                                      ?.packageId
                                                      .toString(),
                                                  percetagePrise: watch
                                                      .hsDetailsviewdata
                                                      ?.pendingPayment
                                                      .toString(),
                                                  percetage: watch
                                                      .hsDetailsviewdata
                                                      ?.paymentPercentage
                                                      .toString(),
                                                  price: watch.hsDetailsviewdata
                                                      ?.pendingPayment
                                                      .toString(),
                                                  selectedNames: [
                                                    "trffg",
                                                    "yuytt"
                                                  ],
                                                  screenName:
                                                      "PackageDetailView",
                                                ),
                                                direction: SlideDirection
                                                    .right, // Specify the slide direction here
                                                delay: const Duration(
                                                    milliseconds: 5000),
                                              ),
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/Group_7.svg',
                                            height: 92.h,
                                            width: 394.w,
                                          ),
                                        ),
                                        SizedBox(height: 5.w),
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                "PuexhesId  ${watch.hsDetailsviewdata?.purchaseId.toString()}");
                                            print(
                                                "Payment% ${watch.hsDetailsviewdata?.paymentPercentage.toString()}");
                                            print(
                                                "paidAmount ${watch.hsDetailsviewdata?.paidAmount.toString()}");
                                            print(
                                                "pendingPayment ${watch.hsDetailsviewdata?.pendingPayment.toString()}");
                                            print(
                                              "packageID ********************** ${watch.hsDetailsviewdata?.packageId //
                                                  .toString()}",
                                            );
                                            //  print(
                                            //   "packageID ${watch.customerPurchasePackageList?.patientID //
                                            //       .toString()}",
                                            // );
                                            // print(widget.type);
                                            // return;
                                            Navigator.push(
                                              context,
                                              SlidePageRoute(
                                                page: HsMyWalletScreenView(
                                                  paymentType: "wallet",
                                                  puchesId: watch
                                                      .hsDetailsviewdata
                                                      ?.purchaseId
                                                      .toString(),
                                                  patientID: watch
                                                      .hsDetailsviewdata
                                                      ?.patientId
                                                      .toString(),
                                                  purchaseType:
                                                      // watch
                                                      //         .hsDetailsviewdata
                                                      //         ?.type ??
                                                      "Myself", // add this
                                                  packageId: watch
                                                      .hsDetailsviewdata
                                                      ?.packageId
                                                      .toString(),
                                                  percetagePrise: watch
                                                      .hsDetailsviewdata
                                                      ?.pendingPayment
                                                      .toString(),
                                                  percetage: watch
                                                      .hsDetailsviewdata
                                                      ?.paymentPercentage
                                                      .toString(),
                                                  price: watch.hsDetailsviewdata
                                                      ?.pendingPayment
                                                      .toString(),
                                                  selectedNames: [
                                                    "trffg",
                                                    "yuytt"
                                                  ],
                                                  screenName:
                                                      "PackageDetailView",
                                                ),
                                                direction: SlideDirection
                                                    .right, // Specify the slide direction here
                                                delay: const Duration(
                                                    milliseconds: 5000),
                                              ),
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/Group_8.svg',
                                            height: 92.h,
                                            width: 394.w,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.w,
          ),
        ],
      ),
    );
  }
}
