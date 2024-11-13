import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/message/controller/conversations_list_controller.dart';
import 'package:md_health/Screens/message/controller/live_convertion_list_controller.dart';
import 'package:md_health/Screens/message/view/message_view.dart';
import 'package:md_health/Screens/message/view/new_message_view.dart';
import 'package:md_health/Screens/message/view/video_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveConversionView extends StatefulWidget {
  const LiveConversionView({super.key});

  @override
  State<LiveConversionView> createState() => _LiveConversionViewState();
}

class _LiveConversionViewState extends State<LiveConversionView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LiveConvertionListController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<LiveConvertionListController>();
    final watch = context.watch<LiveConvertionListController>();
    return BaseScreen(
        onWillPop: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessageListView()),
          );

          return false;
        },
        backgroundColor: Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.h),
          child: CustomAppBar(
            onBackPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageListView()),
              );
            },
            hasBackButton: true,
            hasMdTitle: false,
            drawerTitle: 'Messages',
          ),
        ),
        content: watch.isLoading 
        ? Column(
          children: [
            SizedBox(height: 150.h),
            const Loader(),
          ]
        )
        : Stack(
          children: [
            Positioned(
              child: _circle(),
              top: -5,
              left: -5,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 23.h,
                ),
                SvgPicture.asset("assets/icons/fluent_live-24-filled.svg"),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Live Conversation Appointments",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      // letterSpacing: .5,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 18.w, right: 16.w),
                  child: ListView.builder(
                    // padding: EdgeInsets.symmetric(horizontal: 18.w),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: watch.lisveConvertionList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final element = watch.lisveConvertionList?[index];
                      return Container(
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(20),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.black.withOpacity(0.10),
                        //         // offset: Offset(2, 2),
                        //         blurRadius: 20,
                        //       ),
                        //     ]),
                        padding: EdgeInsets.only(
                            left: 12.w, top: 16.w, bottom: 23.w, right: 12.w),
                        margin: EdgeInsets.only(bottom: 10.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.20),
                                // offset: Offset(2, 2),
                                blurRadius: 20,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                element?.logo == ""
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
                                          imageUrl: "${element?.logo}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                // element?.logo == ""
                                //     ? Image(
                                //         image:
                                //             NetworkImage(" ${element?.logo}"),
                                //         height: 50.h,
                                //         width: 50.w,
                                //       )
                                //     : Container(),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'With:',
                                        style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),

                                        /*defining default style is optional */
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '${element?.conversationName}',
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/time.svg',
                                          alignment: Alignment.topRight,
                                        ),
                                        Container(
                                          width: 200.h,
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Conversation Date:',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  fontStyle: FontStyle.italic,
                                                  color: black,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400),

                                              /*defining default style is optional */
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      '${element?.conversationDate}',
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Colors.black,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 23.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PrimaryButton(
                                  width: 140.w,
                                  height: 30.h,
                                  // borderRadius: BorderRadius.circular(),
                                  borderRadius: 30,
                                  // width: ScreenUtil().screenWidth,
                                  // color: Color(0xff000000),
                                  color: Color(0xff4CDB06),
                                  onTap: () {
                                    print(watch.url);
                                    print("object");
                                    read.goLive(context, element?.roomId);
                                  },
                                  child: Text(
                                    "Go Live ",
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Color(0xff000000),
                                        // letterSpacing: .5,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                // GestureDetector(
                                //   onTap: () async {},
                                //   child: Text(
                                //     "Go Live",
                                //     style: TextStyle(
                                //       fontStyle: FontStyle.italic,
                                //       fontFamily: 'Campton',
                                //       fontSize: 16.sp,
                                //       color: black,
                                //       fontWeight: FontWeight.w500,
                                //     ),
                                //   ),
                                // ),
                                PrimaryButton(
                                  width: 140.w,
                                  height: 30.h,
                                  borderRadius: 30,
                                  color: Color(0xffF55C5C),
                                  onTap: () {
                                    read.cancelledgoLive(
                                        context, element?.roomId);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           LiveConversionView()),
                                    // );
                                  },
                                  child: Text(
                                    "Cancel Request",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.white,
                                        // letterSpacing: .5,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

Widget _circle() {
  return Container(
    height: 100,
    width: 100,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xff4CDB06),
    ),
  );
}
