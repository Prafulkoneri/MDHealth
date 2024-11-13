import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/my_details/view/package_my_details_view.dart';
import 'package:md_health/Screens/health/my_documents/controller/my_documents_controller.dart';
import 'package:md_health/Screens/health/packages/controller/package_detail_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/package_detail_view.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
// import '../../../test_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageMyDocumentView extends StatefulWidget {
  final String? packageId;
  final String? screenName;
  final String? purchaseId;
  final String? patientId;
  final String? type;
  const PackageMyDocumentView(
      {super.key,
      this.packageId,
      this.purchaseId,
      this.screenName,
      this.type,
      this.patientId});

  @override
  State<PackageMyDocumentView> createState() => _PackageMyDocumentViewState();
}

class _PackageMyDocumentViewState extends State<PackageMyDocumentView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<MyDocumnetsListController>()
          .initState(context, widget.packageId.toString(), widget.purchaseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<MyDocumnetsListController>();
    final watch = context.watch<MyDocumnetsListController>();
    final watchPackage = context.watch<PackageDetailViewController>();

    return BaseScreen(
      onWillPop: () async {
        if (widget.screenName == "PackageMyDetailView") {
          print('dhfkljjhkgrahio2');
          Navigator.push(
            context,
            SlidePageRoute(
              page: PackageMyDetailView(
                patientId: widget.patientId,
                type: widget.type,
                purchaseId: widget.purchaseId.toString(),
                packageId: watch.packageId,
              ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: const Duration(milliseconds: 5000),
            ),
          );
        } else {
          print('2');
          Navigator.push(
            context,
            SlidePageRoute(
              page: PackageDetailView(
                type: widget.type,
                purchesId: widget.purchaseId.toString(),
                packageId: watch.packageId,
              ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: const Duration(milliseconds: 5000),
            ),
          );
        }
        return false;
      },
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: CustomAppBar(
          onBackPressed: () {
            print(
              widget.purchaseId,
            );
            print(
              watch.packageId,
            );
            print(
              widget.patientId,
            );
            // return;
            if (widget.screenName == "PackageMyDetailView") {
              print('dhfkljjhkgrahio2');
              Navigator.push(
                context,
                SlidePageRoute(
                  page: PackageMyDetailView(
                    patientId: widget.patientId,
                    type: widget.type,
                    purchaseId: widget.purchaseId.toString(),
                    packageId: watch.packageId,
                  ),
                  direction:
                      SlideDirection.left, // Specify the slide direction here
                  delay: const Duration(milliseconds: 5000),
                ),
              );
            } else {
              print('2');
              Navigator.push(
                context,
                SlidePageRoute(
                  page: PackageDetailView(
                    type: widget.type,
                    purchesId: widget.purchaseId.toString(),
                    packageId: watch.packageId,
                  ),
                  direction:
                      SlideDirection.left, // Specify the slide direction here
                  delay: const Duration(milliseconds: 5000),
                ),
              );
            }
            // widget.screenName != "PackageMyDetailView"
            //     ? Navigator.push(
            //         context,
            //         SlidePageRoute(
            //           page: PackageMyDetailView(
            //             patientId: widget.patientId,
            //             type: widget.type,
            //             purchaseId: widget.purchaseId.toString(),
            //             packageId: watch.packageId,
            //           ),
            //           direction: SlideDirection
            //               .left, // Specify the slide direction here
            //           delay: const Duration(milliseconds: 5000),
            //         ),
            //       )
            //     : Navigator.push(
            //         context,
            //         SlidePageRoute(
            //           page: PackageDetailView(
            //             type: widget.type,
            //             purchesId: widget.purchaseId.toString(),
            //             packageId: watch.packageId,
            //           ),
            //           direction: SlideDirection
            //               .left, // Specify the slide direction here
            //           delay: const Duration(milliseconds: 5000),
            //         ),
            //       );

            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PackageDetailView(
            //               purchesId: widget.purchaseId.toString(),
            //               packageId: watch.packageId,
            //             )));
          },
          hasBackButton: true,
          hasMdTitle: false,
          drawerTitle: 'My Documents',
        ),
      ),
      // onWillPop: () async {
      //   widget.screenName == "PackageMyDetailView"
      //       ? Navigator.push(
      //           context,
      //           SlidePageRoute(
      //             page: PackageDetailView(
      //               type: widget.type,
      //               purchesId: widget.purchaseId.toString(),
      //               packageId: watch.packageId,
      //             ),
      //             direction:
      //                 SlideDirection.left, // Specify the slide direction here
      //             delay: const Duration(milliseconds: 5000),
      //           ),
      //         )
      //       : Navigator.push(
      //           context,
      //           SlidePageRoute(
      //             page: PackageDetailView(
      //               type: widget.type,
      //               purchesId: widget.purchaseId.toString(),
      //               packageId: watch.packageId,
      //             ),
      //             direction:
      //                 SlideDirection.left, // Specify the slide direction here
      //             delay: const Duration(milliseconds: 5000),
      //           ),
      //         );

      //   return false;
      // },
      // backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(125.h),
      //   child: CustomAppBar(
      //     onBackPressed: () {
      //       print(
      //         widget.purchaseId,
      //       );
      //       print(
      //         watch.packageId,
      //       );
      //       // return;
      //       widget.screenName == "PackageMyDetailView"
      //           ? Navigator.push(
      //               context,
      //               SlidePageRoute(
      //                 page: PackageDetailView(
      //                   type: widget.type,
      //                   purchesId: widget.purchaseId.toString(),
      //                   packageId: watch.packageId,
      //                 ),
      //                 direction: SlideDirection
      //                     .left, // Specify the slide direction here
      //                 delay: const Duration(milliseconds: 5000),
      //               ),
      //             )
      //           : Navigator.push(
      //               context,
      //               SlidePageRoute(
      //                 page: PackageDetailView(
      //                   type: widget.type,
      //                   purchesId: widget.purchaseId.toString(),
      //                   packageId: watch.packageId,
      //                 ),
      //                 direction: SlideDirection
      //                     .left, // Specify the slide direction here
      //                 delay: const Duration(milliseconds: 5000),
      //               ),
      //             );
      //       // Navigator.pushReplacement(
      //       //     context,
      //       //     MaterialPageRoute(
      //       //         builder: (context) => PackageDetailView(
      //       // purchesId: widget.purchaseId.toString(),
      //       // packageId: watch.packageId,
      //       //             )));
      //     },
      //     hasBackButton: true,
      //     hasMdTitle: false,
      //     drawerTitle: 'My Documents',
      //   ),
      // ),
      content: Builder(builder: (context) {
        return Container(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Container(
                  padding: EdgeInsets.only(left: 16.w, right: 18.w, top: 13.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Row(
                          children: [
                            watchPackage.customerPurchasePackageList
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
                                          "${watchPackage.customerPurchasePackageList?.companyLogoImagePathS}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200.w,
                                  child: Text(
                                    "${watchPackage.customerPurchasePackageList?.companyName}",
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: 'Campton',
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
                                    "${watchPackage.customerPurchasePackageList?.packageName}",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/location.svg',
                                // alignment: Alignment.topRight,
                              ),
                              Container(
                                width: 100.w,
                                child: Text(
                                  "${watchPackage.customerPurchasePackageList?.cityName}",

                                  // "Beşiktaş",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Campton',
                                      color: const Color(0xff212121),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                                ),
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
                                "Treatment Periods-${watchPackage.customerPurchasePackageList?.treatmentPeriodInDays}Days",

                                // "Treatment Periods 3-5 days",
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: const Color(0xff212121),
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
                          // "Time left to treatment: 12 Days",
                          "${watchPackage.customerPurchasePackageList?.treatmentStartDate}",

                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: const Color(0xff212121),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      PrimaryButton(
                        width: 366.w,
                        height: 67.h,
                        borderRadius: 50,
                        color: const Color(0xff4CDB06),
                        onTap: () {
                          read.onChooseFiles(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/solar_upload-outline.svg",
                              // width: 20.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Upload Documents",
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  // letterSpacing: .5,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 160.h,
              //   width: 160.w,
              //   // height: 112.h,
              //   // width: 310.w,
              //   // width: ScreenUtil().screenWidth,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(width: 1, color: black)),
              //   child: Image.file(
              //     watch.fileImage1,
              //     fit: BoxFit.contain,
              //   ),
              // ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      // color:Colors.blueAccent,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer)
                      ]),
                  padding: EdgeInsets.only(
                      left: 20.0.w, top: 29.w, right: 20.w, bottom: 0.w),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Documents",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: const Color(0xff000000),
                              // letterSpacing: .5,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.w),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: watch.documentDataL?.length ?? 0,
                              itemBuilder: (context, index) {
                                final element = watch.documentDataL?[index];
                                // if (element?.customerDocumentImagePath != "") {
                                return Container(
                                  padding: const EdgeInsets.only(
                                    // right: 8.0,
                                    top: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  // height: 43.h,
                                                  // width: 43.w,
                                                  padding: EdgeInsets.only(
                                                    left: 5.w,
                                                    right: 5.w,
                                                    top: 10.w,
                                                    bottom: 10.w,
                                                  ),
                                                  // height: 43.h,
                                                  // width: 43.w,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD9D9D9),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: AppNetworkImages(
                                                    width: 27.w,
                                                    height: 29.w,
                                                    imageUrl: element
                                                        ?.customerDocumentImagePath,
                                                  )),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Container(
                                                width: 150.w,
                                                child: Text(
                                                  // "Documnts",
                                                  "${element?.customerDocumentImageName ?? ""}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Colors.black,
                                                      // letterSpacing: .5,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  String url = element!
                                                      .customerDocumentImagePath
                                                      .toString();
                                                  if (url != null) {
                                                    // Open the URL using url_launcher
                                                    await launchUrl(
                                                        Uri.parse(url));

                                                    // Download the file using http
                                                    // await downloadFile(url, '/path/to/save/file'); // Specify the desired save path
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/icons/visibel.svg",
                                                    width: 30.w,
                                                    height: 25.h),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // read.removeDocument(context,
                                                  //     element?.id.toString(), "");
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(15.0))),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            0.0),
                                                                content:
                                                                    Container(
                                                                  width: ScreenUtil()
                                                                      .screenWidth,
                                                                  height: 350.h,
                                                                  // padding:
                                                                  //     EdgeInsets.only(bottom: 10.w),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(15), // Image border
                                                                              child: SizedBox.fromSize(
                                                                                // size: Size.fromRadius(
                                                                                //     10), // Image radius
                                                                                child: const Image(image: AssetImage("assets/images/pop__new_.png")),
                                                                              ),
                                                                            ),

                                                                            // Image(
                                                                            //     image: AssetImage(
                                                                            //         "assets/images/pop__new_.png")),
                                                                          ),
                                                                          Positioned(
                                                                              top: 25,
                                                                              // right: 135,
                                                                              left: 120,
                                                                              child: Column(
                                                                                children: [
                                                                                  SvgPicture.asset("assets/icons/delete_red.svg"),
                                                                                  SizedBox(
                                                                                    height: 15.h,
                                                                                  ),
                                                                                  Text(
                                                                                    "Delete",
                                                                                    style: TextStyle(
                                                                                        fontFamily: "Campton",
                                                                                        color: Colors.white,
                                                                                        // letterSpacing: .5,
                                                                                        fontSize: 30.sp,
                                                                                        fontWeight: FontWeight.w700),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            38.h,
                                                                      ),
                                                                      Text(
                                                                        "Do you want delete\nthis document?",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontFamily: "Campton",
                                                                            color: Colors.black,
                                                                            // letterSpacing: .5,
                                                                            fontSize: 21.sp,
                                                                            fontWeight: FontWeight.w600),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20.h,
                                                                      ),
                                                                      Text(
                                                                        '"After a file is deleted, it cannot be\n recovered."',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontFamily: "Campton",
                                                                            color: Colors.black,
                                                                            // letterSpacing: .5,
                                                                            fontSize: 14.sp,
                                                                            fontWeight: FontWeight.w400),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            48.h,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          PrimaryButton(
                                                                            // borderColor:
                                                                            //     Colors
                                                                            //         .black,
                                                                            width:
                                                                                125.w,
                                                                            height:
                                                                                35.w,
                                                                            // borderRadius: BorderRadius.circular(),
                                                                            borderRadius:
                                                                                25,
                                                                            // width: ScreenUtil().screenWidth,
                                                                            color:
                                                                                kDefaultActiveColor,
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                              read.removeDocument(
                                                                                context,
                                                                                element?.id.toString(),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              "Yes",
                                                                              style: TextStyle(
                                                                                  fontFamily: "Campton",
                                                                                  color: Colors.black,
                                                                                  // letterSpacing: .5,
                                                                                  fontSize: 16.sp,
                                                                                  fontWeight: FontWeight.w600),
                                                                            ),
                                                                          ),
                                                                          PrimaryButton(
                                                                            width:
                                                                                125.w,
                                                                            height:
                                                                                35.w,
                                                                            // borderRadius: BorderRadius.circular(),
                                                                            borderRadius:
                                                                                25,
                                                                            // width: ScreenUtil().screenWidth,
                                                                            color:
                                                                                const Color(0xffF55C5C),
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              "No",
                                                                              style: TextStyle(
                                                                                  fontFamily: "Campton",
                                                                                  color: Colors.white,
                                                                                  // letterSpacing: .5,
                                                                                  fontSize: 16.sp,
                                                                                  fontWeight: FontWeight.w600),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/icons/delete.svg",
                                                    width: 30.w,
                                                    height: 27.h),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      if (index <
                                          watch.documentDataL!.length -
                                              1) // Check if it's not the last item
                                        const Divider(
                                            thickness: 1,
                                            color: Color(0xff4CDB06)),
                                    ],
                                  ),
                                );
                                // }
                                // else {
                                //   return Container();
                                // }
                              }),
                        ),
                      ],
                    ),
                  )),
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
