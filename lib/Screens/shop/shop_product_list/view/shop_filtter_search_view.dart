import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/search/controller/search_view_controller.dart';
import 'package:md_health/Screens/health/search/view/search_view.dart';
import 'package:md_health/Screens/home_services/home_page_services/view/hs_homepage_view.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/view/search_list_view.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/view/md_shop_home_page.dart';
import 'package:md_health/Screens/shop/shop_product_list/controller/shop_product_list_controller.dart';
import 'package:md_health/Screens/shop/shop_product_list/view/shop_product_list.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class ShopFilterSearchView extends StatefulWidget {
  final String? productName;
  final String? pincode;
  final String? rivews;
  final String? verified;
  final String? freeshipping;
  final String? prices;
  final String? categoryId;
  final String? subCategoryId;

  const ShopFilterSearchView({
    super.key,
    this.pincode,
    this.productName,
    this.rivews,
    this.verified,
    this.freeshipping,
    this.prices,
    this.categoryId,
    this.subCategoryId,
  });

  @override
  State<ShopFilterSearchView> createState() => _ShopFilterSearchViewState();
}

class _ShopFilterSearchViewState extends State<ShopFilterSearchView> {
  @override
  void initState() {
    super.initState();
    print("strt");
    print(widget.productName);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ShopProductListConoller>().initState(
            context,
            widget.productName,
            widget.pincode,
            widget.rivews,
            widget.verified,
            widget.prices,
            widget.freeshipping,
            widget.categoryId,
            widget.subCategoryId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ShopProductListConoller>();
    final watch = context.watch<ShopProductListConoller>();
    return BaseScreen(
      onWillPop: () async {
        print('object');
        Navigator.push(
          context,
          SlidePageRoute(
            page: MdShopHomePageView(),
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
              page: MdShopHomePageView(),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: Duration(milliseconds: 2000),
            ),
          );
        },
        hasBackButton: true,
        hasMdTitle: false,
      ),
      content: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(left: 13.w, top: 20.w),
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
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Container(
              padding: EdgeInsets.only(left: 13.w, top: 20.w),
              child: Text(
                "Verified",
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
                          value: watch.isVerifiedProducts,
                          onChanged: (value) {
                            read.sOnetoggleCheckBox(
                                value ?? false, "verified_providers_count");
                            print(watch.selectedVerifiedProduct);
                          },
                        ),
                        Text(
                          "Verified Products",
                          style: TextStyle(
                            fontFamily: 'Campton',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1,
                            color: Colors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Container(
              padding: EdgeInsets.only(left: 13.w, top: 20.w),
              child: Text(
                "Delivery",
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
                          value: watch.isFreeshipping,
                          onChanged: (value) {
                            read.freetoggeleCheck(value ?? false, "yes");
                            print(watch.selectedFreeShippping);
                          },
                        ),
                        Text(
                          "Free Shipping",
                          style: TextStyle(
                            fontFamily: 'Campton',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1,
                            color: Colors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            ),

            SizedBox(
              height: 20.h,
            ),
            // RangeSlider(
            //   values: watch.currentRangeValues,
            //   min: 0,
            //   max: 100000, // Set your maximum price here
            //   divisions: 10, // Optional: Number of divisions on the slider
            //   labels: RangeLabels(
            //     '${watch.currentRangeValues.start.toStringAsFixed(0)} ₺',
            //     '${watch.currentRangeValues.end.toStringAsFixed(0)} ₺',
            //   ),
            //   onChanged: (RangeValues values) {
            //     setState(() {
            //       watch.currentRangeValues = values;
            //     });
            //   },
            // ),
            // SizedBox(height: 5),
            // Container(
            //   padding: EdgeInsets.only(left: 15.w, right: 15.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "${watch.currentRangeValues.start.toStringAsFixed(0)} ₺",
            //         style: TextStyle(
            //           // fontFamily: 'Campton',
            //           fontWeight: FontWeight.w400,
            //           color: Colors.black,
            //           fontSize: 16,
            //         ),
            //       ),
            //       Text(
            //         "${watch.currentRangeValues.end.toStringAsFixed(0)} ₺",
            //         style: TextStyle(
            //           // fontFamily: 'Campton',
            //           fontWeight: FontWeight.w400,
            //           color: Colors.black,
            //           fontSize: 16,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            RangeSlider(
              values: watch.currentRangeValues,
              min: 0,
              max: 10000, // Set your maximum price here
              divisions: 10, // Optional: Number of divisions on the slider
              labels: RangeLabels(
                '${watch.currentRangeValues.start.toStringAsFixed(0)} ₺',
                '${watch.currentRangeValues.end.toStringAsFixed(0)} ₺',
              ),
              onChanged: (RangeValues values) {
                read..updateEndValue(values.end);
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${watch.currentRangeValues.start.toStringAsFixed(0)} ₺",
                    style: TextStyle(
                      // fontFamily: 'Campton',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "${watch.currentRangeValues.end.toStringAsFixed(0)} ₺",
                    style: TextStyle(
                      // fontFamily: 'Campton',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 21.w,
                bottom: 100.w,
              ),
              margin: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
              ),
              child: PrimaryButton(
                // borderRadius: BorderRadius.circular(),
                borderRadius: 30,
                // width: ScreenUtil().screenWidth,
                color: const Color(0xff4CDB06),
                onTap: () async {
                  // print(read.updateAllSelectedPrices());
                  // print(watch.allSelectedPrices);
                  // print(watch.allSelectedReviews);
                  // print(watch.allSelectedServices);
                  print(watch.currentRangeValues.end.toString());
                  print(watch.selectedFreeShippping);
                  print(watch.allSelectedReviews);
                  print(watch.selectedVerifiedProduct);
                  print('object');
                  print(widget.productName);
                  print('objsssssect');

                  print(widget.pincode);
                  print('object');
                  // return;
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: ShopProductListView(
                        prices: watch.currentRangeValues.end.toString(),
                        freeshipping: watch.selectedFreeShippping,
                        rivews: watch.allSelectedReviews,
                        verified: watch.selectedVerifiedProduct,
                        pincode: widget.pincode,
                        productName: widget.productName,
                        categoryId: widget.categoryId,
                        subCategoryId: widget.subCategoryId,
                      ),
                      direction: SlideDirection
                          .right, // Specify the slide direction here
                      delay: const Duration(milliseconds: 5000),
                    ),
                  );
                  // Navigator.push(
                  //   context,
                  //   SlidePageRoute(
                  //     page: SearchView(
                  //       treatmentName: widget.treatmentName,
                  //       services: watch.allSelectedReviews,
                  //       rating: watch.allSelectedServices,
                  //       prices: watch.allSelectedPrices,
                  //       searchtreatment: widget.searchtreatment,
                  //       cityName: widget.cityName,
                  //     ),
                  //     direction: SlideDirection
                  //         .right, // Specify the slide direction here
                  //     delay: Duration(milliseconds: 5000),
                  //   ),
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
          ]),
        );
      }),
    );
  }
}
