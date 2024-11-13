// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/Screens/diet_plan/controller/diet_plan_controller.dart';
// // import 'package:md_health/Screens/diet_plan/view/custome_box_cal.dart';
// // import 'package:md_health/Screens/diet_plan/view/custome_box_food.dart';
// // import 'package:md_health/Screens/diet_plan/view/custome_box_type.dart';
// // import 'package:md_health/Screens/diet_plan/view/deit_plan_result.dart';
// // import 'package:md_health/Screens/hotel/view/hotel_review.dart';
// // import 'package:md_health/constants/styles/colors.dart';
// // import 'package:md_health/constants/styles/textstyle.dart';
// // import 'package:md_health/test_widget.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:md_health/widget/base_screen.dart';
// // import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class DietPlanView extends StatefulWidget {
// //   const DietPlanView({super.key});

// //   @override
// //   State<DietPlanView> createState() => _DietPlanViewState();
// // }

// // class _DietPlanViewState extends State<DietPlanView>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _animationController;
// //   late Animation<double> _animation;

// //   @override
// //   void initState() {
// //     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
// //       context.read<DietPlanController>().initState(context);
// //     });
// //     _animationController = AnimationController(
// //       vsync: this,
// //       duration:
// //           const Duration(milliseconds: 500), // Adjust the duration as needed
// //     );
// //     _animation = Tween<double>(begin: 1, end: 0).animate(
// //       CurvedAnimation(parent: _animationController, curve: Curves.linear),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     super.dispose();
// //   }

// //   void _showFoodDialog() {
// //     debugPrint('helooooooooooooooooooo');
// //     _animationController.reset();
// //     _animationController.forward();
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         final watch = context.watch<DietPlanController>();
// //         if (watch.foodData == null) {
// //           // Handle null case, maybe show a loading indicator or return an empty widget
// //           return Container(
// //             child: Text("No DATA FOUND"),
// //           );
// //         }

// //         final read = context.read<DietPlanController>();
// //         return AnimatedBuilder(
// //           animation: _animation,
// //           builder: (context, child) {
// //             return Transform.translate(
// //               offset: Offset(
// //                   0, MediaQuery.of(context).size.height * _animation.value),
// //               child: CustomSelectBoxfood(
// //                 list: watch.foodData!.map((item) => item.foodType).toList(),
// //                 title: const SelectBoxText(
// //                   text: 'Food Type',
// //                   fontWeight: FontWeight.w700,
// //                 ),
// //                 tapFun: () {
// //                   debugPrint('/////////////////////////helooo//////');
// //                 },
// //                 button: true,
// //                 submitActionFnction: () {
// //                   Navigator.pop(context);
// //                   // _animationController.reverse();
// //                 },
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }

// //   void _showSubscriptionDialog() {
// //     debugPrint('helooooooooooooooooooo');
// //     _animationController.reset();
// //     _animationController.forward();
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         final watch = context.watch<DietPlanController>();
// //         final read = context.read<DietPlanController>();
// //         return AnimatedBuilder(
// //           animation: _animation,
// //           builder: (context, child) {
// //             return Transform.translate(
// //               offset: Offset(
// //                   0, MediaQuery.of(context).size.height * _animation.value),
// //               child: CustomSelectBoxtype(
// //                 list: watch.subscriptiondata!
// //                     .map((item) => item.subscriptionType)
// //                     .toList(),
// //                 title: const SelectBoxText(
// //                   text: 'Subscription Type',
// //                   fontWeight: FontWeight.w700,
// //                   icon: 'assets/icons/Calendar.svg',
// //                 ),
// //                 tapFun: () {
// //                   debugPrint('/////////////////////////helooo//////');
// //                 },
// //                 button: true,
// //                 submitActionFnction: () {
// //                   Navigator.pop(context);
// //                   // _animationController.reverse();
// //                 },
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }

// //   void _showCaloriesDialog() {
// //     debugPrint('helooooooooooooooooooo');
// //     _animationController.reset();
// //     _animationController.forward();
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         final watch = context.watch<DietPlanController>();

// //         return AnimatedBuilder(
// //           animation: _animation,
// //           builder: (context, child) {
// //             return Transform.translate(
// //               offset: Offset(
// //                   0, MediaQuery.of(context).size.height * _animation.value),
// //               child: CustomSelectBoxtCalories(
// //                 list: watch.caloriesData!.map((item) => item.calories).toList(),
// //                 title: const SelectBoxText(
// //                   text: 'Max Calories / Per Daily',
// //                   icon: 'assets/icons/Group_18.svg',
// //                   fontWeight: FontWeight.w700,
// //                 ),
// //                 tapFun: () {
// //                   debugPrint('/////////////////////////helooo//////');
// //                 },
// //                 button: true,
// //                 submitActionFnction: () {
// //                   Navigator.pop(context);
// //                   // _animationController.reverse();
// //                 },
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final read = context.read<DietPlanController>();
// //     final watch = context.watch<DietPlanController>();
// //     return BaseScreen(
// //       onWillPop: () async {
// //         // Navigator.push(
// //         //   context,
// //         //   SlidePageRoute(
// //         //     page: DietPlanView(
// //         //         // packageId:
// //         //         //     widget.packageId,
// //         //         ),
// //         //     direction:
// //         //         SlideDirection.left, // Specify the slide direction here
// //         //     delay: Duration(milliseconds: 5000),
// //         //   ),
// //         // );

