import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:md_health/Screens/favourt/view/health_favt_pa_list_details.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_details_view.dart';
import 'package:md_health/Screens/health/information_form/view/information_form_view.dart';
import 'package:md_health/Screens/health/payment_details/view/payment_details_view.dart';
import 'package:md_health/Screens/health/search/controller/search_details_view_controller.dart';
import 'package:md_health/Screens/review/view/review_screen.dart';
import 'package:md_health/Screens/health/search/view/search_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/favrt_button.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class SearchDetailsView extends StatefulWidget {
  final String? packageId;
  final String? treatmentName;
  final String? cityName;
  final String? searchtreatment;
  final bool? refreshPage;
  final String? screenName;
  final String? packagePurchase;

  const SearchDetailsView(
      {super.key,
      this.packageId,
      this.cityName,
      this.refreshPage,
      this.screenName,
      this.treatmentName,
      this.packagePurchase,
      this.searchtreatment});

  @override
  State<SearchDetailsView> createState() => _SearchDetailsViewState();
}

// bool isExpanded = false;
bool isExpanded = false;

class _SearchDetailsViewState extends State<SearchDetailsView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      log(widget.packageId ?? '');
      log(widget.treatmentName ?? '');
      log("widget.treatmentName ?? ");
      context.read<SearchDetailsViewController>().initState(
          context,
          widget.packageId,
          widget.cityName,
          widget.treatmentName,
          widget.packagePurchase);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<SearchDetailsViewController>();
    final watch = context.watch<SearchDetailsViewController>();

    return BaseScreen(
      onWillPop: () async {
        print('onWillPop called, screenName: ${widget.screenName}');
        if (widget.screenName == "FaviListDetailoView") {
          Navigator.push(
            context,
            SlidePageRoute(
              page: FaviListDetailoView(
                packageId: watch.packageId.toString(),
              ),
              direction: SlideDirection.left,
              delay: const Duration(milliseconds: 5000),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchView(
                searchtreatment: widget.searchtreatment,
                treatmentName: '${widget.treatmentName ?? ''}',
                cityName: "${widget.cityName ?? ''}",
              ),
            ),
          );
        }
        // Return false to prevent default back navigation
        return false;
      },

      // extendBody: true,
      hasScrollView: true,
      hasBouncingScrollPhysics: false,
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.w),
        child: CustomAppBar(
          onBackPressed: () {
            print(widget.treatmentName);
            print(widget.cityName);
            // return;
            widget.screenName == "FaviListDetailoView"
                ? Navigator.push(
                    context,
                    SlidePageRoute(
                      page: FaviListDetailoView(
                        packageId: watch.packageId.toString(),
                        // refresh: true,
                      ),
                      direction: SlideDirection
                          .left, // Specify the slide direction here
                      delay: const Duration(milliseconds: 5000),
                    ),
                  )
                : Navigator.push(
                    context,
                    SlidePageRoute(
                      page: SearchView(
                          searchtreatment: widget.searchtreatment,
                          treatmentName: widget.treatmentName ?? '',
                          // refresh: true,
                          cityName: widget.cityName ?? ''),
                      direction: SlideDirection
                          .left, // Specify the slide direction here
                      delay: const Duration(milliseconds: 5000),
                    ),
                  );
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => SearchView(
            // refresh: true,
            // cityName: "${watch.packageDetails?.cityName}")));
          },
          hasBackButton: true,
          hasMdTitle: false,
          // drawerTitle: "Orders",
        ),
      ),
      content: watch.isLoading
          ? Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                const Loader(),
              ],
            )
          : Builder(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 35.w, bottom: 35.w),
                      // height: 100.h,
                      width: ScreenUtil().screenWidth,
                      color: Colors.black,
                      child: Column(
                        // sort
                        children: [
                          Text(
                            "SEARCH",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: kDefaultActiveColor,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "RESULTS",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.white,
                                fontSize: 65.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 20.w, bottom: 17.w),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10.w,
                                      right: 8.w,
                                      top: 5.w,
                                      bottom: 10.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.10),
                                          // offset: Offset(2, 2),
                                          blurRadius: 20,
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '${watch.packageDetails?.packageName ?? ''}',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color:
                                                      const Color(0xff212121),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              watch.packageDetails?.verified ==
                                                      "yes"
                                                  ? Image.asset(
                                                      'assets/images/Group 9.png',
                                                      width: 70.w,
                                                      height: 25.h,
                                                    )
                                                  : Container(),
                                              watch.packageDetails
                                                          ?.featuredStatus ==
                                                      "approved"
                                                  ? Container(
                                                      padding: EdgeInsets.only(
                                                          left: 8,
                                                          top: 4,
                                                          right: 8.w,
                                                          bottom: 4),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
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
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    )
                                                  : Container()
                                            ],
                                          )

                                          // SvgPicture.asset(
                                          //   'assets/icons/Group 9.svg',
                                          // width: 20.w,
                                          // height: 21.h,
                                          // ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: 2.h,
                                      // ),
                                      /////////////
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/location.svg',
                                                // alignment: Alignment.topRight,
                                              ),
                                              Text(
                                                '${watch.packageDetails?.cityName ?? ''}',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: 'Campton',
                                                    color:
                                                        const Color(0xff212121),
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/time.svg',
                                                alignment: Alignment.topRight,
                                              ),
                                              Text(
                                                'Treatment Periods-${watch.packageDetails?.treatmentPeriodInDays ?? ''} Days',
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color:
                                                        const Color(0xff212121),
                                                    fontSize: 12.sp,
                                                    fontStyle: FontStyle.italic,
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
                                      //////////////////
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //   "Package Included",
                                          //   style: TextStyle(
                                          //     fontFamily: 'Campton',
                                          //     color: const Color(0xff4CDB06),
                                          //     fontSize: 14.sp,
                                          //     fontWeight: FontWeight.w700,
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                child: ListView.builder(
                                                  // padding: EdgeInsets.zero,
                                                  padding: EdgeInsets.only(
                                                      top: 20.w),
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: watch
                                                          .packageDetails
                                                          ?.otherServices
                                                          ?.length ??
                                                      0,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final element = watch
                                                        .packageDetails
                                                        ?.otherServices?[index];

                                                    return Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 8.w),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/icons/katman_1.png",
                                                            width: 10.w,
                                                            height: 7.h,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Text(
                                                            element ?? '',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Campton',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          // SvgPicture.asset(
                                                          //   'assets/icons/katman_1.png',
                                                          //   // alignment: Alignment.topRight,
                                                          // ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Positioned(
                                                // top: 10.w,
                                                child: Text(
                                                  "Package Included",
                                                  style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color:
                                                        const Color(0xff4CDB06),
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              // Positioned(
                                              //   right: 0,
                                              //   top: 10.w,
                                              //   child: GestureDetector(
                                              //     onTap: () {
                                              //       Navigator.push(
                                              //         context,
                                              //         SlidePageRoute(
                                              //           page: SearchView(
                                              //               treatmentName: watch
                                              //                   .packageDetails
                                              //                   ?.treatmentName,
                                              //               // refresh: true,
                                              //               cityName:
                                              //                   "${watch.packageDetails?.cityName}"),
                                              //           direction: SlideDirection
                                              //               .left, // Specify the slide direction here
                                              //           delay: const Duration(
                                              //               milliseconds: 5000),
                                              //         ),
                                              //       );
                                              //     },
                                              //     child: Container(
                                              //       child: SvgPicture.asset(
                                              //         "assets/icons/view_details.svg",
                                              //         width: 50.w,
                                              //         height: 30.h,
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              watch.packageDetails?.favCheck !=
                                                      'yes'
                                                  ? Positioned(
                                                      right: 0,
                                                      top: 10.w,
                                                      child: FavoriteButton(
                                                          color: const Color(
                                                              0xffF55C5C),
                                                          borderRadius: 5,
                                                          width: 125.w,
                                                          height: 31.h,
                                                          onTap: () {
                                                            print(watch
                                                                .packageId
                                                                .toString());
                                                            // return;
                                                            read.addToFav(
                                                                context,
                                                                watch.packageId
                                                                    .toString());
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    shape:
                                                                        const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(20.0)),
                                                                    ),
                                                                    backgroundColor:
                                                                        const Color(
                                                                            0xffF55C5C),
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      right:
                                                                          15.w,
                                                                    ),
                                                                    scrollable:
                                                                        true,
                                                                    content:
                                                                        Container(
                                                                      height:
                                                                          120.h,
                                                                      width:
                                                                          200.w,
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: <Widget>[
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/icons/CloseSquare.svg',
                                                                              // width: 30,
                                                                              // alignment: Alignment.topRight,
                                                                            ),
                                                                          ),
                                                                          Center(
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                SvgPicture.asset(
                                                                                  'assets/icons/favorite.svg',
                                                                                  width: 54.w,
                                                                                  height: 37.h,
                                                                                  // alignment: Alignment.topRight,
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10.h,
                                                                                ),
                                                                                Text(
                                                                                  "Added to favorites!",
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Campton',
                                                                                    color: Colors.white,
                                                                                    fontSize: 15.sp,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/icons/favorite.svg',
                                                                // width: 30,
                                                                // alignment: Alignment.topRight,
                                                              ),
                                                              RichText(
                                                                text: TextSpan(
                                                                  text: ' Add',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Campton',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),

                                                                  /*defining default style is optional */
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text:
                                                                          ' Favorite',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Campton',
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: 10
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    )
                                                  : Positioned(
                                                      right: 0,
                                                      top: 10.w,
                                                      child: FavoriteButton(
                                                          color: Color.fromARGB(
                                                              255,
                                                              194,
                                                              191,
                                                              191),
                                                          borderRadius: 5,
                                                          width: 125.w,
                                                          height: 31.h,
                                                          onTap: () {
                                                            print(watch
                                                                .packageId
                                                                .toString());
                                                            // return;
                                                            // read.addToFav(
                                                            //     context,
                                                            //     watch.packageId
                                                            //         .toString());
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/icons/favorite.svg',
                                                                // width: 30,
                                                                // alignment: Alignment.topRight,
                                                              ),
                                                              RichText(
                                                                text: TextSpan(
                                                                  text: ' Add',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Campton',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text:
                                                                          ' Favorite',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Campton',
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: 10
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )),
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
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Price",
                                                    style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      letterSpacing: -1,
                                                      color:
                                                          kDefaultActiveColor,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  watch.packageDetails
                                                              ?.discountPercetage !=
                                                          ''
                                                      ? Row(
                                                          children: [
                                                            RichText(
                                                              text: TextSpan(
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'Campton',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      -1,
                                                                ),
                                                                children: [
                                                                  WidgetSpan(
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        if ((double.tryParse(watch.packageDetails?.salePrice ?? '0') ?? double.infinity) <
                                                                            (double.tryParse(watch.packageDetails?.packagePrice ?? '0') ??
                                                                                double.infinity))
                                                                          Positioned.fill(
                                                                            child:
                                                                                CustomPaint(
                                                                              painter: SlantedLinePainter(color: Colors.red),
                                                                            ),
                                                                          ),
                                                                        if ((double.tryParse(watch.packageDetails?.salePrice ?? '0') ?? double.infinity) <
                                                                            (double.tryParse(watch.packageDetails?.packagePrice ?? '0') ??
                                                                                double.infinity))
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                (watch.packageDetails?.packagePrice?.toString() ?? '0'),
                                                                                style: TextStyle(
                                                                                  fontFamily: 'Campton',
                                                                                  color: Colors.black,
                                                                                  fontSize: 17.sp,
                                                                                  letterSpacing: -1,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  decoration: TextDecoration.none, // Remove default line-through
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '  ₺',
                                                                                style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 17.sp,
                                                                                  letterSpacing: -1,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  decoration: TextDecoration.none, // Remove default line-through
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            watch.packageDetails
                                                                        ?.discountPercetage !=
                                                                    ''
                                                                ? Text(
                                                                    ' ( ${watch.packageDetails?.discountPercetage ?? ''}% Discount )',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15.sp,
                                                                      letterSpacing:
                                                                          -1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none, // Remove default line-through
                                                                    ),
                                                                  )
                                                                : Container()
                                                          ],
                                                        )
                                                      : Container(),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${watch.packageDetails?.salePrice ?? '0'}',
                                                        style: TextStyle(
                                                          fontFamily: 'Campton',
                                                          color: Colors.black,
                                                          fontSize: 19.sp,
                                                          letterSpacing: -1,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          decoration: TextDecoration
                                                              .none, // Remove default line-through
                                                        ),
                                                      ),
                                                      Text(
                                                        ' ₺',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 19.sp,
                                                          letterSpacing: -1,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          decoration: TextDecoration
                                                              .none, // Remove default line-through
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //       MainAxisAlignment.start,
                                                  //   crossAxisAlignment:
                                                  //       CrossAxisAlignment
                                                  //           .start,
                                                  //   children: [
                                                  //     Text(
                                                  //       "${watch.packageDetails?.packagePrice ?? ''}",
                                                  //       style: TextStyle(
                                                  //         fontFamily: 'Campton',
                                                  //         color: Colors.black,
                                                  //         fontSize: 19.sp,
                                                  //         letterSpacing: -1,
                                                  //         fontWeight:
                                                  //             FontWeight.w700,
                                                  //       ),
                                                  //     ),
                                                  //     Text(
                                                  //       " ₺",
                                                  //       style: TextStyle(
                                                  //         // fontFamily: 'Campton',
                                                  //         color: Colors.black,
                                                  //         fontSize: 19.sp,
                                                  //         letterSpacing: -1,
                                                  //         fontWeight:
                                                  //             FontWeight.w700,
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  // widget.packagePurchase ==
                                                  //         "yes"
                                                  //     ?
                                                  FavoriteButton(
                                                    borderRadius: 5,
                                                    width: 125.w,
                                                    height: 31.h,
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              AlertDialog(
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(15.0))),

                                                                // insetPadding:
                                                                //    EdgeInsets.all(0),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            0.0),

                                                                content:
                                                                    Container(
                                                                  width: ScreenUtil()
                                                                      .screenWidth,
                                                                  height: 350.h,
                                                                  // padding:
                                                                  //     EdgeInsets.only(bottom: 10.w),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(15), // Image border
                                                                              child: SizedBox.fromSize(
                                                                                // size: Size.fromRadius(
                                                                                //     10), // Image radius
                                                                                child: const Image(image: AssetImage("assets/images/green_pop_up.png")),
                                                                              ),
                                                                            ),

                                                                            // Image(
                                                                            //     image: AssetImage(
                                                                            //         "assets/images/pop__new_.png")),
                                                                          ),
                                                                          Positioned(
                                                                              top: 15,
                                                                              right: 15,
                                                                              // left: 0,
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                  // Navigator.push(
                                                                                  //   context,
                                                                                  //   MaterialPageRoute(
                                                                                  //       builder: (context) =>
                                                                                  //           AllOrderDetailView()),
                                                                                  // );
                                                                                  // Now using the context obtained from the builder
                                                                                },
                                                                                child: SvgPicture.asset("assets/icons/red_close.svg"),
                                                                              )),
                                                                          Positioned(
                                                                            top:
                                                                                15,
                                                                            right:
                                                                                0,
                                                                            left:
                                                                                0,
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/icons/pop_up.svg',
                                                                              height: 50.h,
                                                                              width: 50.w,
                                                                              // alignment: Alignment.topRight,
                                                                            ),
                                                                          ),
                                                                          Positioned(
                                                                            top:
                                                                                80.w,
                                                                            left:
                                                                                120.w,
                                                                            // left: 0,
                                                                            child:
                                                                                Text(
                                                                              "Step 1",
                                                                              style: TextStyle(color: Colors.black, letterSpacing: -1, fontFamily: 'Campton', fontSize: 20.sp, fontWeight: FontWeight.w700),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            38.h,
                                                                      ),
                                                                      Text(
                                                                        "Who is this treatment for?",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            letterSpacing:
                                                                                -1,
                                                                            fontFamily:
                                                                                'Campton',
                                                                            fontSize:
                                                                                17.sp,
                                                                            fontWeight: FontWeight.w600),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            30.h,
                                                                      ),
                                                                      widget.packagePurchase ==
                                                                              "yes"
                                                                          ? PrimaryButton(
                                                                              // borderColor: Colors.black,
                                                                              width: 250.w,
                                                                              height: 40.w,

                                                                              borderRadius: 30,

                                                                              color: const Color(0xff4CDB06),
                                                                              // color: kDefaultActiveColor,
                                                                              onTap: () {
                                                                                // Utils.showPrimarySndackbar(context, 'You can purchase the same package only after the previous package has been completed or canceled', type: SnackType.success);
                                                                                Fluttertoast.showToast(
                                                                                  msg: "You can purchase the same package only after the previous package has been completed or canceled",
                                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                                  gravity: ToastGravity.BOTTOM,
                                                                                  timeInSecForIosWeb: 1,
                                                                                  backgroundColor: Colors.red,
                                                                                  textColor: Colors.white,
                                                                                  fontSize: 16.0,
                                                                                );
                                                                                // print(purchaseType)
                                                                                // Navigator.push(
                                                                                //   context,
                                                                                //   SlidePageRoute(
                                                                                //     page: PaymentDetailsView(packageId: watch.packageId.toString(), purchaseType: "myself"),
                                                                                //     direction: SlideDirection.left, // Specify the slide direction here
                                                                                //     delay: Duration(milliseconds: 2000),
                                                                                //   ),
                                                                                // );
                                                                              },
                                                                              child: Text(
                                                                                "Myself",
                                                                                style: TextStyle(
                                                                                    color: Colors.black,
                                                                                    letterSpacing: -1,
                                                                                    fontFamily: 'Campton',
                                                                                    // letterSpacing: .5,
                                                                                    fontSize: 16.sp,
                                                                                    fontWeight: FontWeight.w600),
                                                                              ),
                                                                            )
                                                                          : PrimaryButton(
                                                                              // borderColor: Colors.black,
                                                                              width: 250.w,
                                                                              height: 40.w,

                                                                              borderRadius: 30,

                                                                              color: const Color(0xff4CDB06),
                                                                              // color: kDefaultActiveColor,
                                                                              onTap: () {
                                                                                // print(purchaseType)
                                                                                Navigator.push(
                                                                                  context,
                                                                                  SlidePageRoute(
                                                                                    page: PaymentDetailsView(treatmentName: widget.treatmentName, packageId: watch.packageId.toString(), purchaseType: "myself"),
                                                                                    direction: SlideDirection.left, // Specify the slide direction here
                                                                                    delay: Duration(milliseconds: 2000),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                "Myself",
                                                                                style: TextStyle(
                                                                                    color: Colors.black,
                                                                                    letterSpacing: -1,
                                                                                    fontFamily: 'Campton',
                                                                                    // letterSpacing: .5,
                                                                                    fontSize: 16.sp,
                                                                                    fontWeight: FontWeight.w600),
                                                                              ),
                                                                            ),
                                                                      SizedBox(
                                                                        height:
                                                                            17.w,
                                                                      ),
                                                                      PrimaryButton(
                                                                        // borderColor: Colors.black,
                                                                        width:
                                                                            250.w,
                                                                        height:
                                                                            40.w,

                                                                        borderRadius:
                                                                            30,
                                                                        borderColor:
                                                                            black,
                                                                        color: Colors
                                                                            .transparent,
                                                                        // color: kDefaultActiveColor,
                                                                        onTap:
                                                                            () {
                                                                          print(watch
                                                                              .packageId
                                                                              .toString());

                                                                          // Navigator.pop(context);
                                                                          Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                                builder: (context) => InformationFormView(
                                                                                      // cityName: watch.,
                                                                                      packageId: watch.packageId.toString(),
                                                                                    )),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          "Other",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              letterSpacing: -1,
                                                                              fontFamily: 'Campton',
                                                                              // letterSpacing: .5,
                                                                              fontSize: 16.sp,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                    },
                                                    color:
                                                        const Color(0xff4CDB06),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/icons/Buy.svg',
                                                          // width: 30,
                                                          // alignment: Alignment.topRight,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: ' Purchase',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),

                                                            /*defining default style is optional */
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text:
                                                                    ' Package',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                  // : FavoriteButton(
                                                  //     borderRadius: 5,
                                                  //     width: 125.w,
                                                  //     height: 31.h,
                                                  //     onTap: () {
                                                  //       Utils.showPrimarySnackbar(
                                                  //           context,
                                                  //           'You can purchase the same package only after the previous package has been completed or canceled',
                                                  //           type: SnackType
                                                  //               .success);
                                                  //     },
                                                  //     color: const Color(
                                                  //         0xff4CDB06),
                                                  //     child: Row(
                                                  //       mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .center,
                                                  //       children: [
                                                  //         SvgPicture.asset(
                                                  //           'assets/icons/Buy.svg',
                                                  //           // width: 30,
                                                  //           // alignment: Alignment.topRight,
                                                  //         ),
                                                  //         RichText(
                                                  //           text: TextSpan(
                                                  //             text:
                                                  //                 ' Purchase',
                                                  //             style: TextStyle(
                                                  //                 color: Colors
                                                  //                     .black,
                                                  //                 fontSize:
                                                  //                     10.sp,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w700),

                                                  //             /*defining default style is optional */
                                                  //             children: <TextSpan>[
                                                  //               TextSpan(
                                                  //                 text:
                                                  //                     ' Package',
                                                  //                 style: TextStyle(
                                                  //                     color: Colors
                                                  //                         .black,
                                                  //                     fontSize: 10
                                                  //                         .sp,
                                                  //                     fontWeight:
                                                  //                         FontWeight.w400),
                                                  //               ),
                                                  //             ],
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //   )
                                                ],
                                              ),
                                              // SizedBox(
                                              //   height: 5.w,
                                              // ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 27.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReviewScreen(
                                                          packageId: watch
                                                              .packageId
                                                              .toString(),
                                                        )),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Reviews",
                                                  style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: kDefaultActiveColor,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  " (${watch.packageDetails?.totalReviews ?? 0})",
                                                  style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: black,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   width: 2.w,
                                                // ),
                                                // Text(
                                                //   "${watch.packageDetails?.totalReviews ?? 0}",
                                                //   style: TextStyle(
                                                //     fontFamily: 'Campton',
                                                //     color: Colors.black,
                                                //     fontSize: 12.sp,
                                                //     fontWeight: FontWeight.w500,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),

                                          Row(
                                            children: [
                                              for (int i = 0; i < 5; i++)
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      i <
                                                              watch
                                                                  .packageDetails!
                                                                  .reviewStars!
                                                          ? 'assets/icons/black-star.svg'
                                                          : 'assets/icons/black-star.svg',
                                                      width: 15,
                                                      color: i <
                                                              watch
                                                                  .packageDetails!
                                                                  .reviewStars!
                                                          ? Colors.green
                                                          : Colors.black,
                                                      // alignment: Alignment.topRight,
                                                    ),
                                                    if (i < 4)
                                                      SizedBox(width: 3.w),
                                                  ],
                                                ),
                                            ],
                                          ),

                                          // SvgPicture.asset(
                                          // 'assets/icons/Star.svg',
                                          // width: 15.w,
                                          // alignment: Alignment.topRight,
                                          // ),

                                          Text(
                                            watch.packageDetails
                                                    ?.verboseReview ??
                                                '',
                                            style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          // Text(
                                          //   "Excellent",
                                          //   style: TextStyle(
                                          //     fontFamily: 'Campton',
                                          //     color: Colors.black,
                                          //     fontSize: 16.sp,
                                          //     fontWeight: FontWeight.w700,
                                          //   ),
                                          // ),
                                          watch.galleryList?.isNotEmpty == true
                                              ? SizedBox(
                                                  height: 30.w,
                                                )
                                              : Container(),
                                          watch.galleryList?.isNotEmpty == true
                                              ? Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Gallery',
                                                        style: TextStyle(
                                                          fontFamily: 'Campton',
                                                          color:
                                                              kDefaultActiveColor,
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 17.w,
                                                      ),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        height: 130,
                                                        child: GridView.builder(
                                                          itemCount: watch
                                                                  .galleryList
                                                                  ?.length ??
                                                              0,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          shrinkWrap: true,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing: 5,
                                                            childAspectRatio:
                                                                0.6,
                                                            mainAxisSpacing: 5,
                                                          ),
                                                          itemBuilder:
                                                              (context, index) {
                                                            final element =
                                                                watch.galleryList?[
                                                                    index];
                                                            final isVideo =
                                                                element !=
                                                                        null &&
                                                                    element.endsWith(
                                                                        '.mp4');
                                                            return GestureDetector(
                                                              onTap: () =>
                                                                  showDialog(
                                                                context:
                                                                    context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    Scaffold(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  body: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          300.h,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Positioned(
                                                                            right:
                                                                                0,
                                                                            left:
                                                                                0,
                                                                            child: isVideo
                                                                                ? VideoPlayerWidget(videoUrl: element)
                                                                                : AppNetworkImages(
                                                                                    showShopImage: true,
                                                                                    imageUrl: '$element',
                                                                                    height: 200.h,
                                                                                    width: 300.w,
                                                                                  ),
                                                                          ),
                                                                          Positioned(
                                                                            top:
                                                                                0,
                                                                            right:
                                                                                40,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => Navigator.pop(context),
                                                                              child: SvgPicture.asset(
                                                                                'assets/icons/CloseSquare.svg',
                                                                                height: 30.h,
                                                                                width: 30.w,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              child: isVideo
                                                                  ? Container(
                                                                      height:
                                                                          50,
                                                                      width: 70,
                                                                      color: Color(
                                                                          0xffF5F5F5),
                                                                      child: Center(
                                                                          child: Icon(
                                                                              Icons.play_arrow,
                                                                              color: kDefaultActiveColor)),
                                                                    )
                                                                  : AppNetworkImages(
                                                                      showShopImage:
                                                                          true,
                                                                      imageUrl:
                                                                          '$element',
                                                                      // height:
                                                                      //     20,
                                                                      // width: 20,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                          watch.packageDetails?.overview != ''
                                              ? SizedBox(
                                                  height: 30.w,
                                                )
                                              : Container(),
                                          watch.packageDetails?.overview != ''
                                              ? Text(
                                                  "Overview",
                                                  style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: kDefaultActiveColor,
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )
                                              : SizedBox(
                                                  // height: 5.h,
                                                  ),
                                          Text(
                                            textAlign: TextAlign.justify,
                                            "${watch.packageDetails?.overview ?? ''}",
                                            style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 10.h,
                                          // ),
                                          watch.packageGallery?.isNotEmpty ==
                                                  true
                                              ? SizedBox(
                                                  // height: 30.w,
                                                  )
                                              : Container(),
                                          watch.packageGallery?.isNotEmpty ==
                                                  true
                                              ? Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Package Gallery',
                                                        style: TextStyle(
                                                          fontFamily: 'Campton',
                                                          color:
                                                              kDefaultActiveColor,
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 17.w,
                                                      ),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        height: 130,
                                                        child: GridView.builder(
                                                          itemCount: watch
                                                                  .packageGallery
                                                                  ?.length ??
                                                              0,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          shrinkWrap: true,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  // maxCrossAxisExtent: 200,
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      5,
                                                                  childAspectRatio:
                                                                      0.6,
                                                                  mainAxisSpacing:
                                                                      5),
                                                          itemBuilder:
                                                              (context, index) {
                                                            final element =
                                                                watch.packageGallery?[
                                                                    index];
                                                            final isVideo =
                                                                element !=
                                                                        null &&
                                                                    element.endsWith(
                                                                        '.mp4');
                                                            return GestureDetector(
                                                              onTap: () =>
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          Scaffold(
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            body:
                                                                                Align(
                                                                              alignment: Alignment.center,
                                                                              child: Container(
                                                                                // color: Colors.blueAccent,
                                                                                height: 300.h,
                                                                                child: Stack(
                                                                                  children: [
                                                                                    Positioned(
                                                                                      right: 20,
                                                                                      left: 20,
                                                                                      child: isVideo
                                                                                          ? VideoPlayerWidget(videoUrl: element)
                                                                                          : AppNetworkImages(
                                                                                              showShopImage: true,
                                                                                              imageUrl: '$element',
                                                                                              height: 200.h,
                                                                                              width: 300.w,
                                                                                            ),
                                                                                      // Container(
                                                                                      //   // color: Colors.blue,
                                                                                      //   padding: const EdgeInsets.only(top: 40),
                                                                                      //   child: AppNetworkImages(showShopImage: true, imageUrl: element, height: 200.h, width: 300.w),
                                                                                      //   // Image.asset('assets/images/Rectangle 559.png', height: 200.h, width: 300.w // Adjust the fit as needed
                                                                                      //   //     ),
                                                                                      // ),
                                                                                    ),
                                                                                    Positioned(
                                                                                        top: 0,
                                                                                        right: 40,
                                                                                        child: GestureDetector(
                                                                                            onTap: () => Navigator.pop(context),
                                                                                            child: SvgPicture.asset(
                                                                                              'assets/icons/CloseSquare.svg',
                                                                                              height: 30.h,
                                                                                              width: 30.w,
                                                                                            )))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )),
                                                              child: isVideo
                                                                  ? Container(
                                                                      height:
                                                                          50,
                                                                      width: 70,
                                                                      color: Color(
                                                                          0xffF5F5F5),
                                                                      child: Center(
                                                                          child: Icon(
                                                                              Icons.play_arrow,
                                                                              color: kDefaultActiveColor)),
                                                                    )
                                                                  : AppNetworkImages(
                                                                      showShopImage:
                                                                          true,
                                                                      imageUrl:
                                                                          '$element',
                                                                      height:
                                                                          50,
                                                                      width: 70,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),

                                                              // child: Image.asset(
                                                              //   'assets/images/Rectangle_556.png',
                                                              //   height: 50,
                                                              //   width: 70,
                                                              //   fit: BoxFit
                                                              //       .fill, // Adjust the fit as needed
                                                              // ),
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                          SizedBox(
                                            height: 20.w,
                                          ),
                                          Text(
                                            "Package Discription",
                                            style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: kDefaultActiveColor,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            textAlign: TextAlign.justify,
                                            "${watch.packageDetails?.packageDescription ?? ''}",
                                            style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 100.h,
                  )
                ],
              );
            }),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Automatically start playing the video
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }
}
