import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/hotel/view/hotel_review.dart';
import 'package:md_health/Screens/health/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/package_detail_view.dart';
import 'package:md_health/Screens/health/packages/view/review_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:md_health/widget/rating.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedPackageView extends StatefulWidget {
  final String? index;
  const CompletedPackageView({super.key, this.index});

  @override
  State<CompletedPackageView> createState() => _CompletedPackageViewState();
}

class _CompletedPackageViewState extends State<CompletedPackageView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .read<PackageViewController>()
          .initState(context, widget.index, "", "");
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PackageViewController>();
    final watch = context.watch<PackageViewController>();

    return
        //  watch.isLoading
        //     ? Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         SizedBox(height: 200.h),
        //         const Loader(),
        //       ]
        //     )
        //     :
        Column(
      children: [
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
                read.comeSearchList(context);
              },
              // autofocus: widget.isSearchFocus ?? true,
              controller: watch.searchCompletedController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: black),
                    borderRadius: BorderRadius.circular(8.w)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: kDefaultActiveColor),
                    borderRadius: BorderRadius.circular(8.w)),
                hintText: 'Search Packages.......',
                hintStyle: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
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
        // Padding(
        //   padding: EdgeInsets.only(
        //     right: 19.0.w,
        //     left: 19.0.w,
        //     // top: 13.h,
        //   ),
        //   child: SizedBox(
        //     height: 36.h,
        //     child: TextField(
        //       onChanged: (value) {
        //         read.completedSearchList(context);
        //       },
        //       // autofocus: widget.isSearchFocus ?? true,
        //       controller: watch.searchCompletedController,
        //       decoration: InputDecoration(
        //         enabledBorder: OutlineInputBorder(
        //             borderSide: const BorderSide(width: 1, color: black),
        //             borderRadius: BorderRadius.circular(8.w)),
        //         focusedBorder: OutlineInputBorder(
        //             borderSide:
        //                 const BorderSide(width: 1, color: kDefaultActiveColor),
        //             borderRadius: BorderRadius.circular(8.w)),
        //         hintText: 'Search Packages.......',
        //         hintStyle: GoogleFonts.dmSans(
        //             textStyle: TextStyle(
        //                 color: black,
        //                 // letterSpacing: .5,
        //                 fontSize: 11.sp,
        //                 fontWeight: FontWeight.w400)),
        //         prefixIcon: IconButton(
        //           icon: SvgPicture.asset(
        //             'assets/icons/search.svg',
        //             // alignment: Alignment.topRight,
        //           ),
        //           //  SvgPicture.asset(
        //           //   'assets/icons/search.svg',
        //           //   width: 15.w,
        //           //   height: 15.h,
        //           // ),
        //           onPressed: () {
        //             // Perform the search here
        //           },
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Container(
            // margin: EdgeInsets.only(left: 18.w, right: 18.w),
            child:
                watch.customerPurchasePackageCompletedList?.isNotEmpty == true
                    ? ListView.builder(
                        padding:
                            EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
                        itemCount: watch
                                .customerPurchasePackageCompletedList?.length ??
                            0,
                        //  watch.customerPurchasePackageActiveList??,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext, index) {
                          final element = watch
                              .customerPurchasePackageCompletedList?[index];
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(bottom: 17.w),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  // border: Border.all(color: const Color(0xffEFEFEF)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        blurStyle: BlurStyle.outer)
                                  ]),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 16.w, right: 18.w, top: 5.w),
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
                                                  fontWeight: FontWeight.w700),
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
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/location.svg',
                                              // alignment: Alignment.topRight,
                                            ),
                                            Container(
                                              width: 110.w,
                                              child: Text(
                                                "${element?.cityName}",
                                                style: const TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: 'Campton',
                                                    color: Color(0xff212121),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
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
                                        Navigator.push(
                                          context,
                                          SlidePageRoute(
                                            page: PackageDetailView(
                                                type: element?.type,
                                                purchesId: element?.purchaseId
                                                    .toString(),
                                                packageId:
                                                    element?.id.toString()),
                                            direction: SlideDirection
                                                .right, // Specify the slide direction here
                                            delay: const Duration(
                                                milliseconds: 5000),
                                          ),
                                        );
                                        // return;
                                        // Navigator.push(
                                        //   context,
                                        //   SlidePageRoute(
                                        //     page: PackageDetailView(
                                        //         type: element?.type,
                                        //         purchesId:
                                        //             element?.packageId.toString(),
                                        //         packageId: element?.id.toString()),
                                        //     direction: SlideDirection
                                        //         .right, // Specify the slide direction here
                                        //     delay: Duration(milliseconds: 5000),
                                        //   ),
                                        // );
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
                                      height: 14.h,
                                    ),
                                    element?.reviewFound == "no" // do it yes
                                        ? PrimaryButton(
                                            borderRadius: 30,
                                            color: const Color(0xffF3771D),
                                            onTap: () {
                                              print(
                                                element?.id.toString(),
                                              );
                                              print(
                                                element?.packageId.toString(),
                                              );
                                              // return;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReviewForPackageView(
                                                          packageId: element
                                                              ?.packageId
                                                              .toString(),
                                                          purchesId: element?.id
                                                              .toString(),
                                                        )),
                                              );
                                            },
                                            child: Text(
                                              "Write Review",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.white,
                                                  // letterSpacing: .5,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        : PrimaryButton(
                                            borderRadius: 30,
                                            color: const Color(0xffF3771D),
                                            onTap: () {
                                              print(
                                                element?.id.toString(),
                                              );
                                              print(
                                                element?.packageId.toString(),
                                              );
                                              // return;
                                              // view review screen
                                              // call get reviews api

                                              read.getCompletedPkgReviews(
                                                  context,
                                                  element?.id.toString());

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (context) => AlertDialog(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15.0))),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 0.0),
                                                            content: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              child: SizedBox(
                                                                width: ScreenUtil()
                                                                    .screenWidth,
                                                                height: 400.h,
                                                                child: Scaffold(
                                                                  body:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          padding: EdgeInsets.only(
                                                                              left: 15.w,
                                                                              right: 10.w),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 25.h,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    "Package Review",
                                                                                    // textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Campton',
                                                                                      color: black,
                                                                                      fontSize: 23.sp,
                                                                                      fontWeight: FontWeight.w700,
                                                                                    ),
                                                                                  ),
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: SvgPicture.asset(
                                                                                      "assets/icons/red_close.svg",
                                                                                      color: Colors.grey,
                                                                                      width: 25.w,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 25.h,
                                                                              ),
                                                                              Text(
                                                                                'Treatment',
                                                                                style: TextStyle(
                                                                                  fontFamily: 'Campton',
                                                                                  color: Colors.black,
                                                                                  fontSize: 16.sp,
                                                                                  fontWeight: FontWeight.w700,
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: 5.w),
                                                                              Row(
                                                                                children: [
                                                                                  for (int i = 0; i < 5; i++)
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(5.0),
                                                                                      child: SvgPicture.asset(
                                                                                        i < (watch.customerReviews?.treatment ?? 0)
                                                                                            // watch.showfoodreviewdata!.rating!
                                                                                            ? 'assets/icons/black-star.svg'
                                                                                            : 'assets/icons/black-star.svg',
                                                                                        width: 20,
                                                                                        color: i < (watch.customerReviews?.treatment ?? 0)
                                                                                            // watch.showfoodreviewdata!.rating!
                                                                                            ? Color(0xff4CDB06)
                                                                                            : Colors.black,
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10.h,
                                                                              ),
                                                                              Text("Behavior / Professionalism",
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Campton',
                                                                                    color: Colors.black,
                                                                                    fontSize: 16.sp,
                                                                                    fontWeight: FontWeight.w700,
                                                                                  )),
                                                                              SizedBox(height: 5.w),
                                                                              Row(
                                                                                children: [
                                                                                  for (int i = 0; i < 5; i++)
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(5.0),
                                                                                      child: SvgPicture.asset(
                                                                                        i < (watch.customerReviews?.behaviorR ?? 0)
                                                                                            // watch.showfoodreviewdata!.rating!
                                                                                            ? 'assets/icons/black-star.svg'
                                                                                            : 'assets/icons/black-star.svg',
                                                                                        width: 20,
                                                                                        color: i < (watch.customerReviews?.behaviorR ?? 0)
                                                                                            // watch.showfoodreviewdata!.rating!
                                                                                            ? Color(0xff4CDB06)
                                                                                            : Colors.black,
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10.h,
                                                                              ),
                                                                              Text(
                                                                                "Do you recommend this service?",
                                                                                // textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  fontFamily: 'Campton',
                                                                                  color: Colors.black,
                                                                                  fontSize: 16.sp,
                                                                                  fontWeight: FontWeight.w700,
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: 5.w),
                                                                              Row(
                                                                                children: [
                                                                                  for (int i = 0; i < 10; i++)
                                                                                    Padding(
                                                                                        padding: const EdgeInsets.all(4.0),
                                                                                        child: i < (watch.customerReviews?.recommendSer ?? 0)
                                                                                            // watch
                                                                                            //     .showfoodreviewdata!.recommendation!
                                                                                            ? Container(
                                                                                                width: 15.w,
                                                                                                height: 15.w,
                                                                                                decoration: BoxDecoration(color: const Color(0xff4CDB06), borderRadius: BorderRadius.circular(10)),
                                                                                              )
                                                                                            : Container(
                                                                                                width: 15.w,
                                                                                                height: 15.w,
                                                                                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                                                                                              )),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15.h,
                                                                              ),
                                                                              RichText(
                                                                                  text: TextSpan(
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Campton',
                                                                                        color: Colors.black,
                                                                                        fontSize: 16.sp,
                                                                                        fontWeight: FontWeight.w700,
                                                                                      ),
                                                                                      children: [
                                                                                    TextSpan(
                                                                                      text: 'Extra Notes',
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Campton',
                                                                                        color: Colors.black,
                                                                                        fontSize: 16.sp,
                                                                                        fontWeight: FontWeight.w700,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: "*Optional",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Campton',
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontSize: 14.sp,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                    ),
                                                                                  ])),
                                                                              SizedBox(
                                                                                height: 10.h,
                                                                              ),
                                                                              Container(
                                                                                  width: ScreenUtil().screenWidth,
                                                                                  height: 100.h,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(4),
                                                                                      border: Border.all(
                                                                                          // width: 1.5,
                                                                                          color: const Color.fromARGB(255, 61, 60, 60))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Text(
                                                                                      watch.customerReviews?.extraN ?? '',
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Campton',
                                                                                        color: Colors.black,
                                                                                        fontSize: 16.sp,
                                                                                        fontWeight: FontWeight.w700,
                                                                                      ),
                                                                                    ),
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),);
                                            },
                                            child: Text(
                                              "View Review",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.white,
                                                  // letterSpacing: .5,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
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