// //         return false;
// //       },
// //       hasBouncingScrollPhysics: false,
// //       backgroundColor: Colors.black,
// //       appBar: CustomAppBar(
// //         hasHiText: true,
// //         mdTitle: 'food',
// //       ),
// //       content: Column(
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           Container(
// //               // padding: EdgeInsets.only(top: 5.w, bottom: 9.w),
// //               // height: 100.h,
// //               width: ScreenUtil().screenWidth,
// //               color: Colors.black,
// //               child: const Column(
// //                 // sort
// //                 children: [
// //                   Text(
// //                     "PLAN YOUR DIET MEAL",
// //                     style: TextStyle(
// //                         fontFamily: 'Campton',
// //                         color: kDefaultActiveColor,
// //                         fontSize: 29,
// //                         letterSpacing: -1,
// //                         fontWeight: FontWeight.w600),
// //                   ),
// //                   Text(
// //                     "NOW",
// //                     style: TextStyle(
// //                         fontFamily: 'Campton',
// //                         color: Colors.white,
// //                         fontSize: 79,
// //                         fontWeight: FontWeight.w700),
// //                   )
// //                 ],
// //               )),
// //           SizedBox(
// //             height: 30.h,
// //           ),
// //           Container(
// //             padding: EdgeInsets.only(top: 40.w),
// //             color: const Color(0xffF5F5F5),
// //             child: Column(
// //               children: [
// //                 Text(
// //                   "Choose your meal",
// //                   style: TextStyle(
// //                       fontFamily: 'Campton',
// //                       color: Colors.black,
// //                       fontSize: 18,
// //                       letterSpacing: -0.5,
// //                       fontWeight: FontWeight.w500),
// //                 ),
// //                 SizedBox(
// //                   height: 18.h,
// //                 ),
// //                 Padding(
// //                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
// //                     child: DietDropdown(
// //                       value: watch.selectedTextIndex != -1
// //                           ? watch.selectedText
// //                           : ' Food',
// //                       // watch.selectedText,
// //                       title: 'Food Type',
// //                       onTap: () {
// //                         _showFoodDialog();
// //                       },
// //                     )),
// //                 SizedBox(
// //                   height: 20.h,
// //                 ),
// //                 Padding(
// //                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
// //                     child: DietDropdown(
// //                       value: watch.selectedTextIndextype != -1
// //                           ? watch.selectedTexttype
// //                           : ' Subscription',
// //                       // watch.selectedTexttype,
// //                       title: 'Subscription Type',
// //                       onTap: () {
// //                         _showSubscriptionDialog();
// //                       },
// //                       titleSvg: 'assets/icons/Calendar.svg',
// //                     )),
// //                 SizedBox(
// //                   height: 20.h,
// //                 ),
// //                 Padding(
// //                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
// //                     child: DietDropdown(
// //                       value: watch.selectedTextIndexcalories != -1
// //                           ? watch.selectedTextcalaries
// //                           : ' Calories',
// //                       // watch.selectedTextcalaries,
// //                       title: 'Max Calories',
// //                       onTap: () {
// //                         _showCaloriesDialog();
// //                       },
// //                       titleSvg: 'assets/icons/Group_18.svg',
// //                     )),
// //                 SizedBox(
// //                   height: 25.h,
// //                 ),
// //                 Container(
// //                   padding: EdgeInsets.only(
// //                     // top: 21.w,
// //                     bottom: 60.w,
// //                   ),
// //                   margin: EdgeInsets.only(
// //                     left: 21.w,
// //                     right: 17.w,
// //                   ),
// //                   child: PrimaryButton(
// //                     // borderRadius: BorderRadius.circular(),
// //                     borderRadius: 30,
// //                     // width: ScreenUtil().screenWidth,
// //                     color: const Color(0xff4CDB06),
// //                     onTap: () async {
// //                       print("object");
// //                       print(watch.selectedText);
// //                       print(watch.selectedTexttype);
// //                       print(watch.selectedTextcalaries);
// //                       SharedPreferences pref =
// //                           await SharedPreferences.getInstance();
// //                       if (pref.getString("status") == "guestLoggedIn") {
// //                         Utils.showLogdinDialog(
// //                             context, "Please Login to continue");
// //                         return;
// //                       }
// //                       // return;
// //                       Navigator.push(
// //                         context,
// //                         SlidePageRoute(
// //                           page: DietPlanResult(
// //                             food: watch.selectedText,
// //                             subscriptionType: watch.selectedTexttype,
// //                             calories: watch.selectedTextcalaries,
// //                             // packageId:
// //                             //     widget.packageId,
// //                           ),
// //                           direction: SlideDirection
// //                               .right, // Specify the slide direction here
// //                           delay: Duration(milliseconds: 5000),
// //                         ),
// //                       );
// //                       // Navigator.push(
// //                       //   context,
// //                       //   MaterialPageRoute(
// //                       //       builder: (context) => const DietPlanResult()),
// //                       // );
// //                     },
// //                     child: Text(
// //                       "Search",
// //                       style: TextStyle(
// //                           color: Colors.black,
// //                           // letterSpacing: .5,
// //                           fontSize: 16.sp,
// //                           fontWeight: FontWeight.w600),
// //                     ),
// //                   ),
// //                 ),
// //                 Container(
// //                   padding: EdgeInsets.only(bottom: 30.w),
// //                   child: RichText(
// //                     // textAlign: TextAlign.start,
// //                     text: TextSpan(
// //                       text: 'Most used Food ',
// //                       style: TextStyle(
// //                           fontFamily: 'Campton',
// //                           color: Colors.black,
// //                           fontSize: 25.sp,
// //                           letterSpacing: -1.5,
// //                           fontWeight: FontWeight.w700),

// //                       /*defining default style is optional */
// //                       children: <TextSpan>[
// //                         TextSpan(
// //                           text: 'Providers',
// //                           style: TextStyle(
// //                               fontFamily: 'Campton',
// //                               // decoration: TextDecoration.underline,
// //                               color: kDefaultActiveColor,
// //                               fontSize: 25.sp,
// //                               fontWeight: FontWeight.w700),
// //                           recognizer: new TapGestureRecognizer()
// //                             ..onTap = () {
// //                               // Navigator.push(
// //                               //   context,
// //                               //   MaterialPageRoute(
// //                               //       builder: (context) => SignUpView()),
// //                               // );
// //                             },
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Container(
// //                   child: ListView.builder(
// //                     shrinkWrap: true,
// //                     physics: const NeverScrollableScrollPhysics(),
// //                     itemCount: watch.mostuseddata?.length ?? 0,
// //                     itemBuilder: (context, index) {
// //                       final element = watch.mostuseddata?[index];
// //                       return Container(
// //                         margin: EdgeInsets.only(
// //                             left: 18.w, bottom: 24.w, right: 18.w),
// //                         decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(15.0),
// //                             boxShadow: [
// //                               BoxShadow(
// //                                   color: Colors.black.withOpacity(0.1),
// //                                   spreadRadius: 1,
// //                                   blurRadius: 10,
// //                                   blurStyle: BlurStyle.outer)
// //                             ]),
// //                         child: Container(
// //                           padding: EdgeInsets.only(
// //                               left: 19.w, right: 14.w, top: 16.w, bottom: 18.w),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Row(
// //                                 mainAxisAlignment:
// //                                     MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   Text(
// //                                     "${element?.packageName}",
// //                                     // "MDFood Factory",
// //                                     style: TextStyle(
// //                                         fontFamily: 'Campton',
// //                                         color: Colors.black,
// //                                         fontSize: 20.sp,
// //                                         fontWeight: FontWeight.w600),
// //                                   ),
// //                                   element?.verified == "yes"
// //                                       ? Image(
// //                                           image: AssetImage(
// //                                             "assets/images/new_group.png",
// //                                           ),
// //                                           width: 75.w,
// //                                           // height: 60.h,
// //                                         )
// //                                       : Container()
// //                                 ],
// //                               ),
// //                               Container(
// //                                 // color: Colors.blue,
// //                                 padding: EdgeInsets.only(bottom: 8.w),
// //                                 width: 200.w,
// //                                 child: Text(
// //                                   "${element?.menu}",
// //                                   style: TextStyle(
// //                                       fontFamily: 'Campton',
// //                                       color: Colors.black,
// //                                       fontSize: 14,
// //                                       fontWeight: FontWeight.w400),
// //                                 ),
// //                               ),
// //                               SizedBox(
// //                                 height: 5.w,
// //                               ),
// //                               Row(
// //                                 crossAxisAlignment: CrossAxisAlignment.end,
// //                                 children: [
// //                                   element?.companyLogoImagePath != ""
// //                                       ? Image(
// //                                           image: NetworkImage(
// //                                               "${element?.companyLogoImagePath}"
// //                                               // "assets/images/new_group.png",
// //                                               ),
// //                                           width: 75.w,
// //                                           // height: 60.h,
// //                                         )
// //                                       : Container(
// //                                           width: MediaQuery.of(context)
// //                                                   .size
// //                                                   .width *
// //                                               0.35,
// //                                           height: MediaQuery.of(context)
// //                                                   .size
// //                                                   .height *
// //                                               0.125,
// //                                           decoration: BoxDecoration(
// //                                               color: const Color(0xffD9D9D9),
// //                                               border: Border.all(
// //                                                 width: 2,
// //                                                 color: const Color(0xffD9D9D9),
// //                                               ),
// //                                               borderRadius:
// //                                                   BorderRadius.circular(5)),
// //                                           child: const Center(
// //                                             child: Text(
// //                                               "Food Logo",
// //                                               style: TextStyle(
// //                                                   fontFamily: 'Campton',
// //                                                   color: Color(0xff9A9A9A),
// //                                                   fontSize: 14,
// //                                                   fontWeight: FontWeight.w700),
// //                                             ),
// //                                           ),
// //                                         ),
// //                                   SizedBox(
// //                                     width: 20.w,
// //                                   ),
// //                                   GestureDetector(
// //                                     onTap: () {
// //                                       Navigator.push(
// //                                           context,
// //                                           MaterialPageRoute(
// //                                               builder: (context) =>
// //                                                   const HotelReview()));
// //                                     },
// //                                     child: Column(
// //                                       crossAxisAlignment:
// //                                           CrossAxisAlignment.start,
// //                                       children: [
// //                                         Row(
// //                                           children: [
// //                                             Text(
// //                                               "Reviews",
// //                                               style: TextStyle(
// //                                                 fontFamily: 'Campton',
// //                                                 color: kDefaultActiveColor,
// //                                                 fontSize: 18.sp,
// //                                                 fontWeight: FontWeight.w700,
// //                                               ),
// //                                             ),
// //                                             // SizedBox(
// //                                             //   width: 2.w,
// //                                             // ),
// //                                             Text(
// //                                               " (${element?.reviewCount})",
// //                                               style: TextStyle(
// //                                                 fontFamily: 'Campton',
// //                                                 color: Colors.black,
// //                                                 fontSize: 11.sp,
// //                                                 fontWeight: FontWeight.w500,
// //                                               ),
// //                                             ),
// //                                           ],
// //                                         ),
// //                                         SizedBox(
// //                                           height: 2.5.h,
// //                                         ),
// //                                         Row(
// //                                           crossAxisAlignment:
// //                                               CrossAxisAlignment.end,
// //                                           children: [
// //                                             for (int i = 0; i < 5; i++)
// //                                               SvgPicture.asset(
// //                                                 i <
// //                                                         int.parse(element!
// //                                                             .averageRating
// //                                                             .toString())
// //                                                     ? 'assets/icons/black-star.svg'
// //                                                     : 'assets/icons/black-star.svg',
// //                                                 width: 10,
// //                                                 color: i <
// //                                                         int.parse(element
// //                                                             .averageRating
// //                                                             .toString())
// //                                                     ? Colors.green
// //                                                     : Colors.black,
// //                                                 // alignment: Alignment.topRight,
// //                                               ),
// //                                           ],
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class DietDropdown extends StatelessWidget {
// //   final String value;
// //   final String title;
// //   final String? titleSvg;
// //   final void Function()? onTap;

// //   const DietDropdown(
// //       {super.key,
// //       required this.value,
// //       required this.title,
// //       this.titleSvg,
// //       this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.zero,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: const BorderRadius.all(Radius.circular(30)),
// //         border: Border.all(color: Colors.black, width: 1.w),
// //       ),
// //       padding: EdgeInsets.only(left: 5.w),
// //       child: ListTile(
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //         onTap: onTap,
// //         leading: Container(
// //           // color: Colors.red,
// //           child: Column(
// //             mainAxisAlignment: title != null
// //                 ? MainAxisAlignment.start
// //                 : MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               title != null
// //                   ? Container(
// //                       padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
// //                       child: Text(
// //                         title ?? '',
// //                         style: TextStyle(
// //                           color: const Color(0xff8B8B8B),
// //                           fontWeight: FontWeight.w400,
// //                           fontFamily: 'Campton',
// //                           letterSpacing: -0.5,
// //                           fontSize: 13.sp,
// //                         ),
// //                       ),
// //                     )
// //                   : Container(),
// //               Container(
// //                 // width: double.infinity,
// //                 width: MediaQuery.of(context).size.width * 0.5,
// //                 child: Row(
// //                   children: [
// //                     titleSvg != null
// //                         ? SvgPicture.asset(
// //                             titleSvg!,
// //                             height: 15.h,
// //                             width: 15.w,
// //                           )
// //                         : Container(),
// //                     titleSvg != null
// //                         ? SizedBox(
// //                             width: 3.w,
// //                           )
// //                         : Container(),
// //                     Flexible(
// //                       child: Text(
// //                         value,
// //                         style: Theme.of(context).textTheme.bodyText1?.copyWith(
// //                             fontWeight: FontWeight.w600,
// //                             fontFamily: 'Campton',
// //                             fontSize: 16.sp),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         trailing: Icon(
// //           Icons.expand_more,
// //           color: Colors.black,
// //           size: 20.h,
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/food/diet_plan/controller/diet_plan_controller.dart';
// import 'package:md_health/Screens/food/diet_plan/view/custome_box_cal.dart';
// import 'package:md_health/Screens/food/diet_plan/view/custome_box_food.dart';
// import 'package:md_health/Screens/food/diet_plan/view/custome_box_type.dart';
// import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
// import 'package:md_health/Screens/food/diet_plan/view/new_view_all_products.dart';
// import 'package:md_health/Screens/food/Vendro_food_list/view/vendor_list.dart';
// import 'package:md_health/Screens/food/diet_plan/controller/diet_plan_controller.dart';
// import 'package:md_health/Screens/food/make_request/view/food_make_request.dart';
// import 'package:md_health/Screens/hotel/view/hotel_review.dart';
// import 'package:md_health/Screens/person_information/view/person_information_form_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';

// class DietPlanView extends StatefulWidget {
//   const DietPlanView({super.key});

//   @override
//   State<DietPlanView> createState() => _DietPlanViewState();
// }

// class _DietPlanViewState extends State<DietPlanView>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<DietPlanController>().initState(context);
//     });
//     _animationController = AnimationController(
//       vsync: this,
//       duration:
//           const Duration(milliseconds: 500), // Adjust the duration as needed
//     );
//     _animation = Tween<double>(begin: 1, end: 0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.linear),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _showFoodDialog() {
//     debugPrint('helooooooooooooooooooo');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final watch = context.watch<DietPlanController>();
//         if (watch.foodData == null) {
//           // Handle null case, maybe show a loading indicator or return an empty widget
//           return Container(
//             child: const Text("No DATA FOUND"),
//           );
//         }

//         final read = context.read<DietPlanController>();
//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: CustomSelectBoxfood(
//                 list: watch.foodData!.map((item) => item.foodType).toList(),
//                 title: const SelectBoxText(
//                   text: 'Food Type',
//                   fontWeight: FontWeight.w700,
//                 ),
//                 tapFun: () {
//                   debugPrint('/////////////////////////helooo//////');
//                 },
//                 button: true,
//                 submitActionFnction: () {
//                   Navigator.pop(context);
//                   // _animationController.reverse();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showSubscriptionDialog() {
//     debugPrint('helooooooooooooooooooo');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final watch = context.watch<DietPlanController>();
//         final read = context.read<DietPlanController>();
//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: CustomSelectBoxtype(
//                 list: watch.subscriptiondata!
//                     .map((item) => item.subscriptionType)
//                     .toList(),
//                 title: const SelectBoxText(
//                   text: 'Subscription Type',
//                   fontWeight: FontWeight.w700,
//                   icon: 'assets/icons/Calendar.svg',
//                 ),
//                 tapFun: () {
//                   debugPrint('/////////////////////////helooo//////');
//                 },
//                 button: true,
//                 submitActionFnction: () {
//                   Navigator.pop(context);
//                   // _animationController.reverse();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showCaloriesDialog() {
//     debugPrint('helooooooooooooooooooo');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final watch = context.watch<DietPlanController>();

//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: CustomSelectBoxtCalories(
//                 list: watch.caloriesData!.map((item) => item.calories).toList(),
//                 title: const SelectBoxText(
//                   text: 'Max Calories / Per Daily',
//                   icon: 'assets/icons/Group_18.svg',
//                   fontWeight: FontWeight.w700,
//                 ),
//                 tapFun: () {
//                   debugPrint('/////////////////////////helooo//////');
//                 },
//                 button: true,
//                 submitActionFnction: () {
//                   Navigator.pop(context);
//                   // _animationController.reverse();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<DietPlanController>();
//     final watch = context.watch<DietPlanController>();
//     return BaseScreen(
//       onWillPop: () async {
//         // Navigator.push(
//         //   context,
//         //   SlidePageRoute(
//         //     page: DietPlanView(
//         //         // packageId:
//         //         //     widget.packageId,
//         //         ),
//         //     direction:
//         //         SlideDirection.left, // Specify the slide direction here
//         //     delay: Duration(milliseconds: 5000),
//         //   ),
//         // );

//         return false;
//       },
//       hasBouncingScrollPhysics: false,
//       backgroundColor: Colors.black,
//       appBar: CustomAppBar(
//         hasHiText: true,
//         mdTitle: 'food',
//       ),
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//               // padding: EdgeInsets.only(top: 5.w, bottom: 9.w),
//               // height: 100.h,
//               width: ScreenUtil().screenWidth,
//               color: Colors.black,
//               child: const Column(
//                 // sort
//                 children: [
//                   Text(
//                     "PLAN YOUR DIET MEAL",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: kDefaultActiveColor,
//                         fontSize: 29,
//                         letterSpacing: -1,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     "NOW",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.white,
//                         fontSize: 79,
//                         fontWeight: FontWeight.w700),
//                   )
//                 ],
//               )),
//           SizedBox(
//             height: 30.h,
//           ),
//           Container(
//             padding: EdgeInsets.only(top: 40.w),
//             color: const Color(0xffF5F5F5),
//             child: Column(
//               children: [
//                 const Text(
//                   "Choose your meal",
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 18,
//                       letterSpacing: -0.5,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   height: 18.h,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: DietDropdown(
//                       value: watch.selectedTextIndex != -1
//                           ? watch.selectedText
//                           : ' Food',
//                       // watch.selectedText,
//                       title: 'Food Type',
//                       onTap: () {
//                         _showFoodDialog();
//                       },
//                     )),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: DietDropdown(
//                       value: watch.selectedTextIndextype != -1
//                           ? watch.selectedTexttype
//                           : ' Subscription',
//                       // watch.selectedTexttype,
//                       title: 'Subscription Type',
//                       onTap: () {
//                         _showSubscriptionDialog();
//                       },
//                       titleSvg: 'assets/icons/Calendar.svg',
//                     )),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: DietDropdown(
//                       value: watch.selectedTextIndexcalories != -1
//                           ? watch.selectedTextcalaries
//                           : ' Calories',
//                       // watch.selectedTextcalaries,
//                       title: 'Max Calories',
//                       onTap: () {
//                         _showCaloriesDialog();
//                       },
//                       titleSvg: 'assets/icons/Group_18.svg',
//                     )),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                   child: Container(
//                     height: 50.h,
//                     padding: EdgeInsets.only(left: 20.0.w),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       border: Border.all(color: Colors.black, width: 1.w),
//                     ),
//                     child: TextFormField(
//                       controller: watch.foodNamesearchController,
//                       // textCapitalization: TextCapitalization
//                       //     .sentences, // Capitalizes first letter of each sentence.

//                       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Campton',
//                           fontSize: 16.sp),
//                       decoration: InputDecoration(
//                           hintText: 'Food Name',
//                           labelText: "Search by",
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
//                             color: const Color(0xff8B8B8B),
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'Campton',
//                             // letterSpacing: -0.5,
//                             fontSize: 15.sp,
//                           ),
//                           suffixIcon: const Icon(
//                             Icons.search,
//                             color: Colors.black,
//                           )),
//                     ),
//                   ),
//                 ),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     SizedBox(
//                 //       height: 45.h,
//                 //       width: MediaQuery.of(context).size.width * 0.88,
//                 //       child: TextField(
//                 //         style: TextStyle(
//                 //             color: Colors.black,
//                 //             fontFamily: 'CamptonThin',
//                 //             fontSize: 16.sp,
//                 //             fontWeight: FontWeight.w500),
//                 //         onChanged: (value) {
//                 //           // readS.activeSearchList(context);
//                 //         },
//                 //         // controller: watch.searchController,

//                 //         decoration: InputDecoration(
//                 //             focusedBorder: OutlineInputBorder(
//                 //               borderSide:
//                 //                   BorderSide(color: Colors.black, width: 1.w),
//                 //               borderRadius:
//                 //                   const BorderRadius.all(Radius.circular(30)),
//                 //             ),
//                 //             enabledBorder: OutlineInputBorder(
//                 //               borderSide:
//                 //                   BorderSide(color: Colors.black, width: 1.w),
//                 //               borderRadius:
//                 //                   const BorderRadius.all(Radius.circular(30)),
//                 //             ),
//                 //             hintText: 'Search by Treatment Name',
//                 //             hintStyle: TextStyle(
//                 //                 color: Colors.black,
//                 //                 fontFamily: 'CamptonThin',
//                 //                 fontSize: 16.sp,
//                 //                 fontWeight: FontWeight.w500),

//                 //             // Add a clear button to the search bar

//                 //             // Add a search icon or button to the search bar
//                 // suffixIcon: Icon(
//                 //   Icons.search,
//                 //   color: Colors.black,
//                 // )
//                 //             //  IconButton(
//                 //             //   icon:
//                 //             //   SvgPicture.asset(
//                 //             //     'assets/icons/Vector (12).svg',
//                 //             //     width: 15.w,
//                 //             //     height: 15.h,
//                 //             //   ),
//                 //             //   onPressed: () {
//                 //             //     // Perform the search here
//                 //             //   },
//                 //             // ),
//                 //             ),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 // SvgPicture.asset('assets/icons/abs.png'),
//                 GestureDetector(
//                   onTap: () {
//                     read.openBottomSheet(context);
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 30.0.w),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SvgPicture.asset("assets/icons/location100.svg"),
//                         // Icon(Icons.ac_unit_rounded),
//                         SizedBox(
//                           width: 15.h,
//                         ),
//                         Text(
//                           "${watch.selectedAddress ?? ''} ",
//                           style: TextStyle(
//                               color: Colors.black,
//                               // letterSpacing: .5,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           "${watch.selectedPinCode ?? ''} ",
//                           style: TextStyle(
//                               color: Colors.black,
//                               // letterSpacing: .5,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(
//                       // top: 21.w,
//                       // bottom: 40.w,
//                       ),
//                   margin: EdgeInsets.only(
//                     left: 21.w,
//                     right: 17.w,
//                   ),
//                   child: PrimaryButton(
//                     // borderRadius: BorderRadius.circular(),
//                     borderRadius: 30,
//                     // width: ScreenUtil().screenWidth,
//                     color: const Color(0xff4CDB06),
//                     onTap: () async {
//                       print("object");
//                       print(watch.selectedText);
//                       print(watch.selectedTexttype);
//                       print(watch.selectedTextcalaries);
//                       print(watch.selectedPinCode);
//                       print("object");

//                       print(watch.foodNamesearchController.text);
//                       print("object");

//                       // SharedPreferences pref =
//                       //     await SharedPreferences.getInstance();
//                       // if (pref.getString("status") == "guestLoggedIn") {
//                       //   Utils.showLogdinDialog(
//                       //       context, "Please Login to continue");
//                       //   return;
//                       // }
//                       // return;
//                       Navigator.push(
//                         context,
//                         SlidePageRoute(
//                           page: DietPlanResult(
//                             pincode: watch.selectedPinCode,
//                             searchfood: watch.foodNamesearchController.text,
//                             food: watch.selectedText,
//                             subscriptionType: watch.selectedTexttype,
//                             calories: watch.selectedTextcalaries,
//                             // packageId:
//                             //     widget.packageId,
//                           ),
//                           direction: SlideDirection
//                               .right, // Specify the slide direction here
//                           delay: const Duration(milliseconds: 5000),
//                         ),
//                       );
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => const DietPlanResult()),
//                       // );
//                     },
//                     child: Text(
//                       "Search",
//                       style: TextStyle(
//                           color: Colors.black,
//                           // letterSpacing: .5,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: 10.w,
//                 // ),
//                 Padding(
//                   padding: EdgeInsets.all(15.0.w),
//                   child: GestureDetector(
//                     onTap: () {
//                       print('object');
//                       Navigator.push(
//                         context,
//                         SlidePageRoute(
//                           page: const FooDMakeRequestView(

//                               // packageId: watch.packageId,
//                               ),
//                           direction: SlideDirection
//                               .right, // Specify the slide direction here
//                           delay: const Duration(milliseconds: 5000),
//                         ),
//                         // MaterialPageRoute(
//                         //     builder: (context) => PersonInformationFormView())
//                       );
//                     },
//                     child: Image(
//                       image: const AssetImage(
//                         "assets/images/make2.png",
//                       ),
//                       width: 400.w,
//                       height: 150.h,
//                     ),
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: 15.h,
//                 // ),
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     print('object');
//                 //     print(watch.adsdata?.adsUrl);
//                 //     watch.adsdata?.adsUrl;
//                 //     launchUrl(Uri.parse('${(watch.adsdata?.adsUrl)}')).onError(
//                 //       (error, stackTrace) {
//                 //         print("Url is not valid!");
//                 //         return false;
//                 //       },
//                 //     );
//                 //   },
//                 //   child: Image(
//                 //     image: NetworkImage('${watch.adsdata?.adsImagePath}'),
//                 //     height: 144.h,
//                 //     width: 383.w,
//                 //     // fit: BoxFit.contain,
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 35.h,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(bottom: 30.w),
//                   child: RichText(
//                     // textAlign: TextAlign.start,
//                     text: TextSpan(
//                       text: 'Most used Food ',
//                       style: TextStyle(
//                           fontFamily: 'Campton',
//                           color: Colors.black,
//                           fontSize: 25.sp,
//                           letterSpacing: -1.5,
//                           fontWeight: FontWeight.w700),

//                       /*defining default style is optional */
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Providers',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               // decoration: TextDecoration.underline,
//                               color: kDefaultActiveColor,
//                               fontSize: 25.sp,
//                               fontWeight: FontWeight.w700),
//                           recognizer: new TapGestureRecognizer()
//                             ..onTap = () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //       builder: (context) => SignUpView()),
//                               // );
//                             },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: watch.mostuseddata?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       final element = watch.mostuseddata?[index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             SlidePageRoute(
//                               page: VendorProductFoodListView(
//                                 vendorId: element?.vendorId.toString(),
//                                 // food: watch.selectedText,
//                                 // subscriptionType: watch.selectedTexttype,
//                                 // calories: watch.selectedTextcalaries,
//                                 // packageId:
//                                 //     widget.packageId,
//                               ),
//                               direction: SlideDirection
//                                   .right, // Specify the slide direction here
//                               delay: const Duration(milliseconds: 5000),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(
//                               left: 18.w, bottom: 24.w, right: 18.w),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.1),
//                                     spreadRadius: 1,
//                                     blurRadius: 10,
//                                     blurStyle: BlurStyle.outer)
//                               ]),
//                           child: Container(
//                             padding: EdgeInsets.only(
//                                 left: 19.w,
//                                 right: 14.w,
//                                 top: 16.w,
//                                 bottom: 18.w),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "${element?.packageName}",
//                                       // "MDFood Factory",
//                                       style: TextStyle(
//                                           fontFamily: 'Campton',
//                                           color: Colors.black,
//                                           fontSize: 20.sp,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Column(
//                                       children: [
//                                         element?.verified == "yes"
//                                             ? Image(
//                                                 image: const AssetImage(
//                                                   "assets/images/new_group.png",
//                                                 ),
//                                                 width: 75.w,
//                                                 // height: 60.h,
//                                               )
//                                             : Container(),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 Container(
//                                   // color: Colors.blue,
//                                   padding: EdgeInsets.only(bottom: 8.w),
//                                   width: 200.w,
//                                   child: Text(
//                                     "${element?.menu}",
//                                     style: const TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5.w,
//                                 ),
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     element?.companyLogoImagePath != ""
//                                         ? Image(
//                                             image: NetworkImage(
//                                                 "${element?.companyLogoImagePath}"
//                                                 // "assets/images/new_group.png",
//                                                 ),
//                                             width: 75.w,
//                                             // height: 60.h,
//                                           )
//                                         : Container(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.35,
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.125,
//                                             decoration: BoxDecoration(
//                                                 color: const Color(0xffD9D9D9),
//                                                 border: Border.all(
//                                                   width: 2,
//                                                   color:
//                                                       const Color(0xffD9D9D9),
//                                                 ),
//                                                 borderRadius:
//                                                     BorderRadius.circular(5)),
//                                             child: const Center(
//                                               child: Text(
//                                                 "Food Logo",
//                                                 style: TextStyle(
//                                                     fontFamily: 'Campton',
//                                                     color: Color(0xff9A9A9A),
//                                                     fontSize: 14,
//                                                     fontWeight:
//                                                         FontWeight.w700),
//                                               ),
//                                             ),
//                                           ),
//                                     SizedBox(
//                                       width: 20.w,
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         // Navigator.push(
//                                         //     context,
//                                         //     MaterialPageRoute(
//                                         //         builder: (context) =>
//                                         //             const HotelReview()));
//                                       },
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 "Reviews",
//                                                 style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: kDefaultActiveColor,
//                                                   fontSize: 18.sp,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                               ),
//                                               // SizedBox(
//                                               //   width: 2.w,
//                                               // ),
//                                               Text(
//                                                 " (${element?.reviewCount})",
//                                                 style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   fontSize: 11.sp,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 2.5.h,
//                                           ),
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               for (int i = 0; i < 5; i++)
//                                                 SvgPicture.asset(
//                                                   i <
//                                                           int.parse(element!
//                                                               .averageRating
//                                                               .toString())
//                                                       ? 'assets/icons/black-star.svg'
//                                                       : 'assets/icons/black-star.svg',
//                                                   width: 10,
//                                                   color: i <
//                                                           int.parse(element
//                                                               .averageRating
//                                                               .toString())
//                                                       ? Colors.green
//                                                       : Colors.black,
//                                                   // alignment: Alignment.topRight,
//                                                 ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DietDropdown extends StatelessWidget {
//   final String value;
//   final String title;
//   final String? titleSvg;
//   final void Function()? onTap;

//   const DietDropdown(
//       {super.key,
//       required this.value,
//       required this.title,
//       this.titleSvg,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.zero,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(30)),
//         border: Border.all(color: Colors.black, width: 1.w),
//       ),
//       padding: EdgeInsets.only(left: 5.w),
//       child: ListTile(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         onTap: onTap,
//         leading: Container(
//           // color: Colors.red,
//           child: Column(
//             mainAxisAlignment: title != null
//                 ? MainAxisAlignment.start
//                 : MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               title != null
//                   ? Container(
//                       padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
//                       child: Text(
//                         title ?? '',
//                         style: TextStyle(
//                           color: const Color(0xff8B8B8B),
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Campton',
//                           letterSpacing: -0.5,
//                           fontSize: 13.sp,
//                         ),
//                       ),
//                     )
//                   : Container(),
//               Container(
//                 // width: double.infinity,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: Row(
//                   children: [
//                     titleSvg != null
//                         ? SvgPicture.asset(
//                             titleSvg!,
//                             height: 15.h,
//                             width: 15.w,
//                           )
//                         : Container(),
//                     titleSvg != null
//                         ? SizedBox(
//                             width: 3.w,
//                           )
//                         : Container(),
//                     Flexible(
//                       child: Text(
//                         value,
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'Campton',
//                             fontSize: 16.sp),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         trailing: Icon(
//           Icons.expand_more,
//           color: Colors.black,
//           size: 20.h,
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/diet_plan/controller/diet_plan_controller.dart';
// import 'package:md_health/Screens/diet_plan/view/custome_box_cal.dart';
// import 'package:md_health/Screens/diet_plan/view/custome_box_food.dart';
// import 'package:md_health/Screens/diet_plan/view/custome_box_type.dart';
// import 'package:md_health/Screens/diet_plan/view/deit_plan_result.dart';
// import 'package:md_health/Screens/hotel/view/hotel_review.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DietPlanView extends StatefulWidget {
//   const DietPlanView({super.key});

//   @override
//   State<DietPlanView> createState() => _DietPlanViewState();
// }

// class _DietPlanViewState extends State<DietPlanView>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<DietPlanController>().initState(context);
//     });
//     _animationController = AnimationController(
//       vsync: this,
//       duration:
//           const Duration(milliseconds: 500), // Adjust the duration as needed
//     );
//     _animation = Tween<double>(begin: 1, end: 0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.linear),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _showFoodDialog() {
//     debugPrint('helooooooooooooooooooo');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final watch = context.watch<DietPlanController>();
//         if (watch.foodData == null) {
//           // Handle null case, maybe show a loading indicator or return an empty widget
//           return Container(
//             child: Text("No DATA FOUND"),
//           );
//         }

//         final read = context.read<DietPlanController>();
//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: CustomSelectBoxfood(
//                 list: watch.foodData!.map((item) => item.foodType).toList(),
//                 title: const SelectBoxText(
//                   text: 'Food Type',
//                   fontWeight: FontWeight.w700,
//                 ),
//                 tapFun: () {
//                   debugPrint('/////////////////////////helooo//////');
//                 },
//                 button: true,
//                 submitActionFnction: () {
//                   Navigator.pop(context);
//                   // _animationController.reverse();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showSubscriptionDialog() {
//     debugPrint('helooooooooooooooooooo');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final watch = context.watch<DietPlanController>();
//         final read = context.read<DietPlanController>();
//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: CustomSelectBoxtype(
//                 list: watch.subscriptiondata!
//                     .map((item) => item.subscriptionType)
//                     .toList(),
//                 title: const SelectBoxText(
//                   text: 'Subscription Type',
//                   fontWeight: FontWeight.w700,
//                   icon: 'assets/icons/Calendar.svg',
//                 ),
//                 tapFun: () {
//                   debugPrint('/////////////////////////helooo//////');
//                 },
//                 button: true,
//                 submitActionFnction: () {
//                   Navigator.pop(context);
//                   // _animationController.reverse();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showCaloriesDialog() {
//     debugPrint('helooooooooooooooooooo');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final watch = context.watch<DietPlanController>();

//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: CustomSelectBoxtCalories(
//                 list: watch.caloriesData!.map((item) => item.calories).toList(),
//                 title: const SelectBoxText(
//                   text: 'Max Calories / Per Daily',
//                   icon: 'assets/icons/Group_18.svg',
//                   fontWeight: FontWeight.w700,
//                 ),
//                 tapFun: () {
//                   debugPrint('/////////////////////////helooo//////');
//                 },
//                 button: true,
//                 submitActionFnction: () {
//                   Navigator.pop(context);
//                   // _animationController.reverse();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<DietPlanController>();
//     final watch = context.watch<DietPlanController>();
//     return BaseScreen(
//       onWillPop: () async {
//         // Navigator.push(
//         //   context,
//         //   SlidePageRoute(
//         //     page: DietPlanView(
//         //         // packageId:
//         //         //     widget.packageId,
//         //         ),
//         //     direction:
//         //         SlideDirection.left, // Specify the slide direction here
//         //     delay: Duration(milliseconds: 5000),
//         //   ),
//         // );

//         return false;
//       },
//       hasBouncingScrollPhysics: false,
//       backgroundColor: Colors.black,
//       appBar: CustomAppBar(
//         hasHiText: true,
//         mdTitle: 'food',
//       ),
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//               // padding: EdgeInsets.only(top: 5.w, bottom: 9.w),
//               // height: 100.h,
//               width: ScreenUtil().screenWidth,
//               color: Colors.black,
//               child: const Column(
//                 // sort
//                 children: [
//                   Text(
//                     "PLAN YOUR DIET MEAL",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: kDefaultActiveColor,
//                         fontSize: 29,
//                         letterSpacing: -1,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     "NOW",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.white,
//                         fontSize: 79,
//                         fontWeight: FontWeight.w700),
//                   )
//                 ],
//               )),
//           SizedBox(
//             height: 30.h,
//           ),
//           Container(
//             padding: EdgeInsets.only(top: 40.w),
//             color: const Color(0xffF5F5F5),
//             child: Column(
//               children: [
//                 Text(
//                   "Choose your meal",
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 18,
//                       letterSpacing: -0.5,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   height: 18.h,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: DietDropdown(
//                       value: watch.selectedTextIndex != -1
//                           ? watch.selectedText
//                           : ' Food',
//                       // watch.selectedText,
//                       title: 'Food Type',
//                       onTap: () {
//                         _showFoodDialog();
//                       },
//                     )),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: DietDropdown(
//                       value: watch.selectedTextIndextype != -1
//                           ? watch.selectedTexttype
//                           : ' Subscription',
//                       // watch.selectedTexttype,
//                       title: 'Subscription Type',
//                       onTap: () {
//                         _showSubscriptionDialog();
//                       },
//                       titleSvg: 'assets/icons/Calendar.svg',
//                     )),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: DietDropdown(
//                       value: watch.selectedTextIndexcalories != -1
//                           ? watch.selectedTextcalaries
//                           : ' Calories',
//                       // watch.selectedTextcalaries,
//                       title: 'Max Calories',
//                       onTap: () {
//                         _showCaloriesDialog();
//                       },
//                       titleSvg: 'assets/icons/Group_18.svg',
//                     )),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(
//                     // top: 21.w,
//                     bottom: 60.w,
//                   ),
//                   margin: EdgeInsets.only(
//                     left: 21.w,
//                     right: 17.w,
//                   ),
//                   child: PrimaryButton(
//                     // borderRadius: BorderRadius.circular(),
//                     borderRadius: 30,
//                     // width: ScreenUtil().screenWidth,
//                     color: const Color(0xff4CDB06),
//                     onTap: () async {
//                       print("object");
//                       print(watch.selectedText);
//                       print(watch.selectedTexttype);
//                       print(watch.selectedTextcalaries);
//                       SharedPreferences pref =
//                           await SharedPreferences.getInstance();
//                       if (pref.getString("status") == "guestLoggedIn") {
//                         Utils.showLogdinDialog(
//                             context, "Please Login to continue");
//                         return;
//                       }
//                       // return;
//                       Navigator.push(
//                         context,
//                         SlidePageRoute(
//                           page: DietPlanResult(
//                             food: watch.selectedText,
//                             subscriptionType: watch.selectedTexttype,
//                             calories: watch.selectedTextcalaries,
//                             // packageId:
//                             //     widget.packageId,
//                           ),
//                           direction: SlideDirection
//                               .right, // Specify the slide direction here
//                           delay: Duration(milliseconds: 5000),
//                         ),
//                       );
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => const DietPlanResult()),
//                       // );
//                     },
//                     child: Text(
//                       "Search",
//                       style: TextStyle(
//                           color: Colors.black,
//                           // letterSpacing: .5,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(bottom: 30.w),
//                   child: RichText(
//                     // textAlign: TextAlign.start,
//                     text: TextSpan(
//                       text: 'Most used Food ',
//                       style: TextStyle(
//                           fontFamily: 'Campton',
//                           color: Colors.black,
//                           fontSize: 25.sp,
//                           letterSpacing: -1.5,
//                           fontWeight: FontWeight.w700),

