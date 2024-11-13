import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/Screens/health/home/view/custom_select_box.dart';
import 'package:md_health/Screens/home_services/home_page_services/view/hs_homepage_view.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/controller/home_services_serach_controller.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/view/fillter.dart';
import 'package:md_health/Screens/home_services/search_details/view/search_details_hs.dart';
import 'package:md_health/Screens/health/search/controller/search_view_controller.dart';
import 'package:md_health/Screens/health/search/view/custome_box_sor.dart';
import 'package:md_health/Screens/health/search/view/search_details_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/constants/styles/textstyle.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/favrt_button.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/star_rating.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeServicesSearchView extends StatefulWidget {
  final String? servicesname;
  final String? cityName;
  final String? servicesdate;
  final String? rating;
  final String? services;
  final String? prices;
  final String? searchPackge;
  final String? verifiedCount;

  const HomeServicesSearchView({
    super.key,
    this.cityName,
    this.servicesname,
    this.servicesdate,
    this.rating,
    this.services,
    this.prices,
    this.searchPackge,
    this.verifiedCount,
  });

  @override
  State<HomeServicesSearchView> createState() => _HomeServicesSearchViewState();
}

// bool isExpanded = false;
// bool isExpanded = false;

class _HomeServicesSearchViewState extends State<HomeServicesSearchView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late List<bool> isSelectedList2;
  List<String> list = ['Last Added', 'Price', 'Reviews'];

  @override
  void initState() {
    super.initState();
    print('------------------------------------------------------');
    log("${widget.servicesdate}");
    print('------------------------------------------------------');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeServicesSearchListController>().initState(
          context,
          widget.cityName,
          widget.servicesname,
          widget.rating,
          widget.services,
          widget.prices,
          widget.searchPackge,
          widget.servicesdate);
    });
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    setPagination();
  }

  ScrollController scrollController = ScrollController();

  @override
  setPagination() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          context
              .read<HomeServicesSearchListController>()
              .onScrollMaxExtent(context);
          // context.read<CocViewController>().initState(context);
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showDialog11() {
    debugPrint('helooooooooooooooooooo');
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
                  child: CustomSelectBoxSort(
                    list: const [
                      'Last Added',
                      'Price',
                      'Reviews',
                    ],
                    title: const SelectBoxText(
                      text: 'Choose your treatment city',
                      fontWeight: FontWeight.w700,
                    ),
                    tapFun: () {
                      debugPrint('/////////////////////////helooo//////');
                    },
                    button: true,
                    submitActionFnction: () {
                      Navigator.pop(context);
                      // _animationController.reverse();
                    },
                  ),
                );
              });
        });
  }

  Widget build(BuildContext context) {
    final read = context.read<HomeServicesSearchListController>();
    final watch = context.watch<HomeServicesSearchListController>();
    return BaseScreen(
      onWillPop: () async {
        print('object');
        log('*******************************************');
        Navigator.push(
          context,
          SlidePageRoute(
            page: const HomeServicesView(),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: const Duration(milliseconds: 2000),
          ),
        );
        // Navigator.push(
        //   context,
        //   SlidePageRoute(
        //     page: FaviListDetailoView(
        //       packageId: "watch.packageId.toString()",
        //       // refresh: true,
        //     ),
        //     direction: SlideDirection.left, // Specify the slide direction here
        //     delay: const Duration(milliseconds: 5000),
        //   ),
        // );
        return false;
      },
      // hasappBar: false,
      // extendBody: true,
      hasScrollView: true,
      hasBouncingScrollPhysics: false,
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.push(
            context,
            SlidePageRoute(
              page: const HomeServicesView(),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: const Duration(milliseconds: 2000),
            ),
          );
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => NewMainScreenView()));
        },

        hasBackButton: true,
        hasMdTitle: false,
        // drawerTitle: "Orders",
      ),
      content: watch.isLoading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200.h),
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
                  GestureDetector(
                    onTap: () {
                      print(widget.servicesdate);
                      print(widget.servicesname);
                      print(widget.cityName);
                      // return;
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page: HomeServicesFiltterSearchView(
                              servicesdate: widget.servicesdate,
                              servicesname: widget.servicesname,
                              cityName: widget.cityName),
                          direction: SlideDirection
                              .right, // Specify the slide direction hereF
                          delay: const Duration(milliseconds: 5000),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 27.w, top: 18.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/sort.svg',
                            // alignment: Alignment.topRight,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Row(
                            children: [
                              Text(
                                "sort by",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: const Color(0xff818181),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                " Last Added",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // watch.packageList!.isEmpty
                  //     ?
                  watch.homeServicesSearchDataList?.isNotEmpty == true
                      ? Container(
                          margin: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 18.w, bottom: 17.w),
                          child: Stack(
                            children: [
                              ListView.builder(
                                  // padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: watch
                                          .homeServicesSearchDataList?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    final element = watch
                                        .homeServicesSearchDataList?[index];
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 10.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 10.w,
                                                    right: 8.w,
                                                    top: 5.w,
                                                    bottom: 10.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.10),
                                                        // offset: Offset(2, 2),
                                                        blurRadius: 20,
                                                      ),
                                                    ]),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            '${element?.packageName}',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Campton',
                                                                color: const Color(
                                                                    0xff212121),
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            element?.verified !=
                                                                    "no"
                                                                ? Image.asset(
                                                                    'assets/images/verifiedByHome.png',
                                                                    width: 70.w,
                                                                    height:
                                                                        25.h,
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

                                                    /////////////
                                                    Row(
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
                                                                      FontStyle
                                                                          .italic,
                                                                  fontFamily:
                                                                      'Campton',
                                                                  color: const Color(
                                                                      0xff212121),
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 20.w,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/time.svg',
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                            ),
                                                            Text(
                                                              "Service Period ${element?.treatmentPeriodInDays} days",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Campton',
                                                                color: const Color(
                                                                    0xff212121),
                                                                fontSize: 12.sp,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            element?.featuredStatus !=
                                                                    'pending'
                                                                ? Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    // mainAxisAlignment: ,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 28.0.w),
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.only(
                                                                              left: 8,
                                                                              top: 4,
                                                                              right: 5.w,
                                                                              bottom: 4),
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(20),
                                                                              color: Colors.yellow),
                                                                          child:
                                                                              Text(
                                                                            "Featured",
                                                                            // "Nivea",featured
                                                                            style: TextStyle(
                                                                                // decoration:
                                                                                // TextDecoration.underline,
                                                                                // letterSpacing: 3.5,
                                                                                color: black,
                                                                                fontSize: 10.sp,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Container()
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
/////////////////////////////////////////////////////
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Reviews",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Campton',
                                                            // letterSpacing: -1,
                                                            color:
                                                                kDefaultActiveColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        Text(
                                                          " ( ${element?.reviewCount ?? '0'} )",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Campton',
                                                            // letterSpacing: -1,
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Row(
                                                      children: [
                                                        for (int i = 0;
                                                            i < 5;
                                                            i++)
                                                          SvgPicture.asset(
                                                            i <
                                                                    (double.tryParse(element!.averageRating ??
                                                                            '0') ??
                                                                        0)
                                                                ? 'assets/icons/black-star.svg'
                                                                : 'assets/icons/black-star.svg',
                                                            width: 10,
                                                            color: i <
                                                                    (double.tryParse(element!.averageRating ??
                                                                            '0') ??
                                                                        0)
                                                                ? Colors.green
                                                                : Colors.black,
                                                            // alignment: Alignment.topRight,
                                                          ),
                                                      ],
                                                    ),
                                                    // Row(
                                                    //   children: List.generate(5, (index) {
                                                    //     return SvgPicture.asset(
                                                    //       index <
                                                    //               int.parse(element!
                                                    //                   .averageRating!) // Assuming avgStars is a String representing an integer
                                                    //           ? 'assets/icons/black-star.svg'
                                                    //           : 'assets/icons/black-star.svg',
                                                    //       width: 10,
                                                    //       color: index <
                                                    //               int.parse(element
                                                    //                   .averageRating!) // Convert avgStars to int for comparison
                                                    //           ? Colors.green
                                                    //           : Colors.black,
                                                    //       // alignment: Alignment.topRight,
                                                    //     );
                                                    //   }),
                                                    // ),
                                                    SizedBox(
                                                      height: 8.w,
                                                    ),
                                                    Text(
                                                      "${element?.ratingLabel}",
                                                      style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        // letterSpacing: -1,
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.w,
                                                    ),
                                                    //////////////////
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        // SizedBox(
                                                        //   height: 20.h,
                                                        // ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Package Price",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Campton',
                                                                    // letterSpacing: -1,
                                                                    color:
                                                                        kDefaultActiveColor,
                                                                    fontSize:
                                                                        18.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                                element?.packageDiscount ==
                                                                        ''
                                                                    ? Container()
                                                                    : RichText(
                                                                        text: TextSpan(
                                                                            style: const TextStyle(
                                                                                fontFamily: 'Campton',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: -1),
                                                                            children: [
                                                                              WidgetSpan(
                                                                                child: Stack(
                                                                                  children: [
                                                                                    // Your other content here
                                                                                    if ((double.tryParse(element?.salePrice ?? '0') ?? 0) < (double.tryParse(element?.packagePrice ?? '0') ?? 0))
                                                                                      Positioned.fill(
                                                                                        child: CustomPaint(
                                                                                          painter: SlantedLinePainter(color: Colors.red),
                                                                                        ),
                                                                                      ),
                                                                                    if ((double.tryParse(element?.salePrice ?? '0') ?? 0) < (double.tryParse(element?.packagePrice ?? '0') ?? 0))
                                                                                      Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            '${element?.packagePrice}',
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
                                                                                            ' ₺',
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
                                                                              TextSpan(text: ' ( ${element?.packageDiscount}% Discount )', style: TextStyle(fontFamily: 'Campton', fontSize: 12.sp, fontWeight: FontWeight.w400, color: kDefaultActiveColor))
                                                                            ]),
                                                                      ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      '${element?.salePrice}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Campton',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19.sp,
                                                                        letterSpacing:
                                                                            -1,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        decoration:
                                                                            TextDecoration.none, // Remove default line-through
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      ' ₺',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19.sp,
                                                                        letterSpacing:
                                                                            -1,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        decoration:
                                                                            TextDecoration.none, // Remove default line-through
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            GestureDetector(
                                                              onTap: () async {
                                                                // SharedPreferences pref =
                                                                //     await SharedPreferences
                                                                //         .getInstance();
                                                                // if (pref.getString(
                                                                //         "status") ==
                                                                //     "guestLoggedIn") {
                                                                //   Utils.showLogdinDialog(
                                                                //       context,
                                                                //       "Please Login to continue");
                                                                //   return;
                                                                // }
                                                                // debugPrint(element?.id
                                                                //     .toString());
                                                                // return;
                                                                print(element
                                                                    ?.id);
                                                                // print(
                                                                //     "--------${widget.servicesdate}");
                                                                log('----------${widget.servicesdate}');

                                                                Navigator.push(
                                                                  context,
                                                                  SlidePageRoute(
                                                                    page:
                                                                        HomeServicesSearchDetails(
                                                                      treatmentDate:
                                                                          widget
                                                                              .servicesdate,
                                                                      packageId:
                                                                          element
                                                                              ?.id
                                                                              .toString(),
                                                                      // salePrices: elementw
                                                                      //     ?.salePrice,
                                                                      // packageId: element
                                                                      //     ?.id
                                                                      //     .toString(),
                                                                    ),
                                                                    direction:
                                                                        SlideDirection
                                                                            .right, // Specify the slide direction here
                                                                    delay: const Duration(
                                                                        milliseconds:
                                                                            5000),
                                                                  ),
                                                                );
                                                              },
                                                              child: SvgPicture
                                                                  .asset(
                                                                "assets/icons/view_newDetails_Down.svg",
                                                                width: 50.w,
                                                                height: 30.h,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5.w,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              Positioned(
                                bottom: 150.w,
                                left: 0,
                                right: 0,
                                child: Visibility(
                                  visible: watch.showPaginationLoader,
                                  child: Container(
                                    width: 240,
                                    height: 240,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: Color(0xffD8F1FF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                          // : Center(
                          //     child: Column(
                          //       children: [
                          //         SizedBox(
                          //           height: 120.h,
                          //         ),
                          //         SvgPicture.asset(
                          //           "assets/icons/kiran_no_data_found.svg",
                          //           // width: 10,
                          //         ),
                          //       ],
                          //     ),
                          //   ))
                          // : SvgPicture.asset(
                          //     'assets/icons/sort.svg',
                          //     // alignment: Alignment.topRight,
                          )
                      : Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 120.h,
                              ),
                              SvgPicture.asset(
                                "assets/icons/No Home Package Found.svg",
                                // width: 10,
                              ),
                            ],
                          ),
                        )
                ],
              );
            }),
    );
  }
}
