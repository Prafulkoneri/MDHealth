import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/health/bank_transfer/view/bank_tranfer.dart';
import 'package:md_health/Screens/health/my_details/view/package_my_details_view.dart';
import 'package:md_health/Screens/health/my_documents/view/my_document_view.dart';
import 'package:md_health/Screens/health/packages/controller/package_detail_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/Screens/health/payment_details/view/wallet_view.dart';
import 'package:md_health/Screens/payment/view/payment_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageDetailView extends StatefulWidget {
  final String? packageId;
  final String? purchesId;
  final String? hotelId;
  final String? tourDetailId;
  final String? transportId;
  final String? type;
  const PackageDetailView({
    super.key,
    this.packageId,
    this.purchesId,
    this.hotelId,
    this.transportId,
    this.tourDetailId,
    required this.type,
  });

  @override
  State<PackageDetailView> createState() => _PackageDetailViewState();
}

class _PackageDetailViewState extends State<PackageDetailView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<PackageDetailViewController>().initState(
          context,
          widget.packageId,
          widget.purchesId,
          widget.hotelId,
          widget.transportId,
          widget.tourDetailId,
          widget.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PackageDetailViewController>();
    final watch = context.watch<PackageDetailViewController>();
    return watch.isLoading
        ? const Loader()
        : Builder(builder: (context) {
            return BaseScreen(
              onWillPop: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PackageSView(
                            packageId: watch.packageId.toString(),
                          )),
                );

                return false;
              },
              backgroundColor: const Color(0xffF5F5F5),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(130.w),
                child: CustomAppBar(
                  onBackPressed: () {
                    // Navigator.push(
                    //   context,
                    //   SlidePageRoute(
                    //     page: PackageSView(
                    //       packageId: watch.packageId.toString(),
                    //     ),
                    //     direction: SlideDirection
                    //         .left, // Specify the slide direction here
                    //     delay: Duration(milliseconds: 5000),
                    //   ),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PackageSView(
                                packageId: watch.packageId.toString(),
                              )),
                    );
                  },
                  drawerTitle: 'Packages',
                  hasBackButton: true,
                  hasMdTitle: false,
                  // drawerTitle: "Orders",
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      child: Card(
                        elevation: 5,
                        // color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 16.w, right: 18.w, top: 13.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  watch.customerPurchasePackageList
                                              ?.companyLogoImagePathS ==
                                          ""
                                      ? SizedBox(
                                          height: 50.w,
                                          width: 50.w,
                                          child: Image.asset(
                                            "assets/images/image_not_found.png",
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : SizedBox(
                                          height: 50.w,
                                          width: 50.w,
                                          child: AppNetworkImages(
                                            imageUrl: watch
                                                    .customerPurchasePackageList
                                                    ?.companyLogoImagePathS ??
                                                "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200.w,
                                        child: Text(
                                          "${watch.customerPurchasePackageList?.companyName}",
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Campton',
                                              // letterSpacing: 5.5,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Container(
                                        width: 200.w,
                                        child: Text(
                                          "${watch.customerPurchasePackageList?.packageName}",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: black,
                                              // letterSpacing: 5.5,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/location.svg',
                                        // alignment: Alignment.topRight,
                                      ),
                                      Container(
                                        width: 100.w,
                                        child: Text(
                                          "${watch.customerPurchasePackageList?.cityName}",
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'Campton',
                                              color: Color(0xff212121),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/time.svg',
                                        alignment: Alignment.topRight,
                                      ),
                                      Text(
                                        "Treatment Periods-${watch.customerPurchasePackageList?.treatmentPeriodInDays}Days",
                                        style: const TextStyle(
                                            fontFamily: 'Campton',
                                            color: Color(0xff212121),
                                            fontSize: 13,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "${watch.customerPurchasePackageList?.treatmentStartDate}",
                                // " Time left to treatment: 12 Days",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: const Color(0xff212121),
                                    fontSize: 14.sp,
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 21.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Your Case No : ",
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: const Color(0xff212121),
                                        fontSize: 23.sp,
                                        // fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "${watch.customerPurchasePackageList?.caseNumberer ?? "Not Availbel"}",
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: const Color(0xff4CDB06),
                                        fontSize: 23.sp,
                                        // fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 21.h,
                              ),
                              Text(
                                "Package Other Details",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: const Color(0xff212121),
                                    fontSize: 16.sp,
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: watch.otherServices?.length ?? 0,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final element = watch.otherServices?[index];
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            element?.status == "active"
                                                ? SvgPicture.asset(
                                                    'assets/icons/subway_tick.svg',
                                                    width: 9.w,

                                                    height: 9.h,
                                                    // alignment: Alignment.topRight,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/icons/mdi_denied.svg',
                                                    width: 9.w,

                                                    height: 9.h,
                                                    // alignment: Alignment.topRight,
                                                  ),
                                            Text(
                                              "  ${element?.title}   ",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color:
                                                      const Color(0xff212121),
                                                  fontSize: 14.sp,
                                                  // fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  print(
                                                    element?.id.toString(),
                                                  );
                                                  if (element?.status ==
                                                      "active") {
                                                    if (element?.title ==
                                                        "Accommodation") {
                                                      read.ViewHotelPackageDetails(
                                                          context,
                                                          element?.id
                                                              .toString());
                                                    } else if (element?.title ==
                                                        "Transportation") {
                                                      read.ViewTransportPackageDetails(
                                                          context,
                                                          element?.id
                                                              .toString());
                                                    } else if (element?.title ==
                                                        "Tour") {
                                                      read.ViewTourPackageDetails(
                                                        context,
                                                        element?.id.toString(),
                                                      );
                                                    } else {
                                                      // Display error message for inactive status
                                                      print(
                                                          "Error: Package is inactive");
                                                    }

                                                    // return;
                                                  }
                                                  ;
                                                },
                                                child: element?.viewStatus ==
                                                        "yes"
                                                    ? Text(
                                                        "View Details",
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontFamily: 'Campton',
                                                          color:
                                                              element?.status ==
                                                                      "inactive"
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .green,
                                                          // : Color(
                                                          //     0xffC7C7C7), // Set the color for inactive status
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    : Container())
                                          ],
                                        ),
                                        // : Row(
                                        //     children: [
                                        //       SvgPicture.asset(
                                        //         'assets/icons/mdi_denied.sv
                                        // g',
                                        //         width: 10.w,
                                        //         height: 10.h,
                                        //         // alignment: Alignment.topRight,
                                        //       ),
                                        //       Text(
                                        //         "  ${element?.title} ",
                                        //         style: TextStyle(
                                        //             fontFamily: 'Campton',
                                        //             color:
                                        //                 Color(0xff212121),
                                        //             fontSize: 14.sp,
                                        //             // fontStyle: FontStyle.italic,
                                        //             fontWeight:
                                        //                 FontWeight.w500),
                                        //       ),
                                        //     ],
                                        //   ),
                                        SizedBox(
                                          height: 13.h,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PrimaryButton(
                                    width: 145.w,
                                    height: 30.w,
                                    borderRadius: 5,
                                    color: Colors.black,
                                    onTap: () {
                                      print(
                                        watch.customerPurchasePackageList
                                            ?.patientID
                                            .toString(),
                                      );
                                      print(
                                        watch.customerPurchasePackageList
                                            ?.packageId
                                            .toString(),
                                      );
                                      print(
                                        "${watch.purcheseId}",
                                      );
                                      // return;
                                      Navigator.push(
                                        context,
                                        SlidePageRoute(
                                          page: PackageMyDetailView(
                                            type: widget.type,
                                            purchaseId: watch.purcheseId,
                                            patientId: watch
                                                    .customerPurchasePackageList
                                                    ?.patientID
                                                    .toString() ??
                                                '',
                                            packageId:
                                                watch.packageId.toString(),
                                          ),
                                          direction: SlideDirection
                                              .right, // Specify the slide direction here
                                          delay: const Duration(
                                              milliseconds: 5000),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "My Details",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.white,
                                          // letterSpacing: .5,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  PrimaryButton(
                                    borderColor: Colors.black,
                                    width: 145.w,
                                    height: 30.w,
                                    borderRadius: 5,
                                    color: Colors.transparent,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        SlidePageRoute(
                                          page: PackageMyDocumentView(
                                            type: widget.type,
                                            // screenName: "packageDetails",
                                            purchaseId: watch.purcheseId,
                                            packageId:
                                                watch.packageId.toString(),
                                          ),
                                          direction: SlideDirection
                                              .right, // Specify the slide direction here
                                          delay: const Duration(
                                              milliseconds: 5000),
                                        ),
                                      );
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           PackageMyDocumentView()),
                                      // );
                                    },
                                    child: Text(
                                      "My Documents",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          // letterSpacing: .5,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ////////////////////////////////////////////////////////////
                    SizedBox(
                      height: 32.h,
                    ),
                    Container(
                      child: Card(
                        elevation: 5,
                        // color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 16.w, right: 18.w, top: 29.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  watch.customerPurchasePackageList
                                              ?.invoiceType ==
                                          "invoice1"
                                      ? GestureDetector(
                                          onTap: () async {
                                            // call show pdf from below api's 200
                                            String url = Uri.encodeFull(watch
                                                .customerPurchasePackageList!
                                                .invoicePdfPath
                                                .toString());
                                            if (await canLaunch(url)) {
                                              launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                            // read.downloadInvoise(
                                            //     context,
                                            //     watch
                                            //         .customerPurchasePackageList
                                            //         ?.orderID);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 10.w,
                                                    top: 5.w,
                                                    bottom: 5.w,
                                                    right: 12.w),
                                                decoration: BoxDecoration(
                                                    color: Color(0xff4CDB06),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                    child:
                                                        Icon(Icons.download)),
                                              ),
                                            ],
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            read.downloadInvoise(
                                                context,
                                                watch
                                                    .customerPurchasePackageList
                                                    ?.orderID);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 10.w,
                                                    top: 5.w,
                                                    bottom: 5.w,
                                                    right: 12.w),
                                                decoration: BoxDecoration(
                                                    color: Color(0xff4CDB06),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                    child:
                                                        Icon(Icons.download)),
                                              ),
                                            ],
                                          ),
                                        )
                                ],
                              ),

                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${watch.customerPurchasePackageList?.completedPercentage}%",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text:
                                                  " (${watch.customerPurchasePackageList?.completedPayment ?? 0})",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                              children: [
                                                TextSpan(
                                                  text: ' ₺',
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        // fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      "${watch.customerPurchasePackageList?.createdAt}",
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
                                height: 10.h,
                              ),
                              // Divider(
                              //   color: kDefaultActiveColor,
                              //   thickness: 1,
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              watch.customerPurchasePackageList
                                          ?.paymentStatus ==
                                      "completed"
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
                                                "${watch.customerPurchasePackageList?.pendingPercentage}%",
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
                                                        " (${watch.customerPurchasePackageList?.pendingPayment ?? 0})",
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    children: [
                                                      TextSpan(
                                                        text: ' ₺',
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
                              watch.customerPurchasePackageList
                                          ?.paymentStatus ==
                                      "completed"
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
                                            "${watch.customerPurchasePackageList?.modifiedKey}",
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
                              watch.customerPurchasePackageList
                                          ?.paymentStatus ==
                                      "completed"
                                  ? SizedBox(
                                      height: 10.h,
                                    )
                                  : Container(),
                              watch.customerPurchasePackageList
                                          ?.paymentStatus !=
                                      "completed"
                                  ? const Divider(
                                      color: kDefaultActiveColor,
                                      thickness: 1,
                                    )
                                  : Container(),
                              watch.customerPurchasePackageList
                                          ?.paymentStatus !=
                                      "completed"
                                  ? SizedBox(
                                      height: 10.h,
                                    )
                                  : Container(),
                              watch.customerPurchasePackageList
                                          ?.paymentStatus !=
                                      "completed"
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
                                                "${watch.cPercentage}%",
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
                                                        " (${watch.customerPurchasePackageList?.pendingPayment ?? 0})",
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    children: [
                                                      TextSpan(
                                                        text: ' ₺',
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
                              watch.customerPurchasePackageList
                                          ?.paymentStatus !=
                                      "completed"
                                  ? Column(
                                      children: [
                                        GestureDetector(
                                          // height: 40.w,
                                          // borderRadius: 25.w,
                                          // color: kDefaultActiveColor,
                                          onTap: () {
                                            print(
                                                "PuexhesId ${watch.customerPurchasePackageList?.purchaseId.toString()}");
                                            print(
                                                "Payment% ${watch.customerPurchasePackageList?.paymentPercentage.toString()}");
                                            print(
                                                "paidAmount ${watch.customerPurchasePackageList?.paidAmount.toString()}");
                                            print(
                                                "pendingPayment ${watch.customerPurchasePackageList?.pendingPayment.toString()}");
                                            print(
                                              "packageID ${watch.customerPurchasePackageList?.packageId //
                                                  .toString()}",
                                            );
                                            print(
                                                'patient id ****** ${watch.customerPurchasePackageList?.patientID.toString()}');
                                            //  print(
                                            //   "packageID ${watch.customerPurchasePackageList?.patientID //
                                            //       .toString()}",
                                            // );
                                            // print(widget.type);
                                            // return;
                                            Navigator.push(
                                              context,
                                              SlidePageRoute(
                                                page: PaymentView(
                                                  //              purchaseType: widget.purchaseType,
                                                  // patientID: widget.patientID.toString(),
                                                  // packageId: watch.packageId.toString(),
                                                  // percetagePrise: watch.selectedPrice,
                                                  // percetage: watch.selectedPercetage,
                                                  // price: watch.salePrice,
                                                  // selectedNames: watch.selectedNames,
                                                  // type: widget.type,
                                                  paymentType: "card",
                                                  patientID: watch
                                                      .customerPurchasePackageList
                                                      ?.patientID
                                                      .toString(),
                                                  puchesId: watch.purcheseId,
                                                  purchaseType: watch.type,
                                                  packageId: watch
                                                      .customerPurchasePackageList
                                                      ?.packageId
                                                      .toString(),
                                                  percetagePrise: watch
                                                      .customerPurchasePackageList
                                                      ?.pendingPayment
                                                      .toString(),
                                                  percetage: watch.cPercentage
                                                      .toString(),
                                                  price: watch
                                                      .customerPurchasePackageList
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
                                        SizedBox(height: 5.h),
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                "PuexhesId ${watch.customerPurchasePackageList?.purchaseId.toString()}");
                                            print(
                                                "Payment% ${watch.customerPurchasePackageList?.paymentPercentage.toString()}");
                                            print(
                                                "paidAmount ${watch.customerPurchasePackageList?.paidAmount.toString()}");
                                            print(
                                                "pendingPayment ${watch.customerPurchasePackageList?.pendingPayment.toString()}");
                                            print(
                                              "packageID ${watch.customerPurchasePackageList?.packageId //
                                                  .toString()}",
                                            );
                                            Navigator.push(
                                              context,
                                              SlidePageRoute(
                                                page: BankTransferView(
                                                  patientID: watch
                                                      .customerPurchasePackageList
                                                      ?.patientID
                                                      .toString(),
                                                  paymentType: "bank",
                                                  puchesId: watch.purcheseId,
                                                  purchaseType: watch.type,
                                                  packageId: watch
                                                      .customerPurchasePackageList
                                                      ?.packageId
                                                      .toString(),
                                                  percetagePrise: watch
                                                      .customerPurchasePackageList
                                                      ?.pendingPayment
                                                      .toString(),
                                                  percetage: watch.cPercentage
                                                      .toString(),
                                                  price: watch
                                                      .customerPurchasePackageList
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
                                        SizedBox(height: 5.h),
                                        GestureDetector(
                                          // height: 40.w,
                                          // borderRadius: 25.w,
                                          // color: kDefaultActiveColor,
                                          onTap: () {
                                            print(
                                                "PuexhesId ${watch.customerPurchasePackageList?.purchaseId.toString()}");
                                            print(
                                                "Payment% ${watch.customerPurchasePackageList?.paymentPercentage.toString()}");
                                            print(
                                                "paidAmount ${watch.customerPurchasePackageList?.paidAmount.toString()}");
                                            print(
                                                "pendingPayment ${watch.customerPurchasePackageList?.pendingPayment.toString()}");
                                            print(
                                              "packageID ${watch.customerPurchasePackageList?.packageId //
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
                                                page: MyWalletScreenViewPay(
                                                  patientID: watch
                                                      .customerPurchasePackageList
                                                      ?.patientID
                                                      .toString(),
                                                  paymentType: "wallet",
                                                  //              purchaseType: widget.purchaseType,
                                                  // patientID: widget.patientID.toString(),
                                                  // packageId: watch.packageId.toString(),
                                                  // percetagePrise: watch.selectedPrice,
                                                  // percetage: watch.selectedPercetage,
                                                  // price: watch.salePrice,
                                                  // selectedNames: watch.selectedNames,
                                                  // type: widget.type,
                                                  puchesId: watch.purcheseId,
                                                  purchaseType: watch.type,
                                                  packageId: watch
                                                      .customerPurchasePackageList
                                                      ?.packageId
                                                      .toString(),
                                                  percetagePrise: watch
                                                      .customerPurchasePackageList
                                                      ?.pendingPayment
                                                      .toString(),
                                                  percetage: watch.cPercentage
                                                      .toString(),
                                                  price: watch
                                                      .customerPurchasePackageList
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
                                        )
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              ),
            );
          });
  }
}
