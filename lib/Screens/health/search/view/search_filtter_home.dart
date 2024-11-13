import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/search/controller/search_view_controller.dart';
import 'package:md_health/Screens/health/search/view/search_view.dart';
import 'package:md_health/Screens/home_services/home_page_services/view/hs_homepage_view.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/view/search_list_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class HomeHealthFiltterSearchView extends StatefulWidget {
  final String? treatmentName;
  final String? cityName;
  final String? rating;
  final String? services;
  final String? prices;
  final String? searchtreatment;

  const HomeHealthFiltterSearchView({
    super.key,
    this.cityName,
    this.treatmentName,
    this.rating,
    this.services,
    this.prices,
    this.searchtreatment,
  });

  @override
  State<HomeHealthFiltterSearchView> createState() =>
      _HomeHealthFiltterSearchViewState();
}

class _HomeHealthFiltterSearchViewState
    extends State<HomeHealthFiltterSearchView> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SearchViewController>().initState(
          context,
          widget.cityName,
          widget.treatmentName,
          // widget.rating,
          // widget.services,
          // widget.prices,
          widget.searchtreatment);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<SearchViewController>();
    final watch = context.watch<SearchViewController>();
    return BaseScreen(
      onWillPop: () async {
        print('object');
        Navigator.push(
          context,
          SlidePageRoute(
            page: SearchView(
              cityName: widget.cityName,
              prices: widget.prices,
              rating: widget.rating,
              searchtreatment: widget.searchtreatment,
              services: widget.services,
              treatmentName: widget.treatmentName,
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
              page: SearchView(
                cityName: widget.cityName,
                prices: widget.prices,
                rating: widget.rating,
                searchtreatment: widget.searchtreatment,
                services: widget.services,
                treatmentName: widget.treatmentName,
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
                          read.verifiedToggle(
                              value ?? false, "Verified Packages");
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
                  "( ${watch.verifiedProvidersCount ?? 0} )",
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
                  // "(${watch.reviewCountData?.excellent} )",
                  "( ${watch.excellentCount ?? 0} )",
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
                  // "(${watch.reviewCountData?.veryGood} )",                                                           "(0)",
                  "( ${watch.veryGoodCount ?? 0} )",
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
                  // "(${watch.reviewCountData?.good} )",
                  "( ${watch.goodCount ?? 0} )",
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
                  // "(${watch.reviewCountData?.fair} )",                                                      "(0)",
                  "( ${watch.fairCount ?? 0} )",
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
                  // "(${watch.reviewCountData?.bad} )",
                  "( ${watch.badCount ?? 0} )",
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
                              value ?? false, "Only treatments");
                          print(watch.soneselectedPrices);
                        },
                      ),
                      Text(
                        "Only treatments",
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
                  // "(${watch.servicesCountData?.personalcare} )",
                  '( ${watch.allTreatmentCount ?? 0} )',

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
          /////////////////////////////////////////////////////////////
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
                  // "(${watch.servicesCountData?.fullPackage} )",
                  '( ${watch.fullPackageCount ?? 0} )',
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
          ///////////////////////////////////////////////////////////////
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
                              value ?? false, "Transportation");
                          print(watch.stwoselectedPrices);
                        },
                      ),
                      Text(
                        "Transportation",
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
                  // "(${watch.servicesCountData?.companionship} )",
                  '( ${watch.transportationCount ?? 0} )',

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
                              value ?? false, "Accommodation");
                          print(watch.sthreeselectedPrices);
                        },
                      ),
                      Text(
                        "Accommodation",
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
                  // "(${watch.servicesCountData?.mealplanningHousecaring} )",
                  '( ${watch.accommodationCount ?? 0} )',
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
                              value ?? false, "Translation");
                          print(watch.sfourselectedPrices);
                        },
                      ),
                      Text(
                        "Translation",
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
                  // "(${watch.servicesCountData?.privatedutynursingcare} )",
                  '( ${watch.translateCount ?? 0} )',
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
                          read.sfivetoggleCheckBox(value ?? false, "Tour");
                          print(watch.sfiveselectedPrices);
                        },
                      ),
                      Text(
                        "Tour",
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
                  // "(${watch.servicesCountData?.babysitting} )",

                  '( ${watch.tourCount ?? 0} )',
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
                              value ?? false, "Visa Service");
                          print(watch.ssixselectedPrices);
                        },
                      ),
                      Text(
                        "Visa Service",
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
                  // "(${watch.servicesCountData?.physicaltherapy} )",
                  '( ${watch.visaCount ?? 0} )',
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
                              value ?? false, "Ticket Services");
                          print(watch.ssevenselectedPrices);
                        },
                      ),
                      Text(
                        "Ticket Services",
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
                  // "(${watch.servicesCountData?.onlyTreatment} )",
                  '( ${watch.ticketCount ?? 0} )',
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
          //         // "(${watch.servicesCountData?.fullPackage} )",
          //         '( ${watch.fullPackageCount ?? 0} )',
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryCheckBox(
                        value: watch.isCheckedAmbulances,
                        onChanged: (value) {
                          read.sNinetoggelCheckBox(
                              value ?? false, "Ambulance Services");
                          print(watch.nineselectedPrices);
                        },
                      ),
                      Text(
                        "Ambulance Services",
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
                  // "(${watch.servicesCountData?.fullPackage} )",
                  '( ${watch.ambulanceCount ?? 0} )',
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
                  // "(${watch.pricesCountData?.first} )",
                  "( ${watch.zerototen ?? 0} )",
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
                  // "(${watch.pricesCountData?.second} )",
                  "( ${watch.tentotwenty ?? 0} )",
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
                  // "(${watch.pricesCountData?.third} )",
                  "( ${watch.twentytofifty ?? 0} )",
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
                  // "(${watch.pricesCountData?.fourth} )",
                  "( ${watch.fiftytoseventy ?? 0} )",
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
                  // "(${watch.pricesCountData?.fifth} )",
                  "( ${watch.seventytohundres ?? 0} )",
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
                  // "(${watch.pricesCountData?.sixth} )",
                  "( ${watch.hundrestoabove ?? 0} )",
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
                    page: SearchView(
                      verified: watch.allSelectedVerifed,
                      treatmentName: widget.treatmentName,
                      services: watch.allSelectedReviews,
                      rating: watch.allSelectedServices,
                      prices: watch.allSelectedPrices,
                      searchtreatment: widget.searchtreatment,
                      cityName: widget.cityName,
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
          ),
          // SizedBox(
          //   height: 100.h,
          // )
        ]);
      }),
    );
  }
}
