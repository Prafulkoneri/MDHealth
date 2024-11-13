import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/food/diet_plan/controller/dient_view_controller.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_selected_item_details.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_view.dart';
import 'package:md_health/Screens/food/diet_plan/view/filtter_food.dart';
import 'package:md_health/Screens/food/diet_plan/view/popup_widget_step_2.dart';
import 'package:md_health/Screens/health/home/view/custom_select_box.dart';
// import 'package:md_health/Screens/home/view/custom_select_box.dart';
// import 'package:md_health/Screens/diet_plan/view/popup_widget_step_2.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/constants/styles/textstyle.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';

class DietPlanResult extends StatefulWidget {
  final String? food;
  final String? calories;
  final String? subscriptionType;
  final String? foodPackageId;
  final String? searchfood;
  final String? pincode;
  final String? rating;
  final String? mealtype;
  final String? prices;
  const DietPlanResult(
      {super.key,
      required this.food,
      required this.calories,
      required this.subscriptionType,
      this.foodPackageId,
      this.searchfood,
      this.pincode,
      this.rating,
      this.mealtype,
      this.prices});

  @override
  State<DietPlanResult> createState() => _DietPlanResultState();
}

class _DietPlanResultState extends State<DietPlanResult>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<String> list = ['Last Added', 'Price', 'Reviews'];
  bool isExpanded = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print("grarweewedwsgrdagds");
      print(widget.food);
      print(widget.subscriptionType);
      print(widget.calories);
      print(widget.searchfood);
      print(widget.pincode);
      print("grarweewedwsgrdagds");
      context.read<DietPlanviewController>().initState(
          context,
          widget.food,
          widget.subscriptionType,
          widget.calories,
          widget.foodPackageId,
          widget.searchfood,
          widget.pincode,
          '',
          '');
    });
    // super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500), // Adjust the duration as needed
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
    setPagination();
  }

  setPagination() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          context.read<DietPlanviewController>().onScrollMaxExtent(context);
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

  void _showDialog1() {
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
                  child: CustomSelectBox(
                    list: list,
                    title: SelectBoxText(
                      text: 'Sort by',
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

  void showStepOneDialog({String? id, required String? foodType}) {
    debugPrint('/////////////$id///////////////');
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
              child: PopupDialogWidgetStepTwo(
                  foodPackageId: id.toString(),
                  onTap: () {
                    // Navigator.pop(context);
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return PopupDialogWidgetStepOne(
                    //         onTapText: 'Myself',
                    //         child: Padding(
                    //           padding: EdgeInsets.symmetric(horizontal: 10.w),
                    //           child: Text(
                    //             "Who is this purchase for?",
                    //             style: TextStyle(
                    //               fontFamily: 'Campton',
                    //               color: Colors.black,
                    //               fontSize: 17.sp,
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ),
                    //         ),
                    //         onTap: () {
                    //           Navigator.pop(context);
                    //           showDialog(
                    //               context: context,
                    //               builder: (BuildContext context) {
                    //                 return PaymentDetailsViewDiet();
                    //               });
                    //         },
                    //         onTapButton2: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) =>
                    //                     const InformationFormView()),
                    //           );
                    //         },
                    //       );
                    //     });
                  }),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<DietPlanviewController>();
    final watch = context.watch<DietPlanviewController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.push(
          context,
          SlidePageRoute(
            page: const DietPlanView(
                // packageId:
                //     widget.packageId,
                ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: const Duration(milliseconds: 5000),
          ),
        );

        return false;
      },
      backgroundColor: Colors.white,
      hasScrollView: false,
      appBar: CustomAppBar(
        hasMdTitle: false,
        hasBackButton: true,
        onBackPressed: () {
          Navigator.push(
            context,
            SlidePageRoute(
              page: const DietPlanView(
                  // packageId:
                  //     widget.packageId,
                  ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: const Duration(milliseconds: 5000),
            ),
          );
        },
      ),
      content: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 35.w, bottom: 59.w),
                  // height: 100.h,
                  width: ScreenUtil().screenWidth,
                  color: Colors.black,
                  child: const Column(
                    // sort
                    children: [
                      Text(
                        "SEARCH",
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: kDefaultActiveColor,
                            fontSize: 39,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "RESULTS",
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )),
              GestureDetector(
                onTap: () {
                  // _showDialog1();
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: FoodFiltterSearchView(
                        food: widget.food,
                        subscriptionType: widget.subscriptionType,
                        calories: widget.calories,
                        // widget.foodPackageId,
                        searchfood: widget.searchfood,
                        pincode: widget.pincode,

                        // packageId:
                        //     widget.packageId,
                      ),
                      direction: SlideDirection
                          .left, // Specify the slide direction here
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
                      // const Text(
                      //   "sort by",
                      // style: TextStyle(
                      //     fontFamily: 'Campton',
                      //     color: Color(0xff818181),
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.w400),
                      // )
                      RichText(
                        // textAlign: TextAlign.start,
                        text: TextSpan(
                          text: 'Sort By',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: const Color(0xff818181),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),

                          /*defining default style is optional */
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Last Added',
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  // decoration: TextDecoration.underline,
                                  color: const Color(0xff818181),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => SignUpView()),
                                  // );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              watch.isLoading
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          SizedBox(height: 150.h),
                          const Loader(),
                        ])
                  : Container(
                      margin: EdgeInsets.only(
                          left: 18.w, right: 18.w, top: 20.w, bottom: 17.w),
                      child: watch.foodPackagesSearch?.isNotEmpty == true
                          ? Stack(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      watch.foodPackagesSearch?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final element =
                                        watch.foodPackagesSearch?[index];
                                    final isExpanded =
                                        watch.expandedMenuIndex == index;

                                    print(element?.images);
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print('object');
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    spreadRadius: 1,
                                                    blurStyle: BlurStyle.outer,
                                                    blurRadius: 10,
                                                  )
                                                ]),
                                            padding: EdgeInsets.only(
                                                left: 10.w,
                                                right: 8.w,
                                                top: 16.w,
                                                bottom: 20.w),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child:
                                                          element?.images != ""
                                                              ? Image(
                                                                  image:
                                                                      NetworkImage(
                                                                    element?.images ??
                                                                        '',
                                                                    // "assets/images/vecteezy_hamburger-food-png-generative-ai_27147309.png",
                                                                  ),
                                                                  width: ScreenUtil()
                                                                      .screenWidth,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  height: 150.h,
                                                                )
                                                              : Container(
                                                                  width: ScreenUtil()
                                                                      .screenWidth,
                                                                  // fit: BoxFit.fill,
                                                                  height: 150.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: const Color(
                                                                              0xffD9D9D9),
                                                                          border: Border
                                                                              .all(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                const Color(0xffD9D9D9),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5)),
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                      "Food Logo",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Campton',
                                                                          color: Color(
                                                                              0xff9A9A9A),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                    ),
                                                                  ),
                                                                ),
                                                    ),

                                                    SizedBox(
                                                      height: 10.w,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            " ${element?.packageName}",
                                                            // "Hearth Valve Replacement Surgery",
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
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              element?.featuredStatus ==
                                                                      "approved"
                                                                  ? Container(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              8,
                                                                          top:
                                                                              4,
                                                                          right: 8
                                                                              .w,
                                                                          bottom:
                                                                              4),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              Colors.yellow),
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
                                                                    )
                                                                  : Container(),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              element?.verified ==
                                                                      "yes"
                                                                  ? Image(
                                                                      image:
                                                                          const AssetImage(
                                                                        "assets/images/new_group.png",
                                                                      ),
                                                                      width:
                                                                          75.w,
                                                                      // height: 60.h,
                                                                    )
                                                                  : Container()
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 7.h,
                                                    ),
                                                    /////////////
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/location.svg',
                                                              // alignment: Alignment.topRight,
                                                            ),
                                                            Text(
                                                              "${element?.cityName}",
                                                              // "Beşiktaş / İstanbul",
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontFamily:
                                                                      'Campton',
                                                                  color: const Color(
                                                                      0xff212121),
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 7.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/time.svg',
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                            ),
                                                            Text(
                                                              "${element?.subscriptionType}",
                                                              // "Treatment Periods 3-5 days",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Campton',
                                                                  color: const Color(
                                                                      0xff212121),
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 7.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/Group_18.svg',
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              height: 16.h,
                                                              width: 16.w,
                                                            ),
                                                            Text(
                                                              " ${element?.calories ?? ''}",
                                                              // "Treatment Periods 3-5 days",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Campton',
                                                                  color: const Color(
                                                                      0xff212121),
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.w,
                                                    ),
                                                    element?.foodType == 'Veg'
                                                        ? Text(
                                                            " This package is the basic package it includes Veg",
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: black,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          )
                                                        : Container(),
                                                    ////////////////////////////////////
                                                    element?.foodType ==
                                                            'Non-Veg'
                                                        ? Text(
                                                            " This package is the basic package it includes Non-Veg",
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: black,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          )
                                                        : Container(),
                                                    element?.foodType ==
                                                            'Veg & Non-Veg'
                                                        ? Text(
                                                            "*This package is the basic package it includes Veg & Non-Veg",
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: black,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          )
                                                        : Container(),
                                                    SizedBox(
                                                      height: 10.w,
                                                    ),
                                                    Text(
                                                      "Package Included",
                                                      style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: const Color(
                                                            0xff4CDB06),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Container(
                                                      // color:Colors.amber,
                                                      child: Container(
                                                        child: ListView.builder(
                                                          // padding: EdgeInsets.only(
                                                          //     bottom: 10.w),
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: element
                                                                  ?.mealTypes
                                                                  ?.length ??
                                                              0,
                                                          itemBuilder:
                                                              (context, index) {
                                                            final mealType =
                                                                element?.mealTypes?[
                                                                    index];
                                                            return Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          10),
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
                                                                    "${mealType}",
                                                                    // "Tour",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Campton',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          13.sp,
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
                                                    ),
                                                    SizedBox(height: 5.w),

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
                                                          // "",
                                                          " ( ${element?.reviewsCount ?? '0'} )",
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
                                                    SizedBox(height: 5.w),
                                                    Row(
                                                      children: [
                                                        for (int i = 0;
                                                            i < 5;
                                                            i++)
                                                          SvgPicture.asset(
                                                            i <
                                                                    (double.tryParse(element!.avgRating ??
                                                                            '0') ??
                                                                        0)
                                                                ? 'assets/icons/black-star.svg'
                                                                : 'assets/icons/black-star.svg',
                                                            width: 10,
                                                            color: i <
                                                                    (double.tryParse(element!.avgRating ??
                                                                            '0') ??
                                                                        0)
                                                                ? kDefaultActiveColor
                                                                : Colors.black,
                                                            // alignment: Alignment.topRight,
                                                          ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5.w),
                                                    SizedBox(
                                                      height: 8.w,
                                                    ),
                                                    Text(
                                                      element?.ratingLabel ??
                                                          '',
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
                                                      height: 5.w,
                                                    ),

                                                    Text(
                                                      'Service Price ',
                                                      style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color:
                                                            kDefaultActiveColor,
                                                        fontSize: 17.sp,
                                                        letterSpacing: -1,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        if ((element?.monthlySalesPrice ??
                                                                    0)
                                                                .toDouble() <
                                                            (element?.monthlyPackagePrice ??
                                                                    0)
                                                                .toDouble())
                                                          Stack(
                                                            children: [
                                                              Positioned.fill(
                                                                child:
                                                                    CustomPaint(
                                                                  painter: SlantedLinePainter(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ),
                                                              //  / You can customize this container if needed

                                                              // Text(
                                                              //   "${element?.monthlyPackagePrice}",
                                                              //   style:
                                                              //       GoogleFonts.notoSans(
                                                              //     textStyle: TextStyle(
                                                              //       color: Colors.black,
                                                              //       fontSize: 14,
                                                              //       fontWeight:
                                                              //           FontWeight.w500,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              // Text(
                                                              //   "₺",
                                                              //   style:
                                                              //       GoogleFonts.notoSans(
                                                              //     textStyle: TextStyle(
                                                              //       color: Colors.black,
                                                              //       fontSize: 14,
                                                              //       fontWeight:
                                                              //           FontWeight.w500,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              RichText(
                                                                text: TextSpan(
                                                                    text:
                                                                        "${element?.monthlyPackagePrice}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Campton',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize: 16
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            ' ₺',
                                                                        style: GoogleFonts
                                                                            .inter(
                                                                          textStyle: TextStyle(
                                                                              // fontFamily: 'Campton',
                                                                              color: Colors.black,
                                                                              fontSize: 16.sp,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ],
                                                          )
                                                        else
                                                          Container(),
                                                        element?.discountPrice !=
                                                                ""
                                                            ? Text(
                                                                "  ( ${element?.discountPrice}%  Discount )",
                                                                style: GoogleFonts
                                                                    .notoSans(
                                                                  textStyle:
                                                                      TextStyle(
                                                                    color:
                                                                        kDefaultActiveColor,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              )
                                                            : Container()
                                                      ],
                                                    ),

                                                    ///////////////////////////////////////

                                                    //////////////////////////////////////
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                          fontFamily: 'Campton',
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          letterSpacing: -1.5,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  // '${element?.foodPackageId} ₺',
                                                                  '${element?.monthlySalesPrice} ',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20.sp)),
                                                          TextSpan(
                                                            text:
                                                                // '${element?.foodPackageId} ₺',
                                                                '₺',
                                                            style: GoogleFonts
                                                                .inter(
                                                              textStyle:
                                                                  TextStyle(
                                                                fontSize: 20.sp,
                                                              ),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                              text:
                                                                  ' ( ${element?.salesPrice}  '),
                                                          TextSpan(
                                                            text: '₺',
                                                            style: GoogleFonts
                                                                .inter(),
                                                          ),
                                                          TextSpan(
                                                            text: ' per meal )',
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    element?.deliveryStatus ==
                                                            "yes"
                                                        ? Text(
                                                            'We do not serve at this location.',
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              textStyle:
                                                                  TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        : Container(),

                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 15.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          element?.deliveryStatus !=
                                                                  "yes"
                                                              ? PrimaryButton(
                                                                  height: 35.h,
                                                                  width: 160.w,
                                                                  color:
                                                                      kDefaultActiveColor,
                                                                  onTap: () {
                                                                    showStepOneDialog(
                                                                        foodType:
                                                                            element
                                                                                ?.foodType,
                                                                        id: element
                                                                            ?.foodPackageId
                                                                            .toString());
                                                                  },
                                                                  text:
                                                                      'Purchase Meal Service',
                                                                  textStyle:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Campton',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.sp,
                                                                    letterSpacing:
                                                                        -1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                  textColor:
                                                                      Colors
                                                                          .black,
                                                                )
                                                              : PrimaryButton(
                                                                  height: 35.h,
                                                                  width: 160.w,
                                                                  color:
                                                                      kDefaultActiveColor,
                                                                  onTap: () {
                                                                    Utils.showPrimarySnackbar(
                                                                        context,
                                                                        'We do not serve at this location.',
                                                                        type: SnackType
                                                                            .error);
                                                                    // showStepOneDialog(
                                                                    //     id: element
                                                                    //         ?.foodPackageId
                                                                    //         .toString());
                                                                  },
                                                                  text:
                                                                      'Purchase Meal Service',
                                                                  textStyle:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Campton',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.sp,
                                                                    letterSpacing:
                                                                        -1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                  textColor:
                                                                      Colors
                                                                          .black,
                                                                ),
                                                          SizedBox(
                                                            width: 15.w,
                                                          ),
                                                          element?.isFavorite ==
                                                                  "yes"
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    Utils.showPrimarySnackbar(
                                                                        context,
                                                                        'You have already added this package to favorite list.',
                                                                        type: SnackType
                                                                            .error);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        35.h,
                                                                    width: 46.w,
                                                                    padding: EdgeInsets.only(
                                                                        left: 3.5
                                                                            .w,
                                                                        top:
                                                                            7.w,
                                                                        bottom:
                                                                            7.w),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(
                                                                            0xffF55C5C),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(5))),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/icons/favorite.svg',
                                                                    ),
                                                                  ),
                                                                )
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    read.addToFavMenuFood(
                                                                        context,
                                                                        element
                                                                            ?.foodPackageId
                                                                            .toString(),
                                                                        "food",
                                                                        '',
                                                                        '',
                                                                        '',
                                                                        '',
                                                                        '');
                                                                    read.foodViewDetails(
                                                                        context,
                                                                        widget
                                                                            .food,
                                                                        widget
                                                                            .subscriptionType,
                                                                        widget
                                                                            .calories,
                                                                        widget
                                                                            .searchfood,
                                                                        widget
                                                                            .pincode);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        35.h,
                                                                    width: 46.w,
                                                                    padding: EdgeInsets.only(
                                                                        left: 3.5
                                                                            .w,
                                                                        top:
                                                                            7.w,
                                                                        bottom:
                                                                            7.w),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .grey,
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(5))),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/icons/favorite.svg',
                                                                    ),
                                                                  ),
                                                                )
                                                          // GestureDetector(
                                                          //   onTap: () {
                                                          //     print(element
                                                          //         ?.foodPackageId);
                                                          //     // return;
                                                          //   read.addToFavMenuFood(
                                                          //       context,
                                                          //       element
                                                          //           ?.foodPackageId
                                                          //           .toString(),
                                                          //       "food",
                                                          //       '',
                                                          //       '',
                                                          //       '',
                                                          //       '',
                                                          //       '');
                                                          //   read.foodViewDetails(
                                                          //       context,
                                                          //       widget.food,
                                                          //       widget
                                                          //           .subscriptionType,
                                                          //       widget
                                                          //           .calories,
                                                          //       widget
                                                          //           .searchfood,
                                                          //       widget
                                                          //           .pincode);
                                                          // },
                                                          //   child:
                                                          //       element?.isFavorite ==
                                                          //               "yes"
                                                          //           ? Container(
                                                          //               height:
                                                          //                   35.h,
                                                          //               width:
                                                          //                   46.w,
                                                          //               padding: EdgeInsets.only(
                                                          //                   left:
                                                          //                       3.5.w,
                                                          //                   top: 7.w,
                                                          //                   bottom: 7.w),
                                                          //               alignment:
                                                          //                   Alignment.center,
                                                          //               decoration: BoxDecoration(
                                                          //                   color:
                                                          //                       Color(0xffF55C5C),
                                                          //                   borderRadius: BorderRadius.all(Radius.circular(5))),
                                                          //               child: SvgPicture
                                                          //                   .asset(
                                                          //                 'assets/icons/favorite.svg',
                                                          //               ),
                                                          //             )
                                                          //           : Container(
                                                          //               height:
                                                          //                   35.h,
                                                          //               width:
                                                          //                   46.w,
                                                          //               padding: EdgeInsets.only(
                                                          //                   left:
                                                          //                       3.5.w,
                                                          //                   top: 7.w,
                                                          //                   bottom: 7.w),
                                                          //               alignment:
                                                          //                   Alignment.center,
                                                          //               decoration: BoxDecoration(
                                                          //                   color:
                                                          //                       Colors.grey,
                                                          //                   borderRadius: BorderRadius.all(Radius.circular(5))),
                                                          //               child: SvgPicture
                                                          //                   .asset(
                                                          //                 'assets/icons/favorite.svg',
                                                          //               ),
                                                          //             ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    // if (isExpanded)
                                                    //   Text(
                                                    //     'Weekly Menu ',
                                                    //     style: TextStyle(
                                                    //       fontFamily: 'Campton',
                                                    //       color:
                                                    //           kDefaultActiveColor,
                                                    //       fontSize: 17.sp,
                                                    //       letterSpacing: -1,
                                                    //       fontWeight:
                                                    //           FontWeight.w600,
                                                    //     ),
                                                    //   ),
                                                    // if (isExpanded)
                                                    //   Container(
                                                    //     height: 100.h,
                                                    //     child: ListView.builder(
                                                    //       physics:
                                                    //           BouncingScrollPhysics(),
                                                    //       itemCount: element
                                                    //               ?.menuList
                                                    //               ?.length ??
                                                    //           0,
                                                    //       itemBuilder: (context,
                                                    //           menuIndex) {
                                                    //         final menuElement =
                                                    //             element?.menuList?[
                                                    //                 menuIndex];
                                                    //         return Column(
                                                    //           crossAxisAlignment:
                                                    //               CrossAxisAlignment
                                                    //                   .start,
                                                    //           mainAxisAlignment:
                                                    //               MainAxisAlignment
                                                    //                   .start,
                                                    //           children: [
                                                    //             Row(
                                                    //               children: [
                                                    //                 Text(
                                                    //                   "${menuElement?.category} - ",
                                                    //                   style:
                                                    //                       TextStyle(
                                                    //                     fontFamily:
                                                    //                         'Campton',
                                                    //                     color: Colors
                                                    //                         .black,
                                                    //                     fontSize:
                                                    //                         16.sp,
                                                    //                     fontWeight:
                                                    //                         FontWeight.w600,
                                                    //                   ),
                                                    //                 ),
                                                    //                 Text(
                                                    //                   "Menu",
                                                    //                   style:
                                                    //                       TextStyle(
                                                    //                     fontFamily:
                                                    //                         'Campton',
                                                    //                     color: Colors
                                                    //                         .black,
                                                    //                     fontSize:
                                                    //                         16.sp,
                                                    //                     fontWeight:
                                                    //                         FontWeight.w600,
                                                    //                   ),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //             SizedBox(
                                                    //                 height:
                                                    //                     5.h),
                                                    //             Container(
                                                    //               padding: EdgeInsets
                                                    //                   .only(
                                                    //                       right:
                                                    //                           90.w),
                                                    //               child: Row(
                                                    //                 mainAxisAlignment:
                                                    //                     MainAxisAlignment
                                                    //                         .start,
                                                    //                 crossAxisAlignment:
                                                    //                     CrossAxisAlignment
                                                    //                         .start,
                                                    //                 children: [
                                                    //                   Expanded(
                                                    //                     child:
                                                    //                         Container(
                                                    //                       height:
                                                    //                           50.h,
                                                    //                       child:
                                                    //                           ListView.builder(
                                                    //                         padding:
                                                    //                             EdgeInsets.zero,
                                                    //                         physics:
                                                    //                             NeverScrollableScrollPhysics(),
                                                    //                         itemCount:
                                                    //                             menuElement?.mealTypen?.length ?? 0,
                                                    //                         itemBuilder:
                                                    //                             (context, mealIndex) {
                                                    //                           final mealElement = menuElement?.mealTypen?[mealIndex];
                                                    //                           return Text(
                                                    //                             '${mealElement?.meal}',
                                                    //                             style: TextStyle(
                                                    //                               fontFamily: 'Campton',
                                                    //                               color: Colors.green,
                                                    //                               fontSize: 14.sp,
                                                    //                               fontWeight: FontWeight.w500,
                                                    //                             ),
                                                    //                           );
                                                    //                         },
                                                    //                       ),
                                                    //                     ),
                                                    //                   ),
                                                    //                   Expanded(
                                                    //                     child:
                                                    //                         Container(
                                                    //                       height:
                                                    //                           50.h,
                                                    //                       child:
                                                    //                           ListView.builder(
                                                    //                         padding:
                                                    //                             EdgeInsets.zero,
                                                    //                         physics:
                                                    //                             NeverScrollableScrollPhysics(),
                                                    //                         itemCount:
                                                    //                             menuElement?.mealTypen?.first.mealName?.length ?? 0,
                                                    //                         itemBuilder:
                                                    //                             (context, nameIndex) {
                                                    //                           final nameElement = menuElement?.mealTypen?.first.mealName?[nameIndex];
                                                    //                           return Text(
                                                    //                             '${nameElement}',
                                                    //                             style: TextStyle(
                                                    //                               fontFamily: 'Campton',
                                                    //                               color: Colors.black,
                                                    //                               fontSize: 14.sp,
                                                    //                               fontWeight: FontWeight.w500,
                                                    //                             ),
                                                    //                           );
                                                    //                         },
                                                    //                       ),
                                                    //                     ),
                                                    //                   ),
                                                    //                 ],
                                                    //               ),
                                                    //             ),
                                                    //           ],
                                                    //         );
                                                    //       },
                                                    //     ),
                                                    //   ),
                                                  ],
                                                ),
                                                Positioned(
                                                  bottom: 100.w,
                                                  right: 15,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      watch.toggleMenuDetails(
                                                          index);
                                                    },
                                                    child: isExpanded
                                                        ? SvgPicture.asset(
                                                            'assets/icons/ViewDetails Button (2) 1.svg',
                                                            //     // alignment: Alignment.topRight,
                                                          )
                                                        : SvgPicture.asset(
                                                            'assets/icons/ViewDetails Button (1).svg',
                                                            // alignment: Alignment.topRight,
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ////////////////////////

                                        //////////////////////////////////
                                        if (isExpanded)
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            // elevation: 3.5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      spreadRadius: 1,
                                                      blurStyle:
                                                          BlurStyle.outer,
                                                      blurRadius: 10,
                                                    )
                                                  ]),
                                              height: 250.w,
                                              width: ScreenUtil().screenWidth,
                                              child: DefaultTabController(
                                                length: 2,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 400.w,
                                                      child: TabBar(
                                                        indicatorPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.w),
                                                        // indicatorColor:
                                                        //     kDefaultActiveColor,
                                                        indicator: UnderlineTabIndicator(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    kDefaultActiveColor,
                                                                width: 2.w),
                                                            insets: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        16.w)),
                                                        tabs: [
                                                          Tab(
                                                              child: Text(
                                                                  "Menu",
                                                                  style: TextStyle(
                                                                      color:
                                                                          black,
                                                                      fontFamily:
                                                                          "Campton",
                                                                      fontSize:
                                                                          20.sp))),
                                                          Tab(
                                                              child: Text(
                                                                  "Reviews",
                                                                  style: TextStyle(
                                                                      color:
                                                                          black,
                                                                      fontFamily:
                                                                          "Campton",
                                                                      fontSize:
                                                                          20.sp)))
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                          height: 200.w,
                                                          child: TabBarView(
                                                            children: [
                                                              SingleChildScrollView(
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            10.w),
                                                                    // if (isExpanded)
                                                                    Container(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              25.w),
                                                                      height:
                                                                          100.h,
                                                                      child: ListView
                                                                          .builder(
                                                                        physics:
                                                                            BouncingScrollPhysics(),
                                                                        itemCount:
                                                                            element?.menuList?.length ??
                                                                                0,
                                                                        itemBuilder:
                                                                            (context,
                                                                                menuIndex) {
                                                                          final menuElement =
                                                                              element?.menuList?[menuIndex];
                                                                          return Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    "${menuElement?.category} - ",
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Campton',
                                                                                      color: Colors.black,
                                                                                      fontSize: 16.sp,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "Menu",
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Campton',
                                                                                      color: Colors.black,
                                                                                      fontSize: 16.sp,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 5.h),
                                                                              Container(
                                                                                padding: EdgeInsets.only(right: 90.w),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        height: 50.h,
                                                                                        child: ListView.builder(
                                                                                          padding: EdgeInsets.zero,
                                                                                          physics: NeverScrollableScrollPhysics(),
                                                                                          itemCount: menuElement?.mealTypen?.length ?? 0,
                                                                                          itemBuilder: (context, mealIndex) {
                                                                                            final mealElement = menuElement?.mealTypen?[mealIndex];
                                                                                            return Text(
                                                                                              '${mealElement?.meal}',
                                                                                              style: TextStyle(
                                                                                                fontFamily: 'Campton',
                                                                                                color: Colors.green,
                                                                                                fontSize: 14.sp,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        height: 50.h,
                                                                                        child: ListView.builder(
                                                                                          padding: EdgeInsets.zero,
                                                                                          physics: NeverScrollableScrollPhysics(),
                                                                                          itemCount: menuElement?.mealTypen?.first.mealName?.length ?? 0,
                                                                                          itemBuilder: (context, nameIndex) {
                                                                                            final nameElement = menuElement?.mealTypen?.first.mealName?[nameIndex];
                                                                                            return Text(
                                                                                              '${nameElement}',
                                                                                              style: TextStyle(
                                                                                                fontFamily: 'Campton',
                                                                                                color: Colors.black,
                                                                                                fontSize: 14.sp,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 300.h,
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              20.w),
                                                                  child: element
                                                                              ?.reviewsCount ==
                                                                          0
                                                                      ? Center(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                100.w,
                                                                            width:
                                                                                100.w,
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              "assets/icons/No Data Found 02 (1).svg",
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Column(
                                                                          children: [
                                                                            SizedBox(height: 10.w),
                                                                            Row(
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      "${element?.avgRating ?? 0.0}",
                                                                                      // "4.8",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Campton',
                                                                                        color: Colors.black,
                                                                                        fontSize: 40.sp,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(width: 8.w),
                                                                                Text(
                                                                                  "${element?.reviewsCount ?? 0} Reviews",
                                                                                  // "480 Reviews",
                                                                                  style: TextStyle(
                                                                                    decoration: TextDecoration.underline,
                                                                                    fontFamily: 'Campton',
                                                                                    color: Colors.black,
                                                                                    fontSize: 16.sp,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(height: 5.w),
                                                                            SizedBox(
                                                                              height: 5.h,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                for (int i = 0; i < 5; i++)
                                                                                  Row(
                                                                                    children: [
                                                                                      SvgPicture.asset(
                                                                                        i < (element?.avgRating != null ? double.tryParse(element?.avgRating ?? '0')?.round() ?? 0 : 0) ? 'assets/icons/Star.svg' : 'assets/icons/Star.svg',
                                                                                        width: 10.w,
                                                                                        height: 15.w,
                                                                                        color: i < (element?.avgRating != null ? double.tryParse(element?.avgRating ?? '0')?.round() ?? 0 : 0) ? kDefaultActiveColor : Colors.black,
                                                                                      ),
                                                                                      if (i < 4)
                                                                                        SizedBox(
                                                                                          width: 3.w,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(height: 10.w),
                                                                            Expanded(
                                                                              child: Container(
                                                                                height: 200.h,
                                                                                child: ListView.builder(
                                                                                    shrinkWrap: true,
                                                                                    physics: BouncingScrollPhysics(),
                                                                                    padding: EdgeInsets.zero,
                                                                                    itemCount: element?.reviewList?.length ?? 0,
                                                                                    itemBuilder: (context, rNameIndex) {
                                                                                      final rElement = element?.reviewList?[rNameIndex];
                                                                                      return Container(
                                                                                        child: Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            SizedBox(
                                                                                              height: 20.h,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                Row(
                                                                                                  children: [
                                                                                                    for (int i = 0; i < 5; i++)
                                                                                                      Row(
                                                                                                        children: [
                                                                                                          SvgPicture.asset(
                                                                                                            i < (rElement?.rating != null ? double.tryParse(rElement!.rating!.toString())?.round() ?? 0 : 0) ? 'assets/icons/black-star.svg' : 'assets/icons/black-star.svg',
                                                                                                            width: 14,
                                                                                                            color: i < (rElement?.rating != null ? double.tryParse(rElement!.rating!.toString())?.round() ?? 0 : 0) ? kDefaultActiveColor : Colors.black,
                                                                                                          ),
                                                                                                          if (i < 4)
                                                                                                            SizedBox(
                                                                                                              width: 3.w,
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                                SizedBox(width: 5.w),
                                                                                                // Text.rich(
                                                                                                //   TextSpan(
                                                                                                //     children: [
                                                                                                //       TextSpan(
                                                                                                //         text: rElement?.feedback,
                                                                                                //         style: TextStyle(
                                                                                                // fontFamily: 'Campton',
                                                                                                // color: Colors.black,
                                                                                                // fontSize: 16.sp,
                                                                                                // fontWeight: FontWeight.w400,
                                                                                                //         ),
                                                                                                //       )
                                                                                                //     ],
                                                                                                //   ),
                                                                                                // ),
                                                                                                Flexible(
                                                                                                    child: Text(rElement?.feedback ?? "",
                                                                                                        style: TextStyle(
                                                                                                          fontFamily: 'Campton',
                                                                                                          color: Colors.black,
                                                                                                          fontSize: 16.sp,
                                                                                                          fontWeight: FontWeight.w400,
                                                                                                        )))
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 10.h,
                                                                                            ),
                                                                                            RichText(
                                                                                              // textAlign: TextAlign.start,
                                                                                              text: TextSpan(
                                                                                                text: "${rElement?.customerName}",
                                                                                                style: TextStyle(fontFamily: 'Campton', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700),

                                                                                                /*defining default style is optional */
                                                                                                children: <TextSpan>[],
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 8.h,
                                                                                            ),
                                                                                            Text(
                                                                                              "${rElement?.reviewDate ?? 0}",
                                                                                              // "480 Reviews",
                                                                                              style: TextStyle(
                                                                                                // decoration: TextDecoration.underline,
                                                                                                fontFamily: 'Campton',
                                                                                                color: Colors.black,
                                                                                                fontSize: 16.sp,
                                                                                                fontWeight: FontWeight.w400,
                                                                                              ),
                                                                                            ),
                                                                                            const Divider(
                                                                                              thickness: 1,
                                                                                              color: Color(0xff4CDB06),
                                                                                              // height: height,
                                                                                            ),
                                                                                            // SizedBox(
                                                                                            //   height: 28.h,
                                                                                            // ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                ),
                                                              )
                                                            ],
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                      ],
                                    );
                                  },
                                ),
                                Positioned(
                                  bottom: 150.w,
                                  left: 0,
                                  right: 0,
                                  child: Visibility(
                                    visible: watch.showPaginationLoader,
                                    child: Container(
                                      width: 40,
                                      height: 40,
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
                          : Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 120.h,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/No Food Package Found.svg",
                                    // width: 10,
                                  ),
                                ],
                              ),
                            )),
            ],
          ),
        );
      }),
    );
  }
}

class SlantedLinePainter extends CustomPainter {
  final Color color;

  SlantedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    canvas.drawLine(
      // Top left
      Offset(size.width * 0.95, 2),
      Offset(2, size.height * 0.8), // Bottom right
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
