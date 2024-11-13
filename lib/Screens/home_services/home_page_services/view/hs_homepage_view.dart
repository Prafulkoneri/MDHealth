// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:md_health/Screens/diet_plan/controller/diet_plan_controller.dart';
// import 'package:md_health/Screens/diet_plan/view/custome_box_cal.dart';
// import 'package:md_health/Screens/diet_plan/view/custome_box_food.dart';
// import 'package:md_health/Screens/diet_plan/view/custome_box_type.dart';
// import 'package:md_health/Screens/diet_plan/view/deit_plan_result.dart';
// import 'package:md_health/Screens/home_services/home_page_services/controller/home_services_controller.dart';
// import 'package:md_health/Screens/home_services/home_page_services/view/select_services_pop_view.dart';
// import 'package:md_health/Screens/home_services/home_page_services/view/show_selected_city_view.dart';
// import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/view/search_list_view.dart';
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

// class HomeServicesView extends StatefulWidget {
//   const HomeServicesView({super.key});

//   @override
//   State<HomeServicesView> createState() => _HomeServicesViewState();
// }

// class _HomeServicesViewState extends State<HomeServicesView> {
//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<HomeServicesController>().initState(context);
//     });
//   }
//   // @override
//   // void initState() {
//   //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//   //     context.read<HomeServicesController>().initState(context);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<HomeServicesController>();
//     final watch = context.watch<HomeServicesController>();
//     return BaseScreen(
//       onWillPop: () async {
//         // Navigator.push(
//         //   context,
//         //   SlidePageRoute(
//         //     page: HomeServicesView(
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
//         mdTitle: 'Services',
//       ),
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//               // padding: EdgeInsets.only(top: 5.w, bottom: 9.w),
//               // height: 100.h,
//               width: ScreenUtil().screenWidth,
//               color: Colors.black,
//               child: Column(
//                 // sort
//                 children: [
//                   Text(
//                     "CLOSE TO YOU, CLOSE TO YOUR ",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: kDefaultActiveColor,
//                         fontSize: 22.sp,
//                         letterSpacing: -1,
//                         fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(
//                     height: 5.w,
//                   ),
//                   Text(
//                     "FEELING.",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.white,
//                         fontSize: 65.sp,
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
//                   "Choose your services",
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 18.sp,
//                       letterSpacing: -0.5,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   height: 18.h,
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                   child: GestureDetector(
//                     onTap: () async {
//                       var datePicked = await DatePicker.showSimpleDatePicker(
//                         context,
//                         initialDate: DateTime(2020),
//                         firstDate: DateTime(1900),
//                         lastDate: DateTime(2090),
//                         dateFormat: "dd-MMMM-yyyy",
//                         locale: DateTimePickerLocale.en_us,
//                         looping: true,
//                       );
//                       if (datePicked != null) {
//                         String date = DateFormat('dd-MM-yyy')
//                             .format(datePicked ?? DateTime.now());
//                         // read.onDateSelected(date);
//                       }
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1.w,
//                           color: Colors.black,
//                         ),
//                         borderRadius: BorderRadius.circular(25.w),
//                       ),
//                       child: Container(
//                         height: 42.h,
//                         width: ScreenUtil().screenWidth,
//                         padding:
//                             EdgeInsets.only(left: 20.w, top: 5.w, bottom: 4.w),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Date",
//                               style: TextStyle(
//                                   fontFamily: "Campton",
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 13.sp,
//                                   color: black),
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(right: 10.w),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "select date",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontFamily: 'Campton',
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   GestureDetector(
//                                     onTap: () async {
//                                       var datePicked =
//                                           await DatePicker.showSimpleDatePicker(
//                                         context,
//                                         initialDate: DateTime(2020),
//                                         firstDate: DateTime(1900),
//                                         lastDate: DateTime(2090),
//                                         dateFormat: "dd-MMMM-yyyy",
//                                         locale: DateTimePickerLocale.en_us,
//                                         looping: true,
//                                       );
//                                       if (datePicked != null) {
//                                         String date = DateFormat('dd-MM-yyy')
//                                             .format(
//                                                 datePicked ?? DateTime.now());
//                                         // read.onDateSelected(date);
//                                       }
//                                     },
//                                     child: const Icon(
//                                         Icons.calendar_today_outlined,
//                                         color: Colors.green),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   //  DietDropdown(
//                   //   value: watch.selectedTextIndexcalories != -1
//                   //       ? watch.selectedTextcalaries
//                   //       : ' Today',
//                   //   // watch.selectedTextcalaries,
//                   //   title: 'Date',
//                   //   onTap: () {
//                   //     _showCaloriesDialog();
//                   //   },
//                   //   titleSvg: 'assets/icons/Calendar.svg',
//                   // )
//                 ),
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
//                       // print(watch.selectedText);
//                       // print(watch.selectedTexttype);
//                       // print(watch.selectedTextcalaries);
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
//                           page: HomeServicesSearchView(),
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
//                       text: 'Best Home ',
//                       style: TextStyle(
//                           fontFamily: 'Campton',
//                           color: Colors.black,
//                           fontSize: 22.sp,
//                           letterSpacing: -1.5,
//                           fontWeight: FontWeight.w700),

//                       /*defining default style is optional */
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: ' Service',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               // decoration: TextDecoration.underline,
//                               color: kDefaultActiveColor,
//                               fontSize: 22.sp,
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
//                         TextSpan(
//                           text: ' Packages',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.black,
//                               fontSize: 22.sp,
//                               letterSpacing: -1.5,
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
// Container(
//   // height: 200,
//   child: ListView.builder(
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     itemCount: watch.tophomeProviderservicesData?.length ?? 0,
//     itemBuilder: (context, index) {
//       final element = watch.tophomeProviderservicesData?[index];
//       return Container(
//         margin: EdgeInsets.only(
//             left: 18.w, bottom: 24.w, right: 18.w),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.0),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   spreadRadius: 1,
//                   blurRadius: 10,
//                   blurStyle: BlurStyle.outer)
//             ]),
//         child: Container(
//           padding: EdgeInsets.only(
//               left: 19.w, right: 14.w, top: 16.w, bottom: 18.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '${element?.companyName}',
//                     // "Home Service Provider 1",
//                     // "MDFood Factory",
//                     style: TextStyle(
//                         letterSpacing: -0.5,
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   element?.verified == "yes"
//                       ? Image(
//                           image: AssetImage(
//                             "assets/images/new_group.png",
//                           ),
//                           width: 75.w,
//                           // height: 60.h,
//                         )
//                       : Container()
//                 ],
//               ),
//               Container(
//                   // color: Colors.blue,
//                   padding: EdgeInsets.only(bottom: 8.w),
//                   width: 200.w,
//                   child: Row(
//                     children: [
//                       Text(
//                         "Services : ",
//                         // "Vegetables, Beefs, Vegan & Vegetarian ,Kitchen",
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700),
//                       ),
//                       Flexible(
//                         child: Text(
//                           "${element?.services} ",
//                           // "Vegetables, Beefs, Vegan & Vegetarian ,Kitchen",
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                     ],
//                   )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     "View Services",
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: black,
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5.w,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   element?.logo != ""
//                       ? Image(
//                           image: NetworkImage("${element?.logo}"
//                               // "assets/images/new_group.png",
//                               ),
//                           width: 75.w,
//                           // height: 60.h,
//                         )
//                       : Container(
//                           width: MediaQuery.of(context)
//                                   .size
//                                   .width *
//                               0.35,
//                           height: MediaQuery.of(context)
//                                   .size
//                                   .height *
//                               0.125,
//                           decoration: BoxDecoration(
//                               color: const Color(0xffD9D9D9),
//                               border: Border.all(
//                                 width: 2,
//                                 color: const Color(0xffD9D9D9),
//                               ),
//                               borderRadius:
//                                   BorderRadius.circular(5)),
//                           child: const Center(
//                             child: Text(
//                               "Food Logo",
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Color(0xff9A9A9A),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                         ),
//                   SizedBox(
//                     width: 20.w,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   const HotelReview()));
//                     },
//                     child: Column(
//                       crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "Reviews",
//                               style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: kDefaultActiveColor,
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: 2.w,
//                             // ),
//                             Text(
//                               " (${element?.totalReviewsCount})",
//                               style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 fontSize: 11.sp,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 2.5.h,
//                         ),
//                         const StarRating(
//                           numberOfStars: 5,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// )
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
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/food/diet_plan/controller/diet_plan_controller.dart';
import 'package:md_health/Screens/food/diet_plan/view/custome_box_cal.dart';
import 'package:md_health/Screens/food/diet_plan/view/custome_box_food.dart';
import 'package:md_health/Screens/food/diet_plan/view/custome_box_type.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/Screens/home_services/home_page_services/controller/home_services_controller.dart';
import 'package:md_health/Screens/home_services/home_page_services/view/select_services_pop_view.dart';
import 'package:md_health/Screens/home_services/home_page_services/view/show_selected_city_view.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/view/search_list_view.dart';
import 'package:md_health/Screens/home_services/make_request/view/make_request_form_view.dart';
import 'package:md_health/Screens/home_services/search_details/view/search_details_hs.dart';
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

