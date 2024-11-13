import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/main/view/main_screen_view.dart';
import 'package:md_health/Screens/notification/controller/notification_controller.dart';
import 'package:md_health/Screens/order/controller/order_count_controller.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context.read<NotificationCOntroller>().initState(
            context,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<NotificationCOntroller>();
    final watch = context.watch<NotificationCOntroller>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => NewMainScreenView()));

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: CustomAppBar(
          onBackPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NewMainScreenView()));
          },
          hasBackButton: true,
          hasMdTitle: false,
          drawerTitle: "Notification",
        ),
      ),
      content: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 18.w, top: 25.w),
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Campton",
                        letterSpacing: -0.5,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Column(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        // physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: watch.notifications?.length ?? 0,
                        itemBuilder: (BuildContext, index) {
                          final element = watch.notifications?[index];
                          return Container(
                            padding: EdgeInsets.only(
                                left: 18.w,
                                bottom: 21.w,
                                top: 20.w,
                                right: 18.w),
                            margin: EdgeInsets.only(left: 22.w, right: 17.w),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xffDADADA),
                                  width: 1,
                                ),
                              ),
                            ),
                            // padding: ,
                            // height: 165.h,
                            // width: 354.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    //   height: 13.w,
                                    // ),
                                    SvgPicture.asset(
                                      'assets/icons/not_dot.svg',
                                      // width: 23.w,
                                      // height: 28.h,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        element?.notificationDescription ?? '',
                                        // "You have received 5 MDcoins from Ahmet **** for online shopping",
                                        // "New Balaji Trading Company",
                                        style: TextStyle(
                                            color: Colors.black,
                                            // letterSpacing: .5,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    // Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    //   children: [
                                    // Text(
                                    //   "12:12",
                                    //   // "New Balaji Trading Company",
                                    //   style: const TextStyle(
                                    //       color: Colors.black,
                                    //       // letterSpacing: .5,
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w500),
                                    // ),
                                    //   ],
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Text(
                                    element?.createdAt ?? '',
                                    // "New Balaji Trading Company",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        // letterSpacing: .5,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        // child:
                        ),
                    // SizedBox(
                    //   height: 30.w,
                    // )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
