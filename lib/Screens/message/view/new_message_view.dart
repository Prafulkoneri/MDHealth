import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/message/view/chat_screen.dart';
import 'package:md_health/Screens/message/view/message_view.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';

class NewmassageView extends StatefulWidget {
  const NewmassageView({super.key});

  @override
  State<NewmassageView> createState() => _NewmassageViewState();
}

class _NewmassageViewState extends State<NewmassageView> {
  @override
  Widget build(BuildContext context) {
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
          preferredSize: Size.fromHeight(130.h),
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
        content: Column(
          children: [
            SizedBox(
              height: 38.h,
            ),
            Text(
              "Users you can send messages to",
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Color(0xff212121),
                  // letterSpacing: .5,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 18.w, top: 33.w, right: 18.w),
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.w, horizontal: 16.w),
                    margin: EdgeInsets.only(bottom: 20.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            // offset: Offset(2, 2),
                            blurRadius: 20,
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image:
                                  AssetImage("assets/images/Rectangle 707.png"),
                              height: 35.h,
                              width: 35.w,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Acıbadem Hospital",
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  // letterSpacing: .5,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          "assets/icons/uil_message.svg",
                          height: 20.h,
                          width: 20.w,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
