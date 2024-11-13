import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/favourt/controller/fav_controller.dart';
import 'package:md_health/Screens/favourt/view/favt_list.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class HsFoodFavListView extends StatefulWidget {
  final String? packageId;
  const HsFoodFavListView({super.key, required this.packageId});

  @override
  State<HsFoodFavListView> createState() => _HsFoodFavListViewState();
}

class _HsFoodFavListViewState extends State<HsFoodFavListView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteListController>().initState(
            context,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<FavoriteListController>();
    final watch = context.read<FavoriteListController>();
    return BaseScreen(
        onWillPop: () async {
          Navigator.push(
            context,
            SlidePageRoute(
              page: const FavourtListView(),
              direction:
                  SlideDirection.left, // Specify the slide direction here
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
                  page: const FavourtListView(),
                  direction:
                      SlideDirection.left, // Specify the slide direction here
                  delay: const Duration(milliseconds: 5000),
                ),
              );
            },
            hasBackButton: true,
            hasMdTitle: false,
            drawerTitle: "",
            drawerStyle: RichText(
              text: TextSpan(
                text: 'MD',
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.white,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700),

                /*defining default style is optional */
                children: <TextSpan>[
                  TextSpan(
                    text: 'Services',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: ' Favorites',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ),
        content: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                    left: 16.w, right: 14.w, top: 50.w, bottom: 17.w),
                child: watch.hsFavListdata?.isNotEmpty == true
                    ? ListView.builder(
                        // padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: watch.hsFavListdata?.length ?? 0,
                        itemBuilder: (context, index) {
                          final element = watch.hsFavListdata?[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 10.w),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 18.w,
                                    right: 18.w,
                                    bottom: 21.w,
                                    top: 18.w),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: Text(
                                        element?.packageName ?? "",
                                        // "Hearth Valve Replacement Surgery",
                                        style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: const Color(0xff212121),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
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
                                            Container(
                                              width: 100.w,
                                              child: Text(
                                                "${element?.cityName}",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: 'Campton',
                                                    color:
                                                        const Color(0xff212121),
                                                    fontSize: 10.sp,
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
                                              // alignment: Alignment.topRight,
                                            ),
                                            Text(
                                              "Treatment Periods ${element?.treatmentPeriodInDays} Days",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Color(0xff212121),
                                                  fontSize: 10.sp,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Price",
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: kDefaultActiveColor,
                                                    fontSize: 14.sp,
                                                    // fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.start,
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text:
                                                          '${element?.packagePrice ?? 0}',
                                                      style: TextStyle(
                                                          fontFamily: 'Campton',
                                                          color: black,
                                                          fontSize: 16.sp,
                                                          letterSpacing: -1,
                                                          // fontStyle: FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w700),

                                                      /*defining default style is optional */
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: '₺',
                                                          style:
                                                              GoogleFonts.inter(
                                                            textStyle:
                                                                TextStyle(
                                                                    //  fontFamily: 'Campton',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   "${element?.packagePrice ?? 0}",
                                                  //   // "34.000,00 ₺",
                                                  //   style: TextStyle(
                                                  //       fontFamily: 'Campton',
                                                  //       color: black,
                                                  //       fontSize: 16.sp,
                                                  //       letterSpacing: -1,
                                                  //       // fontStyle: FontStyle.italic,
                                                  //       fontWeight:
                                                  //           FontWeight.w700),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Row(
                                            children: [
                                              PrimaryButton(
                                                borderRadius: 5,
                                                height: 30.h,
                                                width: 85.w,
                                                color: const Color(0xff4CDB06),
                                                onTap: () {
                                                  // print(
                                                  //   element?.id.toString(),
                                                  // );
                                                  // return;
                                                  // Navigator.push(
                                                  //   context,
                                                  //   SlidePageRoute(
                                                  //     page: DietPlanResult(
                                                  //       // foodPackageId: element
                                                  //       //     ?.id
                                                  //       //     .toString(),
                                                  //       subscriptionType:
                                                  //           "Food",
                                                  //       food: "Daily",
                                                  //       calories: "240.h",
                                                  //       // cityName: element
                                                  //       //     ?.cityName
                                                  //       //     .toString(),
                                                  //       // packageId: element
                                                  //       //     ?.packageId
                                                  //       //     .toString(),
                                                  //       // screenName:
                                                  //       //     "FaviListDetailoView"
                                                  //     ),
                                                  //     direction: SlideDirection
                                                  //         .right, // Specify the slide direction here
                                                  //     delay: Duration(
                                                  //         milliseconds: 5000),
                                                  //   ),
                                                  // );
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           FavtDetailView()),
                                                  // );
                                                },
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'Go',
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w700),

                                                    /*defining default style is optional */
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: ' Product',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Campton',
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              PrimaryButton(
                                                  borderRadius: 5,
                                                  height: 30.h,
                                                  width: 85.w,
                                                  color:
                                                      const Color(0xffF55C5C),
                                                  onTap: () {
                                                    print(
                                                        element?.id.toString());
                                                    // return;
                                                    //removeFoodToFav(context, foodID)
                                                    read.hsremoveToFav(context,
                                                        element?.id.toString());
                                                    // showDialog(
                                                    //     context: context,
                                                    //     builder: (BuildContext
                                                    //         context) {
                                                    //       return AlertDialog(
                                                    //         shape:
                                                    //             const RoundedRectangleBorder(
                                                    //           borderRadius: BorderRadius
                                                    //               .all(Radius
                                                    //                   .circular(
                                                    //                       20.0)),
                                                    //         ),
                                                    //         backgroundColor:
                                                    //             const Color(
                                                    //                 0xffF55C5C),

                                                    //         // contentPadding:
                                                    //         //     EdgeInsets.symmetric(
                                                    //         //         horizontal:
                                                    //         //             5.w,
                                                    //         //         vertical:
                                                    //         //             5),
                                                    //         scrollable: true,
                                                    //         content: Column(
                                                    //           mainAxisAlignment:
                                                    //               MainAxisAlignment
                                                    //                   .center,
                                                    //           crossAxisAlignment:
                                                    //               CrossAxisAlignment
                                                    //                   .end,
                                                    //           children: <Widget>[
                                                    //             GestureDetector(
                                                    //               onTap: () {
                                                    //                 Navigator.pop(
                                                    //                     context);
                                                    //               },
                                                    //               child:
                                                    //                   SvgPicture
                                                    //                       .asset(
                                                    //                 'assets/icons/CloseSquare.svg',
                                                    //                 // width: 30,
                                                    //                 // alignment: Alignment.topRight,
                                                    //               ),
                                                    //             ),
                                                    //             Center(
                                                    //               child: Column(
                                                    //                 children: [
                                                    //                   SvgPicture
                                                    //                       .asset(
                                                    //                     'assets/icons/favorite.svg',
                                                    //                     width:
                                                    //                         54.w,
                                                    //                     height:
                                                    //                         37.h,
                                                    //                     // alignment: Alignment.topRight,
                                                    //                   ),
                                                    //                   // SizedBox(
                                                    //                   //   height:
                                                    //                   //       10.h,
                                                    //                   // ),
                                                    //                   const Text(
                                                    //                     "The product has been removed\n from favorites.",
                                                    //                     textAlign:
                                                    //                         TextAlign.center,
                                                    //                     style:
                                                    //                         TextStyle(
                                                    //                       fontFamily:
                                                    //                           'Campton',
                                                    //                       color:
                                                    //                           Colors.white,
                                                    //                       fontSize:
                                                    //                           17,
                                                    //                       fontWeight:
                                                    //                           FontWeight.w600,
                                                    //                     ),
                                                    //                   ),
                                                    //                 ],
                                                    //               ),
                                                    //             ),
                                                    //           ],
                                                    //         ),
                                                    //       );
                                                    //     });
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Image(
                                                        image: const AssetImage(
                                                            "assets/images/md white@.png"),
                                                        width: 20.w,
                                                        height: 21.w,
                                                      ),
                                                      Text(
                                                        "Unfav",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Campton',
                                                            color: Colors.white,
                                                            fontSize: 12.sp,
                                                            // fontStyle: FontStyle.italic,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        })
                    : Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120.h,
                            ),
                            SvgPicture.asset(
                              "assets/icons/kiran_no_data_found.svg",
                              // width: 10,
                            ),
                          ],
                        ),
                      )),
          ],
        ));
  }
}
