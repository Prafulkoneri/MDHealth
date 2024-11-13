import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/food/diet_plan/controller/dient_view_controller.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_view.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/view/search_list_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class FoodFiltterSearchView extends StatefulWidget {
  final String? food;
  final String? pincode;
  // final String? servicesdate;
  final String? subscriptionType;
  final String? calories;
  // final String? prices;
  final String? searchfood;

  const FoodFiltterSearchView({
    super.key,
    required this.food,
    required this.pincode,
    required this.subscriptionType,
    required this.calories,
    required this.searchfood,
    // this.cityName,
    // this.servicesname,
    // this.servicesdate,
    // this.rating,
    // this.services,
    // this.prices,
    // this.searchPackge,
  });

  @override
  State<FoodFiltterSearchView> createState() => _FoodFiltterSearchViewState();
}

class _FoodFiltterSearchViewState extends State<FoodFiltterSearchView> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print(widget.subscriptionType);
      print('fhbuhh');
      print(widget.food);
      print(widget.pincode);
      print(widget.subscriptionType);
      print(widget.calories);
      print(widget.searchfood);
      print('fhbuhh');
      context.read<DietPlanviewController>().initState(
          context,
          widget.food,
          widget.pincode,
          widget.subscriptionType,
          widget.calories,
          widget.searchfood,
          '',
          '',
          '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<DietPlanviewController>();
    final watch = context.watch<DietPlanviewController>();
    return BaseScreen(
      onWillPop: () async {
        print('object');
        Navigator.push(
          context,
          SlidePageRoute(
            page: DietPlanResult(
              food: widget.food,
              calories: widget.calories,
              subscriptionType: widget.subscriptionType,
            ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 2000),
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
              page: DietPlanResult(
                calories: widget.calories,
                food: widget.food,
                subscriptionType: widget.subscriptionType,
              ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: Duration(milliseconds: 2000),
            ),
          );
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => NewMainScreenView()));
        },

        hasBackButton: true,
        hasMdTitle: false,
        // drawerTitle: "Orders",
      ),
      content: Builder(builder: (context) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(left: 10.w, top: 20.w),
            child: Text(
              "Verified ",
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isVerifiedSelected,
                        onChanged: (value) {
                          read.verifiedProvidersCheckBox(value ?? false, "yes");
                          // print(watch.stwoselectedPrices);
                        },
                      ),
                      Text(
                        "Verified Packages",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  "( ${watch.verifiedProviderCount.toString() ?? '0'} )",
                  // ('0'),

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w, top: 20.w),
            child: Text(
              "Supplier Rating",
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedExcellent,
                        onChanged: (value) {
                          read.etoggleCheckBox(value ?? false, "Excellent");
                          print(watch.exellentselectedPrices);
                        },
                      ),
                      Text(
                        "Excellent",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ]),
                Text(
                  // '',
                  "( ${watch.firstRCount.toString() ?? 'p'} )",

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedVGood,
                        onChanged: (value) {
                          read.vtoggleCheckBox(value ?? false, "Very Good");
                          print(watch.verygoodselectedPrices);
                        },
                      ),
                      Text(
                        "Very Good",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ]),
                Text(
                  // '',
                  "( ${watch.secondRCount.toString() ?? "p"} )",
                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedGood,
                        onChanged: (value) {
                          read.gtoggleCheckBox(value ?? false, "Good");
                          print(watch.goodselectedPrices);
                        },
                      ),
                      Text(
                        "Good",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16, color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ]),
                Text(
                  "( ${watch.thirdRCount.toString() ?? "p"} )",
                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedfair,
                        onChanged: (value) {
                          read.ftoggleCheckBox(value ?? false, "Fair");
                          print(watch.fairselectedPrices);
                        },
                      ),
                      Text(
                        "Fair",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16, color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ]),
                Text(
                  // '',
                  "( ${watch.fourthRCount.toString() ?? "p"} )",

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedBad,
                        onChanged: (value) {
                          read.btoggleCheckBox(value ?? false, "Bad");
                          print(watch.badselectedPrices);
                        },
                      ),
                      Text(
                        "Bad",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16, color: Colors.black,

                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16, color: Colors.black,

                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16, color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Star.svg',
                        height: 16,
                        color: Colors.black,
                        // alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ]),
                Text(
                  // '',
                  "( ${watch.fifthRCount.toString() ?? "p"} )",

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w, top: 20.w),
            child: Text(
              "Services",
              style: TextStyle(
                fontFamily: 'Campton',
                fontWeight: FontWeight.w700,
                // letterSpacing: -1,
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             PrimaryCheckBox(
          //               value: watch.isCheckedpersonal,
          //               onChanged: (value) {
          //                 read.sOnetoggleCheckBox(
          //                     value ?? false, "All Meal Type");
          //                 print(watch.soneselectedPrices);
          //               },
          //             ),
          //             Text(
          //               "All Meal Type",
          //               style: TextStyle(
          //                 fontFamily: 'Campton',
          //                 fontWeight: FontWeight.w400,
          //                 letterSpacing: -1,
          //                 color: Colors.black,
          //                 fontSize: 16.sp,
          //               ),
          //             ),
          //           ]),
          //       Text(
          //         "( ${watch.allMealType.toString() ?? '0'} )",
          //         // ('0'),

          //         style: TextStyle(
          //           fontFamily: 'Campton',
          //           fontWeight: FontWeight.w400,
          //           letterSpacing: -1,
          //           color: Colors.black,
          //           fontSize: 16.sp,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedcompaniship,
                        onChanged: (value) {
                          read.sTwotoggleCheckBox(value ?? false, "Breakfast");
                          print(watch.stwoselectedPrices);
                        },
                      ),
                      Text(
                        "Breakfast",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  "( ${watch.breakfast.toString() ?? '0'} )",
                  // ('0'),

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedmealandhouse,
                        onChanged: (value) {
                          read.sThreetoggleCheckBox(value ?? false, "Lunch");
                          print(watch.sthreeselectedPrices);
                        },
                      ),
                      Text(
                        "Lunch",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  "( ${watch.lunch.toString() ?? '0'} )",
                  // ('0'),

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedprivate,
                        onChanged: (value) {
                          read.sfourtoggleCheckBox(value ?? false, "Dinner");
                          print(watch.sfourselectedPrices);
                        },
                      ),
                      Text(
                        "Dinner",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  "( ${watch.dinner.toString() ?? '0'} )",
                  // ('0'),

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedbaby,
                        onChanged: (value) {
                          read.sfivetoggleCheckBox(value ?? false, "No-Gluten");
                          print(watch.sfiveselectedPrices);
                        },
                      ),
                      Text(
                        "No-Gluten",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  "( ${watch.noGluten.toString() ?? '0'} )",
                  // ('0'),

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedphysical,
                        onChanged: (value) {
                          read.sSixtoggleCheckBox(
                              value ?? false, "Zero Sugar Dessert");
                          print(watch.ssixselectedPrices);
                        },
                      ),
                      Text(
                        "Zero Sugar Dessert",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  "( ${watch.zeroSugarD.toString() ?? '0'} )",
                  // ('0'),

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             PrimaryCheckBox(
          //               value: watch.isCheckedonly,
          //               onChanged: (value) {
          //                 read.sSeventoggleCheckBox(
          //                     value ?? false, "Ticket Services");
          //                 print(watch.ssevenselectedPrices);
          //               },
          //             ),
          //             Text(
          //               "Ticket Services",
          //               style: TextStyle(
          //                 fontFamily: 'Campton',
          //                 fontWeight: FontWeight.w400,
          //                 letterSpacing: -1,
          //                 color: Colors.black,
          //                 fontSize: 16.sp,
          //               ),
          //             ),
          //           ]),
          //       Text(
          //         "(${watch.servicesCountData?.onlyTreatment} )",
          //         style: TextStyle(
          //           fontFamily: 'Campton',
          //           fontWeight: FontWeight.w400,
          //           letterSpacing: -1,
          //           color: Colors.black,
          //           fontSize: 16.sp,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             PrimaryCheckBox(
          //               value: watch.isCheckedfull,
          //               onChanged: (value) {
          //                 read.sEighttoggleCheckBox(
          //                     value ?? false, "full_package");
          //                 print(watch.seightselectedPrices);
          //               },
          //             ),
          //             Text(
          //               "Full Package",
          //               style: TextStyle(
          //                 fontFamily: 'Campton',
          //                 fontWeight: FontWeight.w400,
          //                 letterSpacing: -1,
          //                 color: Colors.black,
          //                 fontSize: 16.sp,
          //               ),
          //             ),
          //           ]),
          //       Text(
          //         "(${watch.servicesCountData?.fullPackage} )",
          //         style: TextStyle(
          //           fontFamily: 'Campton',
          //           fontWeight: FontWeight.w400,
          //           letterSpacing: -1,
          //           color: Colors.black,
          //           fontSize: 16.sp,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             PrimaryCheckBox(
          //               value: watch.isCheckedfull,
          //               onChanged: (value) {
          //                 read.sEighttoggleCheckBox(
          //                     value ?? false, "Ambulance Services");
          //                 print(watch.seightselectedPrices);
          //               },
          //             ),
          //             Text(
          //               "Ambulance Services",
          //               style: TextStyle(
          //                 fontFamily: 'Campton',
          //                 fontWeight: FontWeight.w400,
          //                 letterSpacing: -1,
          //                 color: Colors.black,
          //                 fontSize: 16.sp,
          //               ),
          //             ),
          //           ]),
          //       Text(
          //         "(${watch.servicesCountData?.fullPackage} )",
          //         style: TextStyle(
          //           fontFamily: 'Campton',
          //           fontWeight: FontWeight.w400,
          //           letterSpacing: -1,
          //           color: Colors.black,
          //           fontSize: 16.sp,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w, top: 20.w),
            child: Text(
              "Price",
              style: TextStyle(
                fontFamily: 'Campton',
                fontWeight: FontWeight.w700,
                // letterSpacing: -1,
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedone,
                        onChanged: (value) {
                          read.onetoggleCheckBox(value ?? false, "0-10000");
                          print(watch.oneselectedPrices);
                        },
                      ),
                      Text(
                        "0 ₺ - 10,000 ₺",
                        style: TextStyle(
                          // fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  // '0',
                  "( ${watch.firstPrice.toString() ?? "p"} )",

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedtwo,
                        onChanged: (value) {
                          read.twotoggleCheckBox(value ?? false, "10000-20000");
                          print(watch.twoselectedPrices);
                        },
                      ),
                      Text(
                        "10,000 ₺ - 20,000 ₺",
                        style: TextStyle(
                          // fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  // '0',
                  "( ${watch.secondPrice.toString() ?? "p"} )",

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedthree,
                        onChanged: (value) {
                          read.threetoggleCheckBox(
                              value ?? false, "20001 - 50000");
                          print(watch.threeselectedPrices);
                        },
                      ),
                      Text(
                        "20,001 ₺ - 50,000 ₺",
                        style: TextStyle(
                          // fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  // '0',
                  "( ${watch.thirdPrice.toString() ?? "p"} )",

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedfour,
                        onChanged: (value) {
                          read.fourtoggleCheckBox(
                              value ?? false, "50001-70000");
                          print(watch.fourselectedPrices);
                        },
                      ),
                      Text(
                        "50,001 ₺ - 70,000 ₺",
                        style: TextStyle(
                          // fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  // '0',
                  "( ${watch.fourthPrice.toString() ?? "p"} )",

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryCheckBox(
                      value: watch.isCheckedfive,
                      onChanged: (value) {
                        read.fivetoggleCheckBox(value ?? false, "70001- 90000");
                        print(watch.fiveselectedPrices);
                      },
                    ),
                    Text(
                      "70,001 ₺ - 90,000 ₺",
                      style: TextStyle(
                        // fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.5,
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Text(
                  // '0',
                  "( ${watch.fourthPrice.toString() ?? "p"} )",

                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10.w, left: 15, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedsix,
                        onChanged: (value) {
                          read.sixtoggleCheckBox(
                              value ?? false, "100001- Above");
                          print(watch.sixselectedPrices);
                        },
                      ),
                      Text(
                        "100,001 ₺ - Above ₺",
                        style: TextStyle(
                          // fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                Text(
                  // '0',
                  "( ${watch.fifthPrice.toString() ?? "p"} )",
                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.only(
              // top: 21.w,
              bottom: 100.w,
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
                // print(read.updateAllSelectedPrices());
                print(watch.allSelectedPrices);
                print(watch.allSelectedReviews);
                print(watch.allSelectedServices);
                print('object');
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: DietPlanResult(
                      // rating: '',
                      // prices: '',
                      // mealtype: '',
                      subscriptionType: widget.subscriptionType,
                      food: widget.food,
                      calories: watch.calories,
                      searchfood: widget.searchfood,
                      pincode: widget.pincode,

                      rating: watch.allSelectedServices,
                      mealtype: watch.allSelectedReviews,

                      prices: watch.allSelectedPrices,
                      // services: watch.allSelectedReviews,
                      // rating: watch.allSelectedServices,
                      // prices: watch.allSelectedPrices,
                      // servicesname: widget.servicesname,
                      // cityName: widget.cityName,
                      // servicesdate: widget.servicesdate,
                    ),
                    direction: SlideDirection
                        .right, // Specify the slide direction here
                    delay: Duration(milliseconds: 5000),
                  ),
                );
              },
              child: Text(
                "Apply Filter",
                style: TextStyle(
                    color: Colors.black,
                    // letterSpacing: .5,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ]);
        // SizedBox(
        //   height: 100.h,
        // )
      }),
    );
  }
}
