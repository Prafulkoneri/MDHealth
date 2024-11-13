import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/favourt/controller/fav_controller.dart';
import 'package:md_health/Screens/favourt/view/food_fav_list_view.dart';
import 'package:md_health/Screens/favourt/view/health_favt_pa_list_details.dart';
import 'package:md_health/Screens/favourt/view/hs_fav_list_view.dart';
import 'package:md_health/Screens/favourt/view/shop_fav_list_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class FavourtListView extends StatefulWidget {
  const FavourtListView({super.key});

  @override
  State<FavourtListView> createState() => _FavourtListViewState();
}

class _FavourtListViewState extends State<FavourtListView> {
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
    final watch = context.watch<FavoriteListController>();
    return BaseScreen(
        onWillPop: () async {
          // Navigator.pushReplacement(
          //         context,
          //         SlidePageRoute(
          //           page: SearchDetailsView(
          //             packageId: watch.packageId,
          //             // packageId: watch.packageId,
          //           ),
          //           direction:
          //               SlideDirection.left, // Specify the slide direction here
          //           delay: Duration(milliseconds: 5000),
          //         ),
          //         // MaterialPageRoute(
          //         //     builder: (context) => SearchView(
          //         // packageId: watch.packageId,
          //         // refresh: true,
          //         // cityName: widget.cityName
          //         // ))
          //       );

          return false;
        },
        backgroundColor: Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(115.h),
          child: CustomAppBar(
            hasMdTitle: false,
            drawerTitle: "Favorites",
          ),
        ),
        content: Column(
          children: [
            SizedBox(
              height: 30.w,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: FaviListDetailoView(packageId: ""),
                      direction: SlideDirection
                          .right, // Specify the slide direction here
                      delay: Duration(milliseconds: 5000),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 18.w,
                    right: 18.w,
                  ),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 100,
                      // ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 30.w, top: 15.w, bottom: 15.w),
                          decoration: BoxDecoration(
                              color: Color(0xffFBFBFB),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  // offset: Offset(2, 2),
                                  blurRadius: 20,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/black_favourt.png",
                                    width: 35.w,
                                    height: 27.w,
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'MD',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'health',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Favorites ',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '(${watch.addCount?.mdhealthcount.toString() ?? 0})',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SvgPicture.asset("assets/icons/forword.svg"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )),
            ///////////////////////////////////
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: ShopFavListView(),
                      direction: SlideDirection
                          .right, // Specify the slide direction here
                      delay: Duration(milliseconds: 5000),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 18.w,
                    right: 18.w,
                  ),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 100,
                      // ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 30.w, top: 15.w, bottom: 15.w),
                          decoration: BoxDecoration(
                              color: Color(0xffFBFBFB),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  // offset: Offset(2, 2),
                                  blurRadius: 20,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/black_favourt.png",
                                    width: 35.w,
                                    height: 27.w,
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'MD',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'shop',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Favorites ',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '(${watch.shopCount ?? 0})',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SvgPicture.asset("assets/icons/forword.svg"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: FoodFavListView(packageId: ""),
                      direction: SlideDirection
                          .right, // Specify the slide direction here
                      delay: Duration(milliseconds: 5000),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 18.w,
                    right: 18.w,
                  ),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 100,
                      // ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 30.w, top: 15.w, bottom: 15.w),
                          decoration: BoxDecoration(
                              color: Color(0xffFBFBFB),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  // offset: Offset(2, 2),
                                  blurRadius: 20,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/black_favourt.png",
                                    width: 35.w,
                                    height: 27.w,
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'MD',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'food',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Favorites ',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '(${watch.foodfavouriteCount ?? 0})',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SvgPicture.asset("assets/icons/forword.svg"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )),
            /////////////////////HM///////
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: HsFoodFavListView(packageId: ""),
                      direction: SlideDirection
                          .right, // Specify the slide direction here
                      delay: Duration(milliseconds: 5000),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 18.w,
                    right: 18.w,
                  ),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 100,
                      // ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 30.w, top: 15.w, bottom: 15.w),
                          decoration: BoxDecoration(
                              color: Color(0xffFBFBFB),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  // offset: Offset(2, 2),
                                  blurRadius: 20,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/black_favourt.png",
                                    width: 35.w,
                                    height: 27.w,
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'MD',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'HomeServices',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Favorites ',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '(${watch.hsFacCount ?? ''})',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SvgPicture.asset("assets/icons/forword.svg"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ))
          ],
        )
        // : Container(
        //     child: Text("njbheuuiynetbnui"),
        );
  }
}