//                       /*defining default style is optional */
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Providers',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               // decoration: TextDecoration.underline,
//                               color: kDefaultActiveColor,
//                               fontSize: 25.sp,
//                               fontWeight: FontWeight.w700),
//                           recognizer: new TapGestureRecognizer()
//                             ..onTap = () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //       builder: (context) => SignUpView()),
//                               // );
//                             },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: watch.mostuseddata?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       final element = watch.mostuseddata?[index];
//                       return Container(
//                         margin: EdgeInsets.only(
//                             left: 18.w, bottom: 24.w, right: 18.w),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   spreadRadius: 1,
//                                   blurRadius: 10,
//                                   blurStyle: BlurStyle.outer)
//                             ]),
//                         child: Container(
//                           padding: EdgeInsets.only(
//                               left: 19.w, right: 14.w, top: 16.w, bottom: 18.w),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "${element?.packageName}",
//                                     // "MDFood Factory",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         fontSize: 20.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   element?.verified == "yes"
//                                       ? Image(
//                                           image: AssetImage(
//                                             "assets/images/new_group.png",
//                                           ),
//                                           width: 75.w,
//                                           // height: 60.h,
//                                         )
//                                       : Container()
//                                 ],
//                               ),
//                               Container(
//                                 // color: Colors.blue,
//                                 padding: EdgeInsets.only(bottom: 8.w),
//                                 width: 200.w,
//                                 child: Text(
//                                   "${element?.menu}",
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5.w,
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   element?.companyLogoImagePath != ""
//                                       ? Image(
//                                           image: NetworkImage(
//                                               "${element?.companyLogoImagePath}"
//                                               // "assets/images/new_group.png",
//                                               ),
//                                           width: 75.w,
//                                           // height: 60.h,
//                                         )
//                                       : Container(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.35,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.125,
//                                           decoration: BoxDecoration(
//                                               color: const Color(0xffD9D9D9),
//                                               border: Border.all(
//                                                 width: 2,
//                                                 color: const Color(0xffD9D9D9),
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(5)),
//                                           child: const Center(
//                                             child: Text(
//                                               "Food Logo",
//                                               style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: Color(0xff9A9A9A),
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w700),
//                                             ),
//                                           ),
//                                         ),
//                                   SizedBox(
//                                     width: 20.w,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const HotelReview()));
//                                     },
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "Reviews",
//                                               style: TextStyle(
//                                                 fontFamily: 'Campton',
//                                                 color: kDefaultActiveColor,
//                                                 fontSize: 18.sp,
//                                                 fontWeight: FontWeight.w700,
//                                               ),
//                                             ),
//                                             // SizedBox(
//                                             //   width: 2.w,
//                                             // ),
//                                             Text(
//                                               " (${element?.reviewCount})",
//                                               style: TextStyle(
//                                                 fontFamily: 'Campton',
//                                                 color: Colors.black,
//                                                 fontSize: 11.sp,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 2.5.h,
//                                         ),
//                                         Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             for (int i = 0; i < 5; i++)
//                                               SvgPicture.asset(
//                                                 i <
//                                                         int.parse(element!
//                                                             .averageRating
//                                                             .toString())
//                                                     ? 'assets/icons/black-star.svg'
//                                                     : 'assets/icons/black-star.svg',
//                                                 width: 10,
//                                                 color: i <
//                                                         int.parse(element
//                                                             .averageRating
//                                                             .toString())
//                                                     ? Colors.green
//                                                     : Colors.black,
//                                                 // alignment: Alignment.topRight,
//                                               ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DietDropdown extends StatelessWidget {
//   final String value;
//   final String title;
//   final String? titleSvg;
//   final void Function()? onTap;

