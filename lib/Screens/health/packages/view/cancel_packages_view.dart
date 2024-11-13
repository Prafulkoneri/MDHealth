import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/health/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/package_detail_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelPackageView extends StatefulWidget {
  final String? index;
  final String? packageId;
  final String? purchaseId;
  final String? cancelId;
  const CancelPackageView(
      {super.key, this.index, this.packageId, this.purchaseId, this.cancelId});

  @override
  State<CancelPackageView> createState() => _CancelPackageViewState();
}

class _CancelPackageViewState extends State<CancelPackageView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<PackageViewController>().initState(
          context, widget.packageId, widget.purchaseId, widget.cancelId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PackageViewController>();
    final watch = context.watch<PackageViewController>();

    return watch.isLoading
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(height: 200.h),
                const Loader(),
              ])
        : Column(
            children: [
              // SizedBox(),
              Padding(
                padding: EdgeInsets.only(
                  right: 19.0.w,
                  left: 19.0.w,
                  // top: 13.h,
                ),
                child: SizedBox(
                  height: 36.h,
                  child: TextField(
                    onChanged: (value) {
                      read.canceledSearchList(context);
                    },
                    // autofocus: widget.isSearchFocus ?? true,
                    controller: watch.searchCanclledController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: black),
                          borderRadius: BorderRadius.circular(8.w)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: kDefaultActiveColor),
                          borderRadius: BorderRadius.circular(8.w)),
                      hintText: 'Search Packages.......',
                      hintStyle: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                              color: black,
                              // letterSpacing: .5,
                              fontSize: 11,
                              fontWeight: FontWeight.w400)),
                      prefixIcon: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          // alignment: Alignment.topRight,
                        ),
                        //  SvgPicture.asset(
                        //   'assets/icons/search.svg',
                        //   width: 15.w,
                        //   height: 15.h,
                        // ),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  // margin: EdgeInsets.only(top: 18.w, right: 18.w),
                  child: watch.customerPurchasePackageActiveList?.isNotEmpty ==
                          true
                      ? ListView.builder(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 12.w),
                          itemCount: watch.customerPurchasePackageCancelledList
                                  ?.length ??
                              0,
                          //  watch.customerPurchasePackageActiveList??,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext, index) {
                            final element = watch
                                .customerPurchasePackageCancelledList?[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 17.w),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      // border: Border.all(color: const Color(0xffEFEFEF)),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            blurStyle: BlurStyle.outer)
                                      ]),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 16.w, right: 18.w, top: 13.w),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            element?.companyLogoImagePath == ""
                                                ? SizedBox(
                                                    width: 50.w,
                                                    height: 50.h,
                                                    child: Image.asset(
                                                      "assets/images/image_not_found.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : SizedBox(
                                                    width: 50.w,
                                                    height: 50.h,
                                                    child: AppNetworkImages(
                                                      imageUrl:
                                                          "${element?.companyLogoImagePath}",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                            // Image(
                                            //   image: AssetImage(
                                            //       "assets/images/package_list.png"),
                                            // width: 50.w,
                                            // height: 50.h,
                                            // ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${element?.companyName}",
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: black,
                                                      // letterSpacing: 5.5,
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Container(
                                                  width: 200.w,
                                                  child: Text(
                                                    "${element?.packageName}",
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: black,
                                                        // letterSpacing: 5.5,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/location.svg',
                                                  // alignment: Alignment.topRight,
                                                ),
                                                Text(
                                                  "${element?.cityName}",
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontFamily: 'Campton',
                                                      color: Color(0xff212121),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/time.svg',
                                                  alignment: Alignment.topRight,
                                                ),
                                                Text(
                                                  "Treatment Periods ${element?.treatmentPeriodInDays}",
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Color(0xff212121),
                                                      fontSize: 13,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     PrimaryButton(
                                        //       borderColor: Colors.black,
                                        //       width: 140.w,
                                        //       height: 35.w,
                                        //       // borderRadius: BorderRadius.circular(),
                                        //       borderRadius: 10,
                                        //       // width: ScreenUtil().screenWidth,
                                        //       color: Colors.transparent,
                                        //       onTap: () {
                                        //         // Navigator.push(
                                        //         //   context,
                                        //         //   MaterialPageRoute(builder: (context) => SignUpView()),
                                        //         // );
                                        //       },
                                        //       child: Text(
                                        //         "Package Details",
                                        //         style: TextStyle(
                                        //             color: Colors.black,
                                        //             // letterSpacing: .5,
                                        //             fontSize: 14.sp,
                                        //             fontWeight: FontWeight.w600),
                                        //       ),
                                        //     ),
                                        //     PrimaryButton(
                                        //       width: 140.w,
                                        //       height: 35.w,
                                        //       // borderRadius: BorderRadius.circular(),
                                        //       borderRadius: 10,
                                        //       // width: ScreenUtil().screenWidth,
                                        //       color: Colors.black,
                                        //       onTap: () {
                                        //         // Navigator.push(
                                        //         //   context,
                                        //         //   MaterialPageRoute(builder: (context) => SignUpView()),
                                        //         // );
                                        //       },
                                        //       child: Text(
                                        //         "Change Patient Info",
                                        //         style: TextStyle(
                                        //             color: Colors.white,
                                        //             // letterSpacing: .5,
                                        //             fontSize: 14.sp,
                                        //             fontWeight: FontWeight.w600),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        // SizedBox(
                                        //   height: 10.h,
                                        // ),
                                        // PrimaryButton(
                                        //   // borderColor: Colors.black,
                                        //   // width: 172.w,
                                        //   // height: 35.w,
                                        //   // borderRadius: BorderRadius.circular(),
                                        //   borderRadius: 10,
                                        //   // width: ScreenUtil().screenWidth,
                                        //   // color: Colors.(0xff4CDB06),
                                        //   color: Color(0xff4CDB06),
                                        //   onTap: () {
                                        //     // Navigator.push(
                                        //     //   context,
                                        //     //   MaterialPageRoute(builder: (context) => SignUpView()),
                                        //     // );
                                        //   },
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.center,
                                        //     children: [
                                        //       SvgPicture.asset("assets/icons/message.svg"),
                                        //       SizedBox(
                                        //         width: 10.w,
                                        //       ),
                                        //       Text(
                                        //         "Message",
                                        //         style: TextStyle(
                                        //             color: Colors.black,
                                        //             // letterSpacing: .5,
                                        //             fontSize: 14.sp,
                                        //             fontWeight: FontWeight.w600),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        PrimaryButton(
                                          borderColor: Colors.black,
                                          // width: 145.w,
                                          height: 30.w,
                                          // borderRadius: BorderRadius.circular(),
                                          borderRadius: 5,
                                          // width: ScreenUtil().screenWidth,
                                          color: Colors.transparent,
                                          onTap: () {
                                            // print(
                                            //   element?.purchaseId.toString(),
                                            // );
                                            print(element?.id.toString());

                                            // return;
                                            // Navigator.push(
                                            //   context,
                                            //   SlidePageRoute(
                                            //     page: PackageDetailView(
                                            //         type: element?.type,
                                            //         purchesId:
                                            //             element?.id.toString(),
                                            //         packageId:
                                            //             element?.id.toString()),
                                            //     direction: SlideDirection
                                            //         .right, // Specify the slide direction here
                                            //     delay: Duration(
                                            //         milliseconds: 5000),
                                            //   ),
                                            // );
                                            Navigator.push(
                                              context,
                                              SlidePageRoute(
                                                page: PackageDetailView(
                                                    type: element?.type,
                                                    purchesId:
                                                        element?.id.toString(),
                                                    packageId: element
                                                        ?.packageId
                                                        .toString()),
                                                direction: SlideDirection
                                                    .right, // Specify the slide direction here
                                                delay: Duration(
                                                    milliseconds: 5000),
                                              ),
                                            );
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           PackageDetailView(
                                            // packageId:
                                            //     element?.id.toString())),
                                            // );
                                          },
                                          child: Text(
                                            "Package Details",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                // letterSpacing: .5,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Status:",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Color(0xff212121),
                                                  fontSize: 16,
                                                  // fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              " Cancelled",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Color(0xffF31D1D),
                                                  fontSize: 20.sp,
                                                  // fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                        // PrimaryButton(
                                        //   // borderColor: Colors.black,
                                        //   // width: 172.w,
                                        //   // height: 35.w,
                                        //   // borderRadius: BorderRadius.circular(),
                                        //   borderRadius: 30,
                                        //   // width: ScreenUtil().screenWidth,
                                        //   // color: Colors.(0xff4CDB06),
                                        //   color: Color(0xffF3771D),
                                        //   onTap: () {
                                        //     // Navigator.push(
                                        //     //   context,
                                        //     //   MaterialPageRoute(builder: (context) => SignUpView()),
                                        //     // );
                                        //   },
                                        //   child: Text(
                                        //     "Write Review",
                                        //     style: TextStyle(
                                        //         color: Colors.white,
                                        //         // letterSpacing: .5,
                                        //         fontSize: 16.sp,
                                        //         fontWeight: FontWeight.w600),
                                        //   ),
                                        // ),
                                        ,
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 120.h,
                              ),
                              SvgPicture.asset(
                                "assets/icons/No-orders-found.svg",
                                // width: 10,
                              ),
                            ],
                          ),
                        )),
            ],
          );
  }
}
