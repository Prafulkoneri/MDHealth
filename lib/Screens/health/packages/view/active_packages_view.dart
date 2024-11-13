import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/change_information_form_view.dart/view/change_information_form_view.dart';
import 'package:md_health/Screens/message/view/message_view.dart';
import 'package:md_health/Screens/health/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/cancel_reason_pop_view.dart';
import 'package:md_health/Screens/health/packages/view/package_detail_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcitvePackageView extends StatefulWidget {
  final String? index;
  final String? packageId;
  final String? purchaseId;
  final String? cancelId;
  const AcitvePackageView(
      {super.key, this.index, this.packageId, this.purchaseId, this.cancelId});

  @override
  State<AcitvePackageView> createState() => _AcitvePackageViewState();
}

class _AcitvePackageViewState extends State<AcitvePackageView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<PackageViewController>().initState(
          context, widget.packageId, widget.purchaseId, widget.cancelId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PackageViewController>();
    final watch = context.watch<PackageViewController>();

    return
        //  watch.isLoading
        //     ? Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         SizedBox(height: 200.h),
        //         const Loader(),
        //       ]
        //     )
        //     :
        //  watch.isLoading
        //     ? Loader()
        //     :
        Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
        //   child: PackageDropDownSearchList(
        //     textEditingController: null,
        //     iconPadding: EdgeInsets.only(right: 32),
        //     // titleHeader: "*Patient Country",
        //     onChanged: (value) {
        //       // read.onSelectAccountType(value);
        //     },
        //     hint: "List for date", hintSize: 16.sp,
        //     items: [
        //       // DropdownMenuItem(
        //       //   value: "current",
        //       //   child: Text(
        //       //     "Current",
        //       //     style: TextStyle(
        //       //       fontSize: 14.sp,
        //       //     ),
        //       //   ),
        //       // ),
        //       // DropdownMenuItem(
        //       //   value: "saving",
        //       //   child: Text(
        //       //     "Saving",
        //       //     style: TextStyle(
        //       //       fontSize: 14.sp,
        //       //     ),
        //       //   ),
        //       // )
        //     ],
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(
            right: 19.0.w,
            left: 19.0.w,
            // top: 13.h,
          ),
          child: SizedBox(
            height: 36.h,
            child: TextField(
              onChanged: (value) {
                read.activeSearchList(context);
              },

              // autofocus: widget.isSearchFocus ?? true,
              controller: watch.searchController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: black),
                    borderRadius: BorderRadius.circular(8.w)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: kDefaultActiveColor),
                    borderRadius: BorderRadius.circular(8.w)),
                hintText: 'Search Packages.......',
                hintStyle: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: black,
                        // letterSpacing: .5,
                        fontSize: 11,
                        fontWeight: FontWeight.w400)),
                prefixIcon: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    // alignment: Alignment.topRight,
                  ),
                  //  SvgPicture.asset(
                  //   'assets/icons/search.svg',
                  //   width: 15.w,
                  //   height: 15.h,
                  // ),
                  onPressed: () {
                    // Perform the search here
                  },
                ),
              ),
            ),
          ),
        ),
        Container(
            child: watch.customerPurchasePackageActiveList?.isNotEmpty == true
                ? ListView.builder(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 12.w),
                    itemCount:
                        watch.customerPurchasePackageActiveList?.length ?? 0,
                    //  watch.customerPurchasePackageActiveList??,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext, index) {
                      final element =
                          watch.customerPurchasePackageActiveList?[index];
                      return Container(
                        padding: EdgeInsets.only(bottom: 17.w),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            // color: Colors.amber,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                // border: Border.all(color: const Color(0xffEFEFEF)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      blurStyle: BlurStyle.outer)
                                ]),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 16.w, right: 18.w, top: 13.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      element?.companyLogoImagePathS == ""
                                          ? SizedBox(
                                              height: 50.w,
                                              width: 50.w,
                                              child: Image.asset(
                                                "assets/images/image_not_found.png",
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : SizedBox(
                                              height: 50.w,
                                              width: 50.w,
                                              child: AppNetworkImages(
                                                imageUrl:
                                                    "${element?.companyLogoImagePathS}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${element?.companyName}",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: black,
                                                // letterSpacing: 5.5,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Text(
                                              element?.orderId ?? '',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: black,
                                                  // letterSpacing: 5.5,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Text(
                                              "${element?.packageName}",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: black,
                                                  // letterSpacing: 5.5,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                  color: Color(0xff212121),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/time.svg',
                                            alignment: Alignment.topRight,
                                          ),
                                          Text(
                                            "Treatment Periods-${element?.treatmentPeriodInDays}Days",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Color(0xff212121),
                                                fontSize: 13,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      PrimaryButton(
                                        borderColor: Colors.black,
                                        width: 145.w,
                                        height: 30.w,
                                        // borderRadius: BorderRadius.circular(),
                                        borderRadius: 5,
                                        // width: ScreenUtil().screenWidth,
                                        color: Colors.transparent,
                                        onTap: () {
                                          print(
                                            element?.purchaseId.toString(),
                                          );
                                          print(element?.id.toString());

                                          // return;
                                          Navigator.push(
                                            context,
                                            SlidePageRoute(
                                              page: PackageDetailView(
                                                  type: element?.type,
                                                  purchesId: element?.purchaseId
                                                      .toString(),
                                                  packageId:
                                                      element?.id.toString()),
                                              direction: SlideDirection
                                                  .right, // Specify the slide direction here
                                              delay:
                                                  Duration(milliseconds: 5000),
                                            ),
                                          );
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           PackageDetailView(
                                          // packageId:
                                          //     element?.id.toString())),
                                          // );
                                        },
                                        child: Text(
                                          "Package Details",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              // letterSpacing: .5,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      element?.buttonType == "disabled"
                                          ? PrimaryButton(
                                              width: 145.w,
                                              height: 30.w,
                                              // borderRadius: BorderRadius.circular(),
                                              borderRadius: 5,
                                              // width: ScreenUtil().screenWidth,

                                              color: Colors.black,
                                              onTap: () {
                                                print(element?.id);
                                                print(element?.purchaseId
                                                    .toString());
                                                print(element?.type.toString());
                                                // return;
                                                Navigator.push(
                                                  context,
                                                  SlidePageRoute(
                                                    page:
                                                        ChangeInformationFormView(
                                                            type: element?.type,
                                                            purchaseId: element
                                                                ?.purchaseId
                                                                .toString(),
                                                            packageId: element
                                                                ?.id
                                                                .toString()),
                                                    direction: SlideDirection
                                                        .right, // Specify the slide direction here
                                                    delay: Duration(
                                                        milliseconds: 5000),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Disabled",
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.white,
                                                    // letterSpacing: .5,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          : PrimaryButton(
                                              width: 145.w,
                                              height: 30.w,
                                              // borderRadius: BorderRadius.circular(),
                                              borderRadius: 5,
                                              // width: ScreenUtil().screenWidth,

                                              color: Colors.black,
                                              onTap: () {
                                                print(element?.id);
                                                print(element?.purchaseId
                                                    .toString());
                                                print(element?.type.toString());
                                                // return;
                                                Navigator.push(
                                                  context,
                                                  SlidePageRoute(
                                                    page:
                                                        ChangeInformationFormView(
                                                            type: element?.type,
                                                            purchaseId: element
                                                                ?.purchaseId
                                                                .toString(),
                                                            packageId: element
                                                                ?.id
                                                                .toString()),
                                                    direction: SlideDirection
                                                        .right, // Specify the slide direction here
                                                    delay: Duration(
                                                        milliseconds: 5000),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Change Patient Info",
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.white,
                                                    // letterSpacing: .5,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  PrimaryButton(
                                    // borderColor: Colors.black,
                                    // width: 161.w,
                                    height: 30.w,
                                    // borderRadius: BorderRadius.circular(),
                                    borderRadius: 5,
                                    // width: ScreenUtil().screenWidth,
                                    // color: Colors.(0xff4CDB06),
                                    color: Color(0xff4CDB06),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MessageListView()),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/icons/message.svg"),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          "Message",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              // letterSpacing: .5,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  PrimaryButton(
                                    height: 30.w,
                                    borderRadius: 5,
                                    color: Color(0xffF55C5C),
                                    onTap: () {
                                      print(element?.id.toString());
                                      print(element?.purchaseId.toString());
                                      element?.id;
                                      element?.purchaseId.toString();
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15.0))),
                                              contentPadding:
                                                  EdgeInsets.only(top: 0.0),
                                              content: PackageCancellationPopUp(
                                                cancelId:
                                                    element?.id.toString(),
                                                purchaseId: element?.purchaseId
                                                    .toString(),
                                                packageId:
                                                    element?.id.toString(),
                                              )));
                                    },
                                    child: Text(
                                      "Cancellation Request",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.white,
                                          // letterSpacing: .5,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120.h,
                        ),
                        SvgPicture.asset(
                          "assets/icons/No-orders-found.svg",
                          // width: 10,
                        ),
                      ],
                    ),
                  )),
      ],
    );
  }
}