//   const DietDropdown(
//       {super.key,
//       required this.value,
//       required this.title,
//       this.titleSvg,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.zero,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(30)),
//         border: Border.all(color: Colors.black, width: 1.w),
//       ),
//       padding: EdgeInsets.only(left: 5.w),
//       child: ListTile(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         onTap: onTap,
//         leading: Container(
//           // color: Colors.red,
//           child: Column(
//             mainAxisAlignment: title != null
//                 ? MainAxisAlignment.start
//                 : MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               title != null
//                   ? Container(
//                       padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
//                       child: Text(
//                         title ?? '',
//                         style: TextStyle(
//                           color: const Color(0xff8B8B8B),
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Campton',
//                           letterSpacing: -0.5,
//                           fontSize: 13.sp,
//                         ),
//                       ),
//                     )
//                   : Container(),
//               Container(
//                 // width: double.infinity,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: Row(
//                   children: [
//                     titleSvg != null
//                         ? SvgPicture.asset(
//                             titleSvg!,
//                             height: 15.h,
//                             width: 15.w,
//                           )
//                         : Container(),
//                     titleSvg != null
//                         ? SizedBox(
//                             width: 3.w,
//                           )
//                         : Container(),
//                     Flexible(
//                       child: Text(
//                         value,
//                         style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'Campton',
//                             fontSize: 16.sp),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         trailing: Icon(
//           Icons.expand_more,
//           color: Colors.black,
//           size: 20.h,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:md_health/Screens/food/diet_plan/controller/diet_plan_controller.dart';
import 'package:md_health/Screens/food/diet_plan/view/custome_box_cal.dart';
import 'package:md_health/Screens/food/diet_plan/view/custome_box_food.dart';
import 'package:md_health/Screens/food/diet_plan/view/custome_box_type.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/Screens/food/diet_plan/view/map.dart';
import 'package:md_health/Screens/food/diet_plan/view/new_view_all_products.dart';
import 'package:md_health/Screens/food/Vendro_food_list/view/vendor_list.dart';
import 'package:md_health/Screens/food/diet_plan/controller/diet_plan_controller.dart';
import 'package:md_health/Screens/food/make_request/view/food_make_request.dart';
import 'package:md_health/Screens/hotel/view/hotel_review.dart';
import 'package:md_health/Screens/person_information/view/person_information_form_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/constants/styles/textstyle.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DietPlanView extends StatefulWidget {
  const DietPlanView({super.key});

  @override
  State<DietPlanView> createState() => _DietPlanViewState();
}

