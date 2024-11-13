import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/my_details/controller/my_package_detail_view_controller.dart';
import 'package:md_health/Screens/health/my_documents/view/my_document_view.dart';
import 'package:md_health/Screens/health/packages/controller/package_detail_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/package_detail_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';

class PackageMyDetailView extends StatefulWidget {
  final String? packageId;
  final String? patientId;
  final String? purchaseId;
  final String? type;
  const PackageMyDetailView(
      {super.key, this.packageId, this.patientId, this.purchaseId, this.type});

  @override
  State<PackageMyDetailView> createState() => _PackageMyDetailViewState();
}

class _PackageMyDetailViewState extends State<PackageMyDetailView> {
  @override
  void initState() {
    super.initState();
    // Assuming MyPackageDetailController is used as a provider in the widget tree
    context.read<MyPackageDetailController>().initState(
          context,
          widget.packageId ?? '',
          widget.patientId ?? '',
          widget.purchaseId ?? '',
          widget.type ?? '',
        );
  }

  @override
  Widget build(BuildContext context) {
    final watchPackageDetail = context.read<PackageDetailViewController>();
    final watch = context.watch<MyPackageDetailController>();

    print("mydata ${watch.patientInformation?.patientEmail} ");
    print("mydddddddata ${watch.treatmentInformation} ");
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: PackageDetailView(
              type: widget.type,
              purchesId: watch.purchesId,
              packageId: watch.packageId,
            ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );

        return false;
      },
      backgroundColor: Color(0xffF5F5F5),
      // appBar: PackageAppBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(123.h),
        child: CustomAppBar(
          onBackPressed: () {
            print(
              watch.purchesId,
            );
            print(
              watch.packageId,
            );
            // return;
            Navigator.pushReplacement(
              context,
              SlidePageRoute(
                page: PackageDetailView(
                  type: widget.type,
                  purchesId: watch.purchesId,
                  packageId: watch.packageId,
                ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: Duration(milliseconds: 5000),
              ),
            );
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PackageDetailView(
            //               packageId: widget.packageId,
            //             )));
          },
          hasBackButton: true,
          drawerTitle: 'Packages',
          // hasBackButton: true,
          hasMdTitle: false,
          // drawerTitle: "Orders",
        ),
      ),
      content: watch.isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                Loader(),
              ],
            )
          : Builder(builder: (context) {
              return Container(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      // color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 16.w, right: 18.w, top: 13.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  watchPackageDetail.customerPurchasePackageList
                                              ?.companyLogoImagePathS ==
                                          ""
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
                                                "${watchPackageDetail.customerPurchasePackageList?.companyLogoImagePathS}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200.w,
                                        child: Text(
                                          "${watchPackageDetail.customerPurchasePackageList?.companyName}",

                                          // "Memorial Hospital",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: black,
                                              // letterSpacing: 5.5,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Container(
                                        width: 200.w,
                                        child: Text(
                                          "${watchPackageDetail.customerPurchasePackageList?.packageName}",
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
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/location.svg',
                                      // alignment: Alignment.topRight,
                                    ),
                                    Text(
                                      "${watchPackageDetail.customerPurchasePackageList?.cityName}",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Campton',
                                          color: Color(0xff212121),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/time.svg',
                                      alignment: Alignment.topRight,
                                    ),
                                    Text(
                                      "Treatment Periods-${watchPackageDetail.customerPurchasePackageList?.treatmentPeriodInDays}Days",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Color(0xff212121),
                                          fontSize: 13.sp,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 3.w),
                              child: Text(
                                "${watchPackageDetail.customerPurchasePackageList?.treatmentStartDate}",
                                // "Time left to treatment: 12 Days",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Color(0xff212121),
                                    fontSize: 14.sp,
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            // SizedBox(
                            //   height: 21.h,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     PrimaryButton(
                            //       width: 140.w,
                            //       height: 30.w,
                            //       // borderRadius: BorderRadius.circular(),
                            //       borderRadius: 5,
                            //       // width: ScreenUtil().screenWidth,
                            //       color: Colors.black,
                            //       onTap: () {
                            //         // Navigator.push(
                            //         //   context,
                            //         //   MaterialPageRoute(builder: (context) => SignUpView()),
                            //         // );
                            //       },
                            //       child: Text(
                            //         "My Details",
                            //         style: TextStyle(
                            //             fontFamily: 'Campton',
                            //             color: Colors.white,
                            //             // letterSpacing: .5,
                            //             fontSize: 14.sp,
                            //             fontWeight: FontWeight.w600),
                            //       ),
                            //     ),
                            //     PrimaryButton(
                            //       borderColor: Colors.black,
                            //       width: 140.w,
                            //       height: 30.w,
                            //       // borderRadius: BorderRadius.circular(),
                            //       borderRadius: 5,
                            //       // width: ScreenUtil().screenWidth,
                            //       color: Colors.transparent,
                            //       onTap: () {
                            //         print(widget.patientId);
                            //         print(watch.purchesId);
                            //         print(watch.packageId);
                            //         // return;
                            //         Navigator.push(
                            //           context,
                            //           SlidePageRoute(
                            //             page: PackageMyDocumentView(
                            //               patientId: widget.patientId,
                            //               screenName: "PackageMyDetailView",
                            //               purchaseId: watch.purchesId,
                            //               packageId: watch.packageId.toString(),
                            //             ),
                            //             direction: SlideDirection
                            //                 .right, // Specify the slide direction here
                            //             delay: Duration(milliseconds: 5000),
                            //           ),
                            //         );
                            //         // Navigator.push(
                            //         //   context,
                            //         //   MaterialPageRoute(
                            //         //       builder: (context) =>
                            //         //           PackageDetailView(
                            //         //             purchesId: watch.packageId,
                            //         //             packageId: widget.packageId,
                            //         //           )),
                            //         // );
                            //       },
                            //       child: Text(
                            //         "My Documents",
                            //         style: TextStyle(
                            //             fontFamily: 'Campton',
                            //             color: Colors.black,
                            //             // letterSpacing: .5,
                            //             fontSize: 14.sp,
                            //             fontWeight: FontWeight.w600),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // margin: EdgeInsets.all(18.0.w),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 18.0.w, top: 38.w, right: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 3.w),
                              child: Text(
                                "  Your Case Manager",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    // letterSpacing: .5,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3.w),
                              child: Text(
                                "  ${watchPackageDetail.customerPurchasePackageList?.caseManegar ?? "Not Available"}",
                                // "  Abdul G.",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Color(0xffF3771D),
                                    // letterSpacing: .5,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3.w),
                              child: Text(
                                "  Patient Details",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    // letterSpacing: .5,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "First Name",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.patientInformation
                                              ?.patientFirstName ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              // height: 57.h,

                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Last Name",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.patientInformation
                                              ?.patientLastName ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              // height: 57.h,
                              // width: ScreenUtil().scaleWidth,
                              // padding: EdgeInsets.only(
                              //     left: 20.w, right: 150.w, top: 5.w, bottom: 8.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.patientInformation
                                              ?.patientContactNo ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "E-mail",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.patientInformation?.patientEmail ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Country",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      // watch.patientInformation?.countryName ?? "",
                                      watch.patientInformation?.countryName ??
                                          "",

                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "City",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.patientInformation?.cityName ?? "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 41.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // margin: EdgeInsets.all(18.0.w),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 14.0.w, top: 30.w, right: 14.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "  Treatment Details",
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  // letterSpacing: .5,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hospital Name",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.treatmentInformation?.companyName ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              // height: 57.h,

                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Treatment",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.treatmentInformation
                                              ?.productSubCategoryName ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              // height: 57.h,
                              // width: ScreenUtil().scaleWidth,
                              // padding: EdgeInsets.only(
                              //     left: 20.w, right: 150.w, top: 5.w, bottom: 8.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Contact Number",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.treatmentInformation?.mobileNo ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Country",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      // "",
                                      "${watch.treatmentInformation?.countryNames ?? ""}",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 42.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "City",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Text(
                                      watch.treatmentInformation?.cityNames ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xff8B8B8B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: Color(0xffBFBFBF),
                                ),
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              child: Container(
                                height: 60.h,
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.only(
                                    left: 20.w, top: 5.w, bottom: 6.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address",
                                      style: TextStyle(
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: black),
                                    ),
                                    Flexible(
                                      child: Text(
                                        // "",
                                        watch.treatmentInformation?.address ??
                                            "",
                                        style: TextStyle(
                                            fontFamily: "Campton",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: Color(0xff8B8B8B)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            PrimaryButton(
                              height: 48.h,
                              // borderColor: Colors.black,
                              width: 366.w,
                              // height: 35.w,
                              // borderRadius: BorderRadius.circular(),
                              borderRadius: 30.w,
                              // width: ScreenUtil().screenWidth,
                              // color: Colors.(0xff4CDB06),
                              color: Color(0xff34A853),
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => SignUpView()),
                                // );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/arcticons_google-maps-alt.svg",
                                    width: 25.w,
                                  ),
                                  // SizedBox(
                                  //   width: 10.w,
                                  // ),
                                  Text(
                                    " Hospital Location on Google Maps",
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.white,
                                        // letterSpacing: .5,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 41.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              );
            }),
    );
  }
}
