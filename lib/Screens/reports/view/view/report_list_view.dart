import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/order_details/view/md_shop_view.dart';
import 'package:md_health/Screens/reports/controller/reports_list_controller.dart';
import 'package:md_health/Screens/reports/view/view/report_detail_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ReportsListController>().initState(context
          // context, widget.packageId, widget.purchaseId, widget.cancelId
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ReportsListController>();
    final watch = context.watch<ReportsListController>();
    return BaseScreen(
        onWillPop: () async {
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
          // Navigator.pop(context);

          return false;
        },
        backgroundColor: Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.w),
          child: CustomAppBar(
            // hasBackButton: ,
            hasMdTitle: false,
            drawerTitle: "Reports",
          ),
        ),
        content: Column(
          children: [
            SizedBox(
              height: 48.w,
            ),
            Container(
                // margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 38.w),
                child: watch.providerReportList?.isNotEmpty == true
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: watch.providerReportList?.length ?? 0,
                        itemBuilder: (context, index) {
                          final element = watch.providerReportList?[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: ReportDetailView(
                                      logo: element?.logo,
                                      name: element?.companyName,
                                      providerId:
                                          element?.providerId.toString(),
                                      purcheseId:
                                          element?.purchaseId.toString()),
                                  direction: SlideDirection
                                      .right, // Specify the slide direction here
                                  delay: Duration(milliseconds: 5000),
                                ),
                                // MaterialPageRoute(
                                //     builder: (context) =>
                                //     ReportDetailView( )
                                //     ),
                              );
                              //
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 18.w,
                                right: 18.w,
                              ),
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   height: 100,
                                  // ),
                                  Container(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20.w,
                                          right: 30.w,
                                          top: 17.w,
                                          bottom: 18.w),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              // offset: Offset(2, 2),
                                              blurRadius: 20,
                                            ),
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              element?.logo == ""
                                                  ? Image(
                                                      image: NetworkImage(
                                                          element?.logo ?? ""
                                                          // "assets/images/Rectangle 707.png"
                                                          ),
                                                      width: 44.w,
                                                      height: 44.h,
                                                    )
                                                  : Container(),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              // SvgPicture.asset("assets/icons/food.svg"),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${element?.companyName}',
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'Reports',
                                                      style: TextStyle(
                                                          fontFamily: 'Campton',
                                                          color: Colors.black,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w500),

                                                      /*defining default style is optional */
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              ' (${element?.reportCount})',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Campton',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                              "assets/icons/forword.svg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120.h,
                            ),
                            SvgPicture.asset(
                              "assets/icons/No-Reports-Found.svg",
                              // width: 10,
                            ),
                          ],
                        ),
                      )),
          ],
        ));
  }
}
