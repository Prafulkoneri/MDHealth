import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/Screens/health/home/view/custom_select_box.dart';
import 'package:md_health/Screens/home_services/home_page_services/view/hs_homepage_view.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/controller/home_services_serach_controller.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/view/search_list_view.dart';
import 'package:md_health/Screens/home_services/search_details/view/search_details_hs.dart';
// import 'package:md_health/Screens/search/view/custome_box_sor.dart';
// import 'package:md_health/Screens/search/view/search_details_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/constants/styles/textstyle.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/favrt_button.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/star_rating.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeServicesFiltterSearchView extends StatefulWidget {
  final String? servicesname;
  final String? cityName;
  final String? servicesdate;
  final String? rating;
  final String? services;
  final String? prices;
  final String? searchPackge;

  const HomeServicesFiltterSearchView({
    super.key,
    this.cityName,
    this.servicesname,
    this.servicesdate,
    this.rating,
    this.services,
    this.prices,
    this.searchPackge,
  });

  @override
  State<HomeServicesFiltterSearchView> createState() =>
      _HomeServicesFiltterSearchViewState();
}

class _HomeServicesFiltterSearchViewState
    extends State<HomeServicesFiltterSearchView> {
  @override
  void initState() {
    super.initState();

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
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeServicesSearchListController>();
    final watch = context.watch<HomeServicesSearchListController>();
    return BaseScreen(
      onWillPop: () async {
        print('object');
        Navigator.push(
          context,
          SlidePageRoute(
            page: HomeServicesSearchView(
              cityName: widget.cityName,
              rating: widget.rating,
              servicesname: widget.servicesname,
              searchPackge: widget.searchPackge,
              prices: widget.prices,
              services: widget.services,
              servicesdate: widget.servicesdate,
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
              page: HomeServicesSearchView(
                cityName: widget.cityName,
                rating: widget.rating,
                servicesname: widget.servicesname,
                searchPackge: widget.searchPackge,
                prices: widget.prices,
                services: widget.services,
                servicesdate: widget.servicesdate,
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
              "Verified",
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
                        value: watch.isverifiedCheckDone,
                        onChanged: (value) {
                          read.verifiedToggle(value ?? false, "yes");
                          print(watch.onVerifiedSelected);
                        },
                      ),
                      Text(
                        "Verified Packages",
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
                  // "(${watch.pricesCountData?.first} )",
                  "( ${watch.verifiedCount ?? 0} )",
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
                  "(${watch.reviewCountData?.excellent} )",
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
                  "(${watch.reviewCountData?.veryGood} )",
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
                  "(${watch.reviewCountData?.good} )",
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
                  "(${watch.reviewCountData?.fair} )",
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
                  "(${watch.reviewCountData?.bad} )",
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
                        value: watch.isCheckedpersonal,
                        onChanged: (value) {
                          read.sOnetoggleCheckBox(
                              value ?? false, "Personal care");
                          print(watch.soneselectedPrices);
                        },
                      ),
                      Text(
                        "Personalcare",
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
                  "(${watch.servicesCountData?.personalcare} )",
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
                        value: watch.isCheckedcompaniship,
                        onChanged: (value) {
                          read.sTwotoggleCheckBox(
                              value ?? false, "Companionship");
                          print(watch.stwoselectedPrices);
                        },
                      ),
                      Text(
                        "Companionship",
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
                  "(${watch.servicesCountData?.companionship} )",
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
                        value: watch.isCheckedmealandhouse,
                        onChanged: (value) {
                          read.sThreetoggleCheckBox(
                              value ?? false, "Meal planning & house caring");
                          print(watch.sthreeselectedPrices);
                        },
                      ),
                      Text(
                        "Meal planning & House caring",
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
                  "(${watch.servicesCountData?.mealplanningHousecaring} )",
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
                        value: watch.isCheckedprivate,
                        onChanged: (value) {
                          read.sfourtoggleCheckBox(
                              value ?? false, "Private duty nursing care");
                          print(watch.sfourselectedPrices);
                        },
                      ),
                      Text(
                        "Privateduty and Nursing Care",
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
                  "(${watch.servicesCountData?.privatedutynursingcare} )",
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
                        value: watch.isCheckedbaby,
                        onChanged: (value) {
                          read.sfivetoggleCheckBox(
                              value ?? false, "Babysitting");
                          print(watch.sfiveselectedPrices);
                        },
                      ),
                      Text(
                        "Baby Sitting",
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
                  "(${watch.servicesCountData?.babysitting} )",
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
                        value: watch.isCheckedphysical,
                        onChanged: (value) {
                          read.sSixtoggleCheckBox(
                              value ?? false, "Physical therapy");
                          print(watch.ssixselectedPrices);
                        },
                      ),
                      Text(
                        "Physical Therapy",
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
                  "(${watch.servicesCountData?.physicaltherapy} )",
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
                        value: watch.isCheckedonly,
                        onChanged: (value) {
                          read.sSeventoggleCheckBox(
                              value ?? false, "Only treatments");
                          print(watch.ssevenselectedPrices);
                        },
                      ),
                      Text(
                        "Only Treatment",
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
                  "(${watch.servicesCountData?.onlyTreatment} )",
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
                        value: watch.isCheckedfull,
                        onChanged: (value) {
                          read.sEighttoggleCheckBox(
                              value ?? false, "full_package");
                          print(watch.seightselectedPrices);
                        },
                      ),
                      Text(
                        "Full Package",
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
                  "(${watch.servicesCountData?.fullPackage} )",
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
          //   height: 80,
          //   child: ListView.builder(
          //     physics: NeverScrollableScrollPhysics(),
          //     itemCount: 2,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         // height: 10,
          //         padding: EdgeInsets.only(bottom: 5.w),
          //         margin: EdgeInsets.only(left: 15, right: 15.w),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               children: [
          //                 PrimaryCheckBox(
          //                   // value: watch.radioValue[index],
          //                   //   // groupValue: watch.radioGrpValue,
          //                   onChanged: (value) {
          //                     // read.onRadioBtnChanged(
          //                     //     value, element?.id, element?.price);
          //                   },
          //                 ),
          //                 Text(
          //                   "All treatments",
          //                   style: TextStyle(
          //                     fontFamily: 'Campton',
          //                     fontWeight: FontWeight.w400,
          //                     letterSpacing: -1,
          //                     color: Colors.black,
          //                     fontSize: 16.sp,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Text(
          //               "( )",
          //               style: TextStyle(
          //                 fontFamily: 'Campton',
          //                 fontWeight: FontWeight.w400,
          //                 letterSpacing: -1,
          //                 color: Colors.black,
          //                 fontSize: 16.sp,
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
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
                  "(${watch.pricesCountData?.first} )",
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
                  "(${watch.pricesCountData?.second} )",
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
                  "(${watch.pricesCountData?.third} )",
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
                  "(${watch.pricesCountData?.fourth} )",
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
          //               // value: watch.radioValue[isChecked],
          //                 // groupValue: watch.radioGrpValue,
          //               value: watch.isChecked,
          //               onChanged: (value) {
          //                 read.toggleCheckBox(value ?? false);
          //               },
          //             ),
          //             Text(
          //               "70,001 ₺ - 90,000 ₺",
          //               style: TextStyle(
          //                 // fontFamily: 'Campton',
          //                 fontWeight: FontWeight.w400,
          //                 letterSpacing: -1,
          //                 color: Colors.black,
          //                 fontSize: 16.sp,
          //               ),
          //             ),
          //           ]),
          //       Text(
          //         "(${watch.pricesCountData?.fifth} )",
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
                  "(${watch.pricesCountData?.fifth} )",
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
                  "(${watch.pricesCountData?.sixth} )",
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
                    page: HomeServicesSearchView(
                      verifiedCount: watch.allSelectedVerifed,
                      services: watch.allSelectedReviews,
                      rating: watch.allSelectedServices,
                      prices: watch.allSelectedPrices,
                      servicesname: widget.servicesname,
                      cityName: widget.cityName,
                      servicesdate: widget.servicesdate,
                    ),
                    direction: SlideDirection
                        .right, // Specify the slide direction here
                    delay: Duration(milliseconds: 5000),
                  ),
                );
                // read.updateAllSelectedPrices();
                // SharedPreferences pref = await SharedPreferences.getInstance();
                // if (pref.getString("status") == "guestLoggedIn") {
                //   Utils.showLogdinDialog(context, "Please Login to continue");
                //   return;
                // }
                // return;
                // Navigator.push(
                //   context,
                //   SlidePageRoute(
                //     page: HomeServicesSearchView(
                //       servicesname: watch.selectedText,
                //       cityName: watch.selectedTextcty,
                //       servicesdate: watch.selectdate,
                //     ),
                //     direction: SlideDirection
                //         .right, // Specify the slide direction here
                //     delay: Duration(milliseconds: 5000),
                //   ),
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const DietPlanResult()),
                // );
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
          ),
          // SizedBox(
          //   height: 100.h,
          // )
        ]);
      }),
    );
  }
}