class _DietPlanViewState extends State<DietPlanView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DietPlanController>().initState(context);
    });
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500), // Adjust the duration as needed
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showFoodDialog() {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final watch = context.watch<DietPlanController>();
        if (watch.foodData == null) {
          // Handle null case, maybe show a loading indicator or return an empty widget
          return Container(
            child: const Text("No DATA FOUND"),
          );
        }

        final read = context.read<DietPlanController>();
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: CustomSelectBoxfood(
                list: watch.foodData!.map((item) => item.foodType).toList(),
                title: const SelectBoxText(
                  text: 'Choose Food Type',
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
          },
        );
      },
    );
  }

  void _showSubscriptionDialog() {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final watch = context.watch<DietPlanController>();
        final read = context.read<DietPlanController>();
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: CustomSelectBoxtype(
                list: watch.subscriptiondata!
                    .map((item) => item.subscriptionType)
                    .toList(),
                title: const SelectBoxText(
                  text: 'Subscription Type',
                  fontWeight: FontWeight.w700,
                  icon: 'assets/icons/Calendar.svg',
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
          },
        );
      },
    );
  }

  void _showCaloriesDialog() {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final watch = context.watch<DietPlanController>();

        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: CustomSelectBoxtCalories(
                list: watch.caloriesData!.map((item) => item.calories).toList(),
                title: const SelectBoxText(
                  text: 'Max Calories / Per Daily',
                  icon: 'assets/icons/Group_18.svg',
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
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<DietPlanController>();
    final watch = context.watch<DietPlanController>();
    return BaseScreen(
      onWillPop: () async {
        // Navigator.push(
        //   context,
        //   SlidePageRoute(
        //     page: DietPlanView(
        //         // packageId:
        //         //     widget.packageId,
        //         ),
        //     direction:
        //         SlideDirection.left, // Specify the slide direction here
        //     delay: Duration(milliseconds: 5000),
        //   ),
        // );

        return false;
      },
      hasBouncingScrollPhysics: false,
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        hasHiText: true,
        mdTitle: 'food',
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              // padding: EdgeInsets.only(top: 5.w, bottom: 9.w),
              // height: 100.h,
              width: ScreenUtil().screenWidth,
              color: Colors.black,
              child: const Column(
                // sort
                children: [
                  Text(
                    "PLAN YOUR DIET MEAL",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: kDefaultActiveColor,
                        fontSize: 29,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "NOW",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.white,
                        fontSize: 79,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.only(top: 40.w),
            color: const Color(0xffF5F5F5),
            child: Column(
              children: [
                const Text(
                  "Choose your meal",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 18,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: DietDropdown(
                      value: watch.selectedTextIndex != -1
                          ? watch.selectedText
                          : 'Choose Food Type',
                      // watch.selectedText,
                      title: 'Food Type',
                      onTap: () {
                        _showFoodDialog();
                      },
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: DietDropdown(
                      value: watch.selectedTextIndextype != -1
                          ? watch.selectedTexttype
                          : ' Subscription',
                      // watch.selectedTexttype,
                      title: 'Subscription Type',
                      onTap: () {
                        _showSubscriptionDialog();
                      },
                      titleSvg: 'assets/icons/Calendar.svg',
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: DietDropdown(
                      value: watch.selectedTextIndexcalories != -1
                          ? watch.selectedTextcalaries
                          : ' Calories',
                      // watch.selectedTextcalaries,
                      title: 'Max Calories',
                      onTap: () {
                        _showCaloriesDialog();
                      },
                      titleSvg: 'assets/icons/Group_18.svg',
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.only(left: 20.0.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: Colors.black, width: 1.w),
                    ),
                    child: TextFormField(
                      controller: watch.foodNamesearchController,
                      // textCapitalization: TextCapitalization
                      //     .sentences, // Capitalizes first letter of each sentence.

                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Campton',
                          fontSize: 16.sp),
                      decoration: InputDecoration(
                          hintText: 'Food Name',
                          labelText: "Search by",
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            color: const Color(0xff8B8B8B),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Campton',
                            // letterSpacing: -0.5,
                            fontSize: 15.sp,
                          ),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      enableDrag: false,
                      builder: (context) {
                        return const LocationBottomSheet();
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 22.0.w, right: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/location100.svg"),
                        // Icon(Icons.ac_unit_rounded),
                        SizedBox(
                          width: 7.h,
                        ),
                        Flexible(
                          child: Text(
                            // "${watch.address ?? ''} ",
                            "${watch.currentLocationText ?? '...'} ",
                            style: TextStyle(
                                color: Colors.black,
                                // letterSpacing: .5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),

                Container(
                  padding: const EdgeInsets.only(
                      // top: 21.w,
                      // bottom: 40.w,
                      ),
                  margin: EdgeInsets.only(
                    left: 21.w,
                    right: 17.w,
                  ),
                  child: PrimaryButton(
                    // borderRadius: BorderRadius.circular(),
                    borderRadius: 30,
                    // width: ScreenUtil().screenWidth,
                    color: const Color(0xff4CDB06),

                    onTap: () async {
                      if (watch.selectedText == "Choose Food Type") {
                        Fluttertoast.showToast(
                          msg: "Please select 'Food Type' to continue",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        return;
                      }
                      print("object");
                      print(watch.selectedText);
                      print(watch.selectedTexttype);
                      print(watch.selectedTextcalaries);
                      // print("4110010");

                      print(watch.pinCode);
                      print("object");

                      print(watch.foodNamesearchController.text);
                      print("object");

                      // SharedPreferences pref =
                      //     await SharedPreferences.getInstance();
                      // if (pref.getString("status") == "guestLoggedIn") {
                      //   Utils.showLogdinDialog(
                      //       context, "Please Login to continue");
                      //   return;
                      // }
                      // return;
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page: DietPlanResult(
                            rating: '',
                            prices: '',
                            mealtype: '',
                            pincode: watch.pinCode,
                            searchfood: watch.foodNamesearchController.text,
                            food: watch.selectedText,
                            subscriptionType: watch.selectedTexttype,
                            calories: watch.selectedTextcalaries,
                            // packageId:
                            //     widget.packageId,
                          ),
                          direction: SlideDirection
                              .right, // Specify the slide direction here
                          delay: const Duration(milliseconds: 5000),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const DietPlanResult()),
                      // );
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(
                          color: Colors.black,
                          // letterSpacing: .5,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.w,
                // ),
                Padding(
                  padding: EdgeInsets.all(15.0.w),
                  child: GestureDetector(
                    onTap: () {
                      print('object');
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page: const FooDMakeRequestView(

                              // packageId: watch.packageId,
                              ),
                          direction: SlideDirection
                              .right, // Specify the slide direction here
                          delay: const Duration(milliseconds: 5000),
                        ),
                        // MaterialPageRoute(
                        //     builder: (context) => PersonInformationFormView())
                      );
                    },
                    child: Image(
                      image: const AssetImage(
                        "assets/images/food package_.png",
                      ),
                      width: 400.w,
                      height: 150.h,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 15.h,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     print('object');
                //     print(watch.adsdata?.adsUrl);
                //     watch.adsdata?.adsUrl;
                //     launchUrl(Uri.parse('${(watch.adsdata?.adsUrl)}')).onError(
                //       (error, stackTrace) {
                //         print("Url is not valid!");
                //         return false;
                //       },
                //     );
                //   },
                //   child: Image(
                //     image: NetworkImage('${watch.adsdata?.adsImagePath}'),
                //     height: 144.h,
                //     width: 383.w,
                //     // fit: BoxFit.contain,
                //   ),
                // ),
                SizedBox(
                  height: 35.h,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30.w),
                  child: RichText(
                    // textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Most used Food ',
                      style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 25.sp,
                          letterSpacing: -1.5,
                          fontWeight: FontWeight.w700),

                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Providers',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              // decoration: TextDecoration.underline,
                              color: kDefaultActiveColor,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700),
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
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: watch.mostuseddata?.length ?? 0,
                    itemBuilder: (context, index) {
                      final element = watch.mostuseddata?[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            SlidePageRoute(
                              page: VendorProductFoodListView(
                                vendorId: element?.vendorId.toString(),
                                // food: watch.selectedText,
                                // subscriptionType: watch.selectedTexttype,
                                // calories: watch.selectedTextcalaries,
                                // packageId:
                                //     widget.packageId,
                              ),
                              direction: SlideDirection
                                  .right, // Specify the slide direction here
                              delay: const Duration(milliseconds: 5000),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 18.w, bottom: 24.w, right: 18.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    blurStyle: BlurStyle.outer)
                              ]),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 19.w,
                                right: 14.w,
                                top: 16.w,
                                bottom: 18.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${element?.packageName}",
                                      // "MDFood Factory",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Column(
                                      children: [
                                        element?.verified == "yes"
                                            ? Image(
                                                image: const AssetImage(
                                                  "assets/images/new_group.png",
                                                ),
                                                width: 75.w,
                                                // height: 60.h,
                                              )
                                            : Container(),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  // color: Colors.blue,
                                  padding: EdgeInsets.only(bottom: 8.w),
                                  width: 200.w,
                                  child: Text(
                                    "${element?.menu}",
                                    style: const TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    element?.companyLogoImagePath != ""
                                        ? Image(
                                            image: NetworkImage(
                                                "${element?.companyLogoImagePath}"
                                                // "assets/images/new_group.png",
                                                ),
                                            width: 75.w,
                                            // height: 60.h,
                                          )
                                        : Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.125,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffD9D9D9),
                                                border: Border.all(
                                                  width: 2,
                                                  color:
                                                      const Color(0xffD9D9D9),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                              child: Text(
                                                "Food Logo",
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Color(0xff9A9A9A),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const HotelReview()));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
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
                                              // SizedBox(
                                              //   width: 2.w,
                                              // ),
                                              Text(
                                                " (${element?.reviewCount})",
                                                style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.5.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              for (int i = 0; i < 5; i++)
                                                SvgPicture.asset(
                                                  i <
                                                          int.parse(element!
                                                              .averageRating
                                                              .toString())
                                                      ? 'assets/icons/black-star.svg'
                                                      : 'assets/icons/black-star.svg',
                                                  width: 10,
                                                  color: i <
                                                          int.parse(element
                                                              .averageRating
                                                              .toString())
                                                      ? Colors.green
                                                      : Colors.black,
                                                  // alignment: Alignment.topRight,
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DietDropdown extends StatelessWidget {
  final String value;
  final String title;
  final String? titleSvg;
  final void Function()? onTap;

  const DietDropdown(
      {super.key,
      required this.value,
      required this.title,
      this.titleSvg,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: Colors.black, width: 1.w),
      ),
      padding: EdgeInsets.only(left: 5.w),
      child: ListTile(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        onTap: onTap,
        leading: Container(
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: title != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != null
                  ? Container(
                      padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                      child: Text(
                        title ?? '',
                        style: TextStyle(
                          color: const Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Campton',
                          letterSpacing: -0.5,
                          fontSize: 13.sp,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                // width: double.infinity,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  children: [
                    titleSvg != null
                        ? SvgPicture.asset(
                            titleSvg!,
                            height: 15.h,
                            width: 15.w,
                          )
                        : Container(),
                    titleSvg != null
                        ? SizedBox(
                            width: 3.w,
                          )
                        : Container(),
                    Flexible(
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Campton',
                            fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        trailing: Icon(
          Icons.expand_more,
          color: Colors.black,
          size: 20.h,
        ),
      ),
    );
  }
}
