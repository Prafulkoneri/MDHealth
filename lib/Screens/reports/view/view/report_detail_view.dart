// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/reports/controller/report_details_controller.dart';
import 'package:md_health/Screens/reports/view/view/report_list_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ReportDetailView extends StatefulWidget {
  String? providerId;
  String? purcheseId;
  String? name;
  String? logo;
  ReportDetailView({
    Key? key,
    this.providerId,
    this.purcheseId,
    required this.name,
    required this.logo,
  }) : super(key: key);

  @override
  State<ReportDetailView> createState() => _ReportDetailViewState();
}

class _ReportDetailViewState extends State<ReportDetailView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ReoprtDetailsController>().initState(
            context,
            widget.providerId,
            widget.purcheseId,
          );
    });
  }

  Future<void> downloadFile(String url, String savePath) async {
    try {
      final response = await http.get(Uri.parse(url));
      final File file = File(savePath);
      await file.writeAsBytes(response.bodyBytes);
      print('File downloaded to: $savePath');
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ReoprtDetailsController>();
    final watch = context.watch<ReoprtDetailsController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: ReportView(

                // packageId: watch.packageId,
                ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
          // MaterialPageRoute(
          //     builder: (context) => InformationFormView
          //             // SearchDetailsView
          //             (
          //           packageId: watch.packageId,
          //           screenName: "infotmation",
          //           // packageId: watch.packageId,
          //         ))
        );
        // Navigator.pushReplacement(
        //   context,
        //   SlidePageRoute(
        //     page: SearchDetailsView(
        //       packageId: widget.packageId,

        //       // packageId: watch.packageId,
        //     ),
        //     direction: SlideDirection.left, // Specify the slide direction here
        //     delay: Duration(milliseconds: 5000),
        //   ),
        //   // MaterialPageRoute(
        //   //     builder: (context) => SearchDetailsView(
        //   //           packageId: watch.packageId,
        //   //         ))
        // );
        Navigator.pop(context);

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: CustomAppBar(
          onBackPressed: () {
            Navigator.pushReplacement(
              context,
              SlidePageRoute(
                page: ReportView(

                    // packageId: watch.packageId,
                    ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: Duration(milliseconds: 5000),
              ),
              // MaterialPageRoute(
              //     builder: (context) => InformationFormView
              //             // SearchDetailsView
              //             (
              //           packageId: watch.packageId,
              //           screenName: "infotmation",
              //           // packageId: watch.packageId,
              //         ))
            );
          },
          hasBackButton: true,
          // hasBackButton: ,
          hasMdTitle: false,
          drawerTitle: "Reports",
        ),
      ),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 27.h,
            ),
            widget.logo == ""
                ? Image(
                    image: NetworkImage(widget.logo ?? ""
                        // "assets/images/Rectangle 707.png"
                        ),
                    width: 44.w,
                    height: 44.h,
                  )
                : Container(),
            // Image(
            //   image: const AssetImage("assets/images/Rectangle 707.png"),
            //   width: 44.w,
            //   height: 44.h,
            // ),
            SizedBox(
              height: 13.h,
            ),
            Text(
              "${widget.name}",
              // "Acıbadem Hospital",
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              child: ListView.builder(
                itemCount: watch.providerReportList?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final element = watch.providerReportList?[index];
                  return Container(
                    margin: EdgeInsets.only(left: 10.w, top: 21.w, right: 10.w),
                    padding: EdgeInsets.only(
                        left: 22.w, top: 27.w, bottom: 23.w, right: 22.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            // offset: Offset(2, 2),
                            blurRadius: 20,
                          ),
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              child: Text(
                                '${element?.reportTitle}',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              // "Upload Time: 29 Dec 2023",
                              '${element?.createdAt}',
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                // onTap: () async {
                                //   launchUrl(Uri.parse(
                                //           element!.reportPath.toString()))
                                //       .onError(
                                //     (error, stackTrace) {
                                //       print("Url is not valid!");
                                //       return false;
                                //     },
                                //   );
                                // },
                                onTap: () async {
                                  String url = element!.reportPath.toString();
                                  if (url != null) {
                                    // Open the URL using url_launcher
                                    await launchUrl(Uri.parse(url));

                                    // Download the file using http
                                    await downloadFile(url,
                                        '/path/to/save/file'); // Specify the desired save path
                                  }
                                },

                                child: SvgPicture.asset(
                                  "assets/icons/Group 4.svg",
                                  width: 55.w,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  String url = element!.reportPath.toString();
                                  if (url != null) {
                                    // Open the URL using url_launcher
                                    await launchUrl(Uri.parse(url));

                                    // Download the file using http
                                    await downloadFile(url,
                                        '/path/to/save/file'); // Specify the desired save path
                                  }
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/print.svg",
                                  width: 55.w,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
