import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/message/controller/conversations_list_controller.dart';
import 'package:md_health/Screens/message/view/chat_screen.dart';
import 'package:md_health/Screens/message/view/live_conversion_view.dart';
import 'package:md_health/Screens/message/view/new_message_view.dart';
import 'package:md_health/Screens/message/view/video_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/circle.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';

class MessageListView extends StatefulWidget {
  const MessageListView({super.key});

  @override
  State<MessageListView> createState() => _MessageListViewState();
}

class _MessageListViewState extends State<MessageListView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ConversationListController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConversationListController>();
    final watch = context.watch<ConversationListController>();

    return BaseScreen(
        onWillPop: () async {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MessageListView()),
          // );

          return true; // pressing back won't work
        },
        backgroundColor: Color(0xffF5F5F5),
        appBar: CustomAppBar(
          // hasBackButton: true,
          hasMdTitle: false,
          drawerTitle: 'Messages',
        ),
        content: watch.isLoading
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200.h),
                  Loader(),
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 27.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PrimaryButton(
                        width: 165.w,
                        height: 45.h,
                        // borderRadius: BorderRadius.circular(),
                        borderRadius: 30,
                        // width: ScreenUtil().screenWidth,
                        color: Color(0xff000000),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewmassageView()),
                          );
                        },
                        child: Text(
                          "New Messages",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Color(0xff4CDB06),
                              // letterSpacing: .5,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      PrimaryButton(
                        width: 165.w,
                        height: 45.h,
                        borderRadius: 30,
                        color: Color(0xffF55C5C),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LiveConversionView()),
                          );
                        },
                        child: Text(
                          "Live Consultation \n Appointments",
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
                  Container(
                    margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 27.w),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: watch.conversations?.length ?? 0,
                      itemBuilder: (context, index) {
                        final element = watch.conversations?[index];
                        return GestureDetector(
                          onTap: () {
                            print(element?.writtenBy);
                            print(element?.logo);
                            print(element?.userId);
                            print(element?.converstionId);
                            // return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage1(
                                        senderName: element?.writtenBy,
                                        logo: element?.logo,
                                        customerId: element?.userId,
                                        convertionID: element?.converstionId,
                                      )),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 15.w),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 16.w, top: 10.w, bottom: 15.w),
                                  margin: EdgeInsets.only(bottom: 7.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              element?.isLatestMessage == "yes"
                                                  ? kDefaultActiveColor
                                                  : Colors.black26),
                                      // color: element?.isLatestMessage??false?kDefaultActiveColor:Colors.black26),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppNetworkImages(
                                        imageUrl: "${element?.logo}",
                                        fit: BoxFit.cover,
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                      SizedBox(
                                        width: 13.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: 'Written: ',
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: black,
                                                    letterSpacing: -1,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w500),

                                                /*defining default style is optional */
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        //  "",
                                                        ' ( ${element?.providerName ?? ''} )',
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        letterSpacing: -1,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // element?.latestMessage == false
                                            //     ?
                                            Container(
                                              padding: EdgeInsets.only(
                                                  right: 5.w, top: 5.h),
                                              child: Text(
                                                ' ${element?.writtenBy ?? ''} ${element?.orderId ?? ''}',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Campton',
                                                    // letterSpacing: .5,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            // : Container(),
                                            RichText(
                                              text: TextSpan(
                                                text: 'Treatment ID : ',
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: black,
                                                    letterSpacing: -1,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w500),

                                                /*defining default style is optional */
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        //  "",
                                                        '${element?.packageUniqueNo ?? ''}',
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: black,
                                                        letterSpacing: -1,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              element?.isLatestMessage != "yes"
                                  ? Container()
                                  : Positioned(
                                      top: 7, right: 15, child: _circle()),
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

Widget _circle() {
  return Container(
    height: 20,
    width: 20,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xff4CDB06),
    ),
  );
}