class HomeServicesView extends StatefulWidget {
  final String? hmservices;
  const HomeServicesView({super.key, this.hmservices});

  @override
  State<HomeServicesView> createState() => _HomeServicesViewState();
}

class _HomeServicesViewState extends State<HomeServicesView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<HomeServicesController>()
          .initState(context, widget.hmservices);
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

  void _showSevrvices() {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final watch = context.watch<HomeServicesController>();
        if (watch.selecthomeServicesData == null) {
          // Handle null case, maybe show a loading indicator or return an empty widget
          return Container(
            child: Text("No DATA FOUND"),
          );
        }

        final read = context.read<HomeServicesController>();
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: SelectedSeviecPopUp(
                list: watch.selecthomeServicesData!
                    .map((item) => item.productCategoryName)
                    .toList(),
                title: const SelectBoxText(
                  text: 'Select Service',
                  fontWeight: FontWeight.w700,
                ),
                tapFun: () {
                  read.cityPackageHs(context, watch.servicesNMame);
                  debugPrint(
                      '/////////////////////////${watch.servicesNMame}//////');
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

  void showcity() {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final watch = context.watch<HomeServicesController>();
        final read = context.read<HomeServicesController>();

        // Check if homesCitydata is not null
        if (watch.homesCitydata != null) {
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  0,
                  MediaQuery.of(context).size.height * _animation.value,
                ),
                child: CustomSelectBoxHs(
                  list: watch.homesCitydata!
                      .map((item) => item.cityName)
                      .toList(),
                  title: const SelectBoxText(
                    text: 'Select City',
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
        } else {
          // Handle the case when homesCitydata is null
          return Text('Loading...'); // Placeholder or loading indicator
        }
      },
    );
  }

  // void _showCaloriesDialog() {
  //   debugPrint('helooooooooooooooooooo');
  //   _animationController.reset();
  //   _animationController.forward();
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       final watch = context.watch<DietPlanController>();

  //       return AnimatedBuilder(
  //         animation: _animation,
  //         builder: (context, child) {
  //           return Transform.translate(
  //             offset: Offset(
  //                 0, MediaQuery.of(context).size.height * _animation.value),
  //             child: CustomSelectBoxtCalories(
  //               list: watch.caloriesData!.map((item) => item.calories).toList(),
  //               title: const SelectBoxText(
  //                 text: 'Max Calories / Per Daily',
  //                 icon: 'assets/icons/Group_18.svg',
  //                 fontWeight: FontWeight.w700,
  //               ),
  //               tapFun: () {
  //                 debugPrint('/////////////////////////helooo//////');
  //               },
  //               button: true,
  //               submitActionFnction: () {
  //                 Navigator.pop(context);
  //                 // _animationController.reverse();
  //               },
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeServicesController>();
    final watch = context.watch<HomeServicesController>();
    return BaseScreen(
      onWillPop: () async {
        // Navigator.push(
        //   context,
        //   SlidePageRoute(
        //     page: HomeServicesView(
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
        mdTitle: 'Services',
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              // padding: EdgeInsets.only(top: 5.w, bottom: 9.w),
              // height: 100.h,
              width: ScreenUtil().screenWidth,
              color: Colors.black,
              child: Column(
                // sort
                children: [
                  Text(
                    "CLOSE TO YOU, CLOSE TO YOUR ",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: kDefaultActiveColor,
                        fontSize: 22.sp,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    "FEELING.",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.white,
                        fontSize: 65.sp,
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
                Text(
                  "Choose your services",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 18.sp,
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
                          : ' Select Service',
                      // watch.selectedText,
                      title: 'Service Type',
                      onTap: () {
                        _showSevrvices();
                      },
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: DietDropdown(
                      value: watch.selectedTextIndexcity != -1
                          ? watch.selectedTextcty
                          : ' Select City',
                      // watch.selectedTexttype,
                      title: 'City',
                      onTap: () {
                        showcity();
                      },
                      // titleSvg: 'assets/icons/Calendar.svg',
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: GestureDetector(
                    onTap: () async {
                      var datePicked = await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: DateTime.now(),
                        firstDate:
                            DateTime.now(), // Set first date to current date
                        lastDate: DateTime(2090),
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DateTimePickerLocale.en_us,
                        looping: true,
                      );
                      if (datePicked != null) {
                        String date =
                            DateFormat('dd-MM-yyyy').format(datePicked);
                        print('Selected date: $date');
                        read.onDateSelected(date);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.w,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(25.w),
                      ),
                      child: Container(
                        height: 47.h,
                        width: ScreenUtil().screenWidth,
                        padding:
                            EdgeInsets.only(left: 20.w, top: 5.w, bottom: 8.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date",
                              style: TextStyle(
                                  fontFamily: "Campton",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: black),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    watch.selectdate.isNotEmpty
                                        ? watch.selectdate
                                        : "Please select date",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Campton',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      var datePicked =
                                          await DatePicker.showSimpleDatePicker(
                                        context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime
                                            .now(), // Set first date to current date
                                        lastDate: DateTime(2090),
                                        dateFormat: "dd-MMMM-yyyy",
                                        locale: DateTimePickerLocale.en_us,
                                        looping: true,
                                      );
                                      if (datePicked != null) {
                                        String date = DateFormat('dd-MM-yyyy')
                                            .format(datePicked);
                                        print('Selected date: $date');
                                        read.onDateSelected(date);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //  DietDropdown(
                  //   value: watch.selectedTextIndexcalories != -1
                  //       ? watch.selectedTextcalaries
                  //       : ' Today',
                  //   // watch.selectedTextcalaries,
                  //   title: 'Date',
                  //   onTap: () {
                  //     _showCaloriesDialog();
                  //   },
                  //   titleSvg: 'assets/icons/Calendar.svg',
                  // )
                ),
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
                      controller: watch.searchHSpackageController,
                      // textCapitalization: TextCapitalization
                      //     .sentences, // Capitalizes first letter of each sentence.

                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Campton',
                          fontSize: 16.sp),
                      decoration: InputDecoration(
                          hintText: 'Package Name',
                          labelText: "Search by",
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            color: const Color(0xff8B8B8B),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Campton',
                            // letterSpacing: -0.5,
                            fontSize: 15.sp,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                      // top: 21.w,
                      // bottom: 60.w,
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
                      print(watch.selectdate);
                      // return;
                      if (watch.selectedText == "") {
                        Fluttertoast.showToast(
                          msg: "Please select service type first",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        // Utils.showPrimarySnackbar(
                        //     context, 'Please select service type first',
                        //     type: SnackType.error);
                        return;
                      }
                      if (watch.selectdate == "") {
                        Fluttertoast.showToast(
                          msg: "Please select a date",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        // Utils.showPrimarySnackbar(
                        //     context, 'Please select a date',
                        //     type: SnackType.error);
                        return;
                      }
                      print("object");
                      print(watch.selectedText);
                      print(watch.selectedTextcty);
                      log("----------*****${watch.selectdate}");
                      print(watch.searchHSpackageController.text);
                      // return;
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      if (pref.getString("status") == "guestLoggedIn") {
                        Utils.showLogdinDialog(
                            context, "Please Login to continue");
                        return;
                      }
                      // return;
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page: HomeServicesSearchView(
                            services: '',
                            rating: '',
                            prices: '',
                            servicesname: watch.selectedText,
                            cityName: watch.selectedTextcty,
                            servicesdate: watch.selectdate,
                            searchPackge: watch.searchHSpackageController.text,
                          ),
                          direction: SlideDirection
                              .right, // Specify the slide direction here
                          delay: Duration(milliseconds: 5000),
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
                Padding(
                  padding: EdgeInsets.all(15.0.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page: HomeServicesMakeRequestView(

                              // packageId: watch.packageId,
                              ),
                          direction: SlideDirection
                              .right, // Specify the slide direction here
                          delay: Duration(milliseconds: 5000),
                        ),
                        // MaterialPageRoute(
                        //     builder: (context) => PersonInformationFormView())
                      );
                    },
                    child: Image(
                      image: AssetImage(
                        "assets/images/home  package.png",
                      ),
                      width: 400.w,
                      height: 150.h,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30.w),
                  child: RichText(
                    // textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Best Home ',
                      style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 22.sp,
                          letterSpacing: -1.5,
                          fontWeight: FontWeight.w700),

                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Service',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              // decoration: TextDecoration.underline,
                              color: kDefaultActiveColor,
                              fontSize: 22.sp,
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
                        TextSpan(
                          text: ' Packages',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 22.sp,
                              letterSpacing: -1.5,
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
                  // height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: watch.tophomeProviderservicesData?.length ?? 0,
                    itemBuilder: (context, index) {
                      final element = watch.tophomeProviderservicesData?[index];
                      return Container(
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
                              left: 19.w, right: 14.w, top: 16.w, bottom: 18.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          '${element?.companyName}',
                                          // "Home Service Provider 1",
                                          // "MDFood Factory",
                                          style: TextStyle(
                                              letterSpacing: -0.5,
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      element?.verified == "yes"
                                          ? Image(
                                              image: AssetImage(
                                                "assets/images/verifiedByHome.png",
                                              ),
                                              width: 75.w,
                                              // height: 60.h,
                                            )
                                          : Container()
                                    ],
                                  ),
                                  element?.featuredStatus == 'approved'
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              left: 8,
                                              top: 4,
                                              right: 8.w,
                                              bottom: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                              Container(
                                  // color: Colors.blue,
                                  padding: EdgeInsets.only(bottom: 8.w),
                                  width: 200.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Services : ",
                                        // "Vegetables, Beefs, Vegan & Vegetarian ,Kitchen",
                                        style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${element?.services} ",
                                          // "Vegetables, Beefs, Vegan & Vegetarian ,Kitchen",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  )),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         DateTime now = DateTime.now();
                              //         String formattedDate =
                              //             DateFormat('dd-MM-yyyy').format(now);
                              //         Navigator.push(
                              //           context,
                              //           SlidePageRoute(
                              //             page: HomeServicesSearchDetails(
                              //               screenName: "homeServicesHome",
                              //               treatmentDate: formattedDate,
                              //               packageId: element?.id.toString(),
                              //               // salePrices: elementw
                              //               //     ?.salePrice,
                              //               // packageId: element
                              //               //     ?.id
                              //               //     .toString(),
                              //             ),
                              //             direction: SlideDirection
                              //                 .right, // Specify the slide direction here
                              //             delay: const Duration(
                              //                 milliseconds: 5000),
                              //           ),
                              //         );
                              //       },
                              //       child: Text(
                              //         "View Services",
                              //         style: TextStyle(
                              //           fontFamily: 'Campton',
                              //           color: black,
                              //           fontSize: 15.sp,
                              //           fontWeight: FontWeight.w700,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  element?.logo != ""
                                      ? Image(
                                          image: NetworkImage("${element?.logo}"
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
                                                color: const Color(0xffD9D9D9),
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
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
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
                                              " ( ${element?.totalReviewsCount} )",
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
                                          children: List.generate(5, (index) {
                                            return SvgPicture.asset(
                                              index <
                                                      int.parse(element!
                                                          .avgStars
                                                          .toString()) // Assuming avgStars is a String representing an integer
                                                  ? 'assets/icons/black-star.svg'
                                                  : 'assets/icons/black-star.svg',
                                              width: 10,
                                              color: index <
                                                      int.parse(element.avgStars
                                                          .toString()) // Convert avgStars to int for comparison
                                                  ? Colors.green
                                                  : Colors.black,
                                              // alignment: Alignment.topRight,
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      DateTime now = DateTime.now();
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy').format(now);
                                      Navigator.push(
                                        context,
                                        SlidePageRoute(
                                          page: HomeServicesSearchDetails(
                                            screenName: "homeServicesHome",
                                            treatmentDate: formattedDate,
                                            packageId: element?.id.toString(),
                                            // salePrices: elementw
                                            //     ?.salePrice,
                                            // packageId: element
                                            //     ?.id
                                            //     .toString(),
                                          ),
                                          direction: SlideDirection
                                              .right, // Specify the slide direction here
                                          delay: const Duration(
                                              milliseconds: 5000),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "View Services",
                                      style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
