// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:md_health/Screens/message/controller/conversations_list_controller.dart';
// import 'package:md_health/Screens/message/view/message_view.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';

// class ChatPage1 extends StatefulWidget {
//   final String? convertionID;
//   final String? customerId;
//   final String? senderName;
//   final String? hospitalname;
//   final String? logo;

//   const ChatPage1({
//     super.key,
//     required this.convertionID,
//     required this.customerId,
//     required this.senderName,
//     required this.logo,
//     this.hospitalname,
//   });

//   @override
//   State<ChatPage1> createState() => _ChatPage1State();
// }

// String getCurrentTime() {
//   DateTime now = DateTime.now();
//   String formattedTime = DateFormat.Hm().format(now);
//   return formattedTime;
// }

// class _ChatPage1State extends State<ChatPage1> {
//   @override
//   void initState() {
//     print(getCurrentTime());
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<ConversationListController>().initState(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<ConversationListController>();
//     final watch = context.watch<ConversationListController>();
//     return BaseScreen(
//       hasBottomNavBar: false,
//       physics: NeverScrollableScrollPhysics(),
//       hasBouncingScrollPhysics: false,
//       hasScrollView: false,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(150.h),
//         child: CustomAppBar(
//           onBackPressed: () {
//             Navigator.push(
//               context,
//               SlidePageRoute(
//                 page: MessageListView(),
//                 direction: SlideDirection.left,
//                 delay: const Duration(milliseconds: 5000),
//               ),
//             );
//           },
//           drawerTitle: "${widget.senderName}",
//           hasBackButton: true,
//           hasMdTitle: false,
//         ),
//       ),
//       backgroundColor: const Color(0xffF5F5F5),
//       content: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('messages')
//                   .where('conversation_id', isEqualTo: widget.convertionID)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 var messages = snapshot.data!.docs;
//                 List<Widget> messageWidgets = [];

//                 for (var message in messages) {
//                   if (message.exists) {
//                     var data = message.data() as Map<String, dynamic>;
//                     var messageText = data['text'] as String?;
//                     var user_type = data['sender_type'] as String?;
//                     var messageTime = data['current_time'] as String?;
//                     var mediaUrl = data['media_url'] as String?;
//                     var logo = '';
//                     if (messageText != null && user_type != null) {
//                       if (user_type != 'customer') {
//                         var messageWidget = OtherMessageWidget(
//                             messageText, messageTime, mediaUrl);
//                         messageWidgets.insert(0, messageWidget);
//                       } else {
//                         var messageWidget = MessageWidget(
//                           messageText: messageText,
//                           messageTime: messageTime,
//                           mediaUrl: mediaUrl,
//                           logo: widget.logo,
//                         );
//                         messageWidgets.insert(0, messageWidget);
//                       }
//                     }
//                   }
//                 }

//                 return ListView(
//                   shrinkWrap: true,
//                   reverse: false,
//                   children: messageWidgets,
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 10.w),
//           Container(
//             margin: EdgeInsets.only(left: 18.w, right: 18.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     padding: EdgeInsets.only(
//                         left: 10.w, right: 10.w, top: 3.w, bottom: 3.w),
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(30)),
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(
//                           "assets/icons/fluent_live-24-filled.svg",
//                           width: 20.w,
//                           height: 20.h,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           " Send Live Consultation Request",
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.white,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     read.onChooseFile1(); // Pass the function reference without parentheses
//                   },
//                   child: Container(
//                     padding: EdgeInsets.only(
//                         left: 10.w, top: 3.w, bottom: 3.w, right: 10.w),
//                     decoration: BoxDecoration(
//                         color: const Color(0xffD8D8D8),
//                         borderRadius: BorderRadius.circular(20)),
//                     child: SvgPicture.asset(
//                       "assets/icons/fluent_attach-16-filled.svg",
//                       width: 20.w,
//                       height: 20.h,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10.w),
//           if (watch.selectedImagePath != null)
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Row(
//                 children: [
//                   Image.file(
//                     File(watch.selectedImagePath!),
//                     height: 30,
//                     width: 30,
//                     fit: BoxFit.cover,
//                   ),
//                   SizedBox(width: 10.w),
//                   Text("Selected Image"),
//                 ],
//               ),
//             ),
//           Container(
//             padding: EdgeInsets.only(left: 20.w, bottom: 10, right: 20.w),
//             child: PrimarySTextFormFieldChat(
//               controller: watch.messageController,
//               textStyle: TextStyle(color: Colors.black),
//               onChanged: (value) {
//                 // messageText = value;
//               },
//               hintText: "Write message",
//               hintFontSize: 16.sp,
//               suffix: Padding(
//                 padding: EdgeInsets.only(right: 14.w),
//                 child: GestureDetector(
//                     onTap: () {
//                       if (watch.messageController != null) {
//                         // print(downloadUrl);
//                         read.sendMessageApi(context, widget.convertionID,
//                             widget.customerId, watch.fileImage1.path);
//                         print(watch.selectedImagePath);
//                       } else {
//                         Utils.showPrimarySnackbar(context, "Please ",
//                             type: SnackType.error);
//                       }
//                     },
//                     child: SvgPicture.asset("assets/icons/uil_message.svg")),
//               ),
//               enableBorder: false,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MessageWidget extends StatelessWidget {
//   final String? messageText;
//   final String? messageTime;
//   final String? mediaUrl; // Media URL for images
//   final String? logo; // Sender's logo

//   MessageWidget({
//     this.messageText,
//     this.messageTime,
//     this.mediaUrl, // To handle image URLs
//     this.logo,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 47.w, top: 27.w, right: 18.w),
//       padding: EdgeInsets.only(
//         left: 22.w,
//         // top: 19.w,
//         // bottom: 10.w,
//       ),
//       decoration: BoxDecoration(
//         color: const Color(0xffE2E2E2),
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(20.w),
//           topLeft: Radius.circular(20.w),
//           bottomRight: Radius.circular(0.w),
//           bottomLeft: Radius.circular(20.w),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (mediaUrl != null && mediaUrl!.isNotEmpty)
//             Image.network(
//               mediaUrl!,
//               width: 50.w,
//               height: 50.h,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) => Icon(
//                 Icons.broken_image,
//                 size: 50.w,
//                 color: Colors.grey,
//               ),
//             ),
//           if (messageText != null && messageText!.isNotEmpty) ...[
//             SizedBox(height: 10.w), // Optional spacing between image and text
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 if (logo != null && logo!.isNotEmpty) // Check for valid logo
//                   Image.network(
//                     logo!,
//                     fit: BoxFit.fill,
//                     width: 30.w,
//                     height: 30.h,
//                     errorBuilder: (context, error, stackTrace) => Icon(
//                       Icons.account_circle,
//                       size: 30.w,
//                     ),
//                   ),
//                 SizedBox(width: 13.w),
//                 Flexible(
//                   child: Text(
//                     messageText!,
//                     style: const TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//           if (messageTime != null && messageTime!.isNotEmpty) ...[
//             SizedBox(height: 5.w), // Optional spacing
//             Text(
//               messageTime!,
//               style: TextStyle(
//                 fontFamily: 'Campton',
//                 color: Color(0xff908888),
//                 fontSize: 15.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// class OtherMessageWidget extends StatelessWidget {
//   final String? messageText;
//   final String? messageTime;
//   final String? logo;
//   final String? mediaUrl; // Add mediaUrl parameter

//   OtherMessageWidget(this.messageText, this.messageTime, this.logo,
//       {this.mediaUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 10.w, top: 27.w, right: 47.w),
//       padding:
//           EdgeInsets.only(left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 175, 73, 73),
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(20.w),
//           topLeft: Radius.circular(20.w),
//           bottomRight: Radius.circular(20.w),
//           bottomLeft: Radius.circular(0.w),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           if (mediaUrl != null &&
//               mediaUrl!.isNotEmpty) // Check if mediaUrl is provided
//             Image.network(
//               mediaUrl!,
//               width: 100.w, // Set width as needed
//               height: 100.h, // Set height as needed
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) => Icon(
//                 Icons.broken_image,
//                 size: 100.w,
//                 color: Colors.grey,
//               ),
//             ),
//           Row(
//             children: [
//               // if (logo != null && logo!.isNotEmpty) // Display logo if provided
//               //   Image.file(
//               //     File(logo!),
//               //     width: 30.w,
//               //     height: 30.h,
//               //     fit: BoxFit.fill,
//               //     errorBuilder: (context, error, stackTrace) => Icon(
//               //       Icons.account_circle,
//               //       size: 30.w,
//               //     ),
//               //   ),
//               SizedBox(width: 13.w),
//               Flexible(
//                 child: Text(
//                   messageText ?? '',
//                   style: const TextStyle(
//                     fontFamily: 'Campton',
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             messageTime ?? '',
//             style: TextStyle(
//               fontFamily: 'Campton',
//               color: Color(0xff908888),
//               fontSize: 15,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class OtherMessageWidget extends StatelessWidget {
// //   final String? messageText;
// //   final String? messageTime;
// //   final String? logo;

// //   OtherMessageWidget(this.messageText, this.messageTime, this.logo);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(left: 10.w, top: 27.w, right: 47.w),
// //       padding:
// //           EdgeInsets.only(left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
// //       decoration: BoxDecoration(
// //         color: Color.fromARGB(255, 175, 73, 73),
// //         borderRadius: BorderRadius.only(
// //           topRight: Radius.circular(20.w),
// //           topLeft: Radius.circular(20.w),
// //           bottomRight: Radius.circular(20.w),
// //           bottomLeft: Radius.circular(0.w),
// //         ),
// //       ),
// //       child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
// //         Row(
// //           children: [
// //             Image(
// //               image: FileImage(
// //                 File('${logo}'), // Assuming logo is the file path string
// //               ),
// //             ),
// //             SizedBox(
// //               width: 13.w,
// //             ),
// //             Flexible(
// //               child: Text(
// //                 '${messageText}',
// //                 style: const TextStyle(
// //                   fontFamily: 'Campton',
// //                   color: Colors.black,
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w400,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         Text(
// //           '${messageTime}',
// //           style: TextStyle(
// //             fontFamily: 'Campton',
// //             color: Color(0xff908888),
// //             fontSize: 15,
// //             fontWeight: FontWeight.w400,
// //           ),
// //         ),
// //       ]),
// //     );
// //   }
// // }
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/message/controller/conversations_list_controller.dart';
import 'package:md_health/Screens/message/view/message_view.dart';
import 'package:md_health/Screens/message/view/show_dailog.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class ChatPage1 extends StatefulWidget {
  final String? convertionID;
  final String? customerId;
  final String? senderName;
  final String? hospitalname;
  final String? logo;

  const ChatPage1({
    super.key,
    required this.convertionID,
    required this.customerId,
    required this.senderName,
    required this.logo,
    this.hospitalname,
  });

  @override
  State<ChatPage1> createState() => _ChatPage1State();
}

String getCurrentTime() {
  DateTime now = DateTime.now();
  String formattedTime = DateFormat.Hm().format(now);
  return formattedTime;
}

class _ChatPage1State extends State<ChatPage1> {
  @override
  void initState() {
    print(getCurrentTime());
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ConversationListController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConversationListController>();
    final watch = context.watch<ConversationListController>();
    return BaseScreen(
      hasBottomNavBar: false,
      physics: NeverScrollableScrollPhysics(),
      hasBouncingScrollPhysics: false,
      hasScrollView: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: CustomAppBar(
          onBackPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: MessageListView(),
                direction: SlideDirection.left,
                delay: const Duration(milliseconds: 5000),
              ),
            );
          },
          drawerTitle: "${widget.senderName}",
          hasBackButton: true,
          hasMdTitle: false,
        ),
      ),
      backgroundColor: const Color(0xffF5F5F5),
      content: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .where('conversation_id', isEqualTo: widget.convertionID)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var messages = snapshot.data!.docs;
                List<Widget> messageWidgets = [];

                for (var message in messages) {
                  if (message.exists) {
                    var data = message.data() as Map<String, dynamic>;
                    var messageText = data['text'] as String?;
                    var user_type = data['sender_type'] as String?;
                    var messageTime = data['current_time'] as String?;
                    var mediaUrl = data['media_url'] as String?;
                    var logo = '';
                    if (messageText != null && user_type != null) {
                      if (user_type != 'customer') {
                        var messageWidget = OtherMessageWidget(
                            messageText, messageTime,
                            mediaUrl: mediaUrl);
                        messageWidgets.insert(0, messageWidget);
                      } else {
                        var messageWidget = MessageWidget(
                          messageText: messageText,
                          messageTime: messageTime,
                          mediaUrl: mediaUrl,
                          logo: widget.logo,
                        );
                        messageWidgets.insert(0, messageWidget);
                      }
                    }
                  }
                }

                return ListView(
                  shrinkWrap: true,
                  reverse: false,
                  children: messageWidgets,
                );
              },
            ),
          ),
          SizedBox(height: 10.w),
          Container(
            margin: EdgeInsets.only(left: 18.w, right: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.convertionID;

                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),

                              // insetPadding:
                              //    EdgeInsets.all(0),
                              contentPadding: const EdgeInsets.only(top: 0.0),

                              content: Container(
                                // padding: EdgeInsets.only(right: 20.w),
                                width: ScreenUtil().screenWidth,
                                height: 400.h,
                                // padding:
                                //     EdgeInsets.only(bottom: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            right: 20.w, top: 16.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/Close-Square black.svg"),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Make a Live Conversation Appoinment",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // letterSpacing: .5,
                                          fontSize: 23.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Fill the form & get your live conversation appoinment",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // letterSpacing: .5,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0.w, top: 33.w, right: 20.w),
                                      child: SDropDownField(
                                        titleHeader: "Conversation Objct",
                                        titleSize: 16.sp,
                                        onChanged: (value) {
                                          read.onSelectObject(value);
                                          print("watch.selectedObject");

                                          print(watch.selectedObject);
                                          print("watch.selectedObject");

                                          // read.onSelectAccountType(value);
                                        },
                                        hint: "Choose",
                                        value: watch.selectedObject,
                                        items: [
                                          DropdownMenuItem(
                                            value: "About Treatments",
                                            child: Text(
                                              "About Treatments",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: "Other",
                                            child: Text(
                                              "Other",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: "",
                                            child: Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0.w, right: 20.w),
                                      child: SDropDownField(
                                        titleHeader: "Available Time",
                                        titleSize: 16.sp,
                                        onChanged: (value) {
                                          read.onSelectDate(value);

                                          // read.onSelectAccountType(value);
                                        },
                                        hint: "Choose",
                                        value: read.selectedDate,
                                        items: [
                                          DropdownMenuItem(
                                            value: "Today",
                                            child: Text(
                                              "Today",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: "Tommorow",
                                            child: Text(
                                              "Tommorow",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: "After Tommorow",
                                            child: Text(
                                              "Day After Tommorow",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    PrimaryButton(
                                      // borderColor: Colors.black,
                                      width: 250.w,
                                      height: 45.w,

                                      borderRadius: 30,

                                      color: const Color(0xff4CDB06),
                                      // color: kDefaultActiveColor,
                                      onTap: () {
                                        Navigator.pop(context);
                                        watch.timeSelecting(context, widget.convertionID, watch.selectedDate, watch.selectedObject);
                                        print(watch.selectedDate);
                                        print('--------');
                                        print(watch.selectedObject);
                                        watch.selectedDate;
                                        watch.selectedObject;
                                        widget.convertionID;
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter setState) {
                                                return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15.0))),

                                                    // insetPadding:
                                                    //    EdgeInsets.all(0),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 0.0),
                                                    content: ShowMyDailog(
                                                      convertionId:
                                                          widget.convertionID,
                                                      selectedObject:
                                                          watch.selectedObject,
                                                      selectedDate:
                                                          watch.selectedDate,
                                                    ));
                                              });
                                            });
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => SignUpView()),
                                        // );
                                      },
                                      child: Text(
                                        "Step 2: Date",
                                        style: TextStyle(
                                            color: Colors.black,
                                            // letterSpacing: .5,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     SeconderyCheckBox(
                                    //       // value: watch.isVerifyChecked,
                                    //       onChanged: (value) {
                                    //         // read.onVerifyChecked(value);
                                    //       },
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 3.w, bottom: 3.w),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/fluent_live-24-filled.svg",
                          width: 20.w,
                          height: 20.h,
                          color: Colors.white,
                        ),
                        Text(
                          " Send Live Consultation Request",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    read.onChooseFile1(); // Pass the function reference without parentheses
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10.w, top: 3.w, bottom: 3.w, right: 10.w),
                    decoration: BoxDecoration(
                        color: const Color(0xffD8D8D8),
                        borderRadius: BorderRadius.circular(20)),
                    child: SvgPicture.asset(
                      "assets/icons/fluent_attach-16-filled.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.w),
          // Display selected image
          if (watch.selectedImagePath != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Image.file(
                    File(watch.selectedImagePath!),
                    height: 30, // Adjust size as needed
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10.w),
                  Text("Selected Image"),
                ],
              ),
            ),

          Container(
            padding: EdgeInsets.only(left: 20.w, bottom: 10, right: 20.w),
            child: PrimarySTextFormFieldChat(
              controller: watch.messageController,
              textStyle: TextStyle(color: Colors.black),
              onChanged: (value) {
                // messageText = value;
              },
              hintText: "Write message",
              hintFontSize: 16.sp,
              suffix: Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: GestureDetector(
                    onTap: () {
                      if (watch.messageController != null) {
                        // print(downloadUrl);
                        read.sendMessageApi(context, widget.convertionID,
                            widget.customerId, watch.fileImage1.path);
                        print(watch.selectedImagePath);
                      } else {
                        Utils.showPrimarySnackbar(context, "Please ",
                            type: SnackType.error);
                      }
                    },
                    child: SvgPicture.asset("assets/icons/uil_message.svg")),
              ),
              enableBorder: false,
            ),
          ),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String? messageText;
  final String? messageTime;
  final String? mediaUrl; // Media URL for images
  final String? logo; // Sender's logo

  MessageWidget({
    this.messageText,
    this.messageTime,
    this.mediaUrl, // To handle image URLs
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 47.w, top: 27.w, right: 18.w),
      padding: EdgeInsets.only(
        left: 22.w,
      ),
      decoration: BoxDecoration(
        color: Color(0xffE2E2E2),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.w),
          topLeft: Radius.circular(20.w),
          bottomRight: Radius.circular(0.w),
          bottomLeft: Radius.circular(20.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 10.w,
          ),
          Row(
            children: [
              if (logo != null && logo!.isNotEmpty) // Check for valid logo
                Image.network(
                  logo!,
                  fit: BoxFit.fill,
                  width: 50.w,
                  height: 50.h,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.account_circle,
                    size: 30.w,
                  ),
                ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (messageText != null && messageText!.isNotEmpty)
                    Text(
                      messageText!,
                      style: const TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  SizedBox(
                    height: 10.w,
                  ),
                  if (mediaUrl != null && mediaUrl!.isNotEmpty)
                    Image.network(
                      mediaUrl!,
                      fit: BoxFit.fill,
                      width: 100.w,
                      height: 50.h,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.broken_image,
                        size: 50.w,
                        color: Colors.grey,
                      ),
                    ),
                ],
              )
            ],
          ),
          if (messageTime != null && messageTime!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 5.w, bottom: 5.w, right: 10.w),
              child: Text(
                messageTime!,
                style: TextStyle(
                  fontFamily: 'Campton',
                  color: Color(0xff908888),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
// if (mediaUrl != null && mediaUrl!.isNotEmpty)
//               Image.network(
//                 mediaUrl!,
//                 width: 50.w,
//                 height: 50.h,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) => Icon(
//                   Icons.broken_image,
//                   size: 50.w,
//                   color: Colors.grey,
//                 ),
//               ),

//             // Optional message time displayed below the image
// if (messageTime != null && messageTime!.isNotEmpty)
//   Padding(
//     padding: EdgeInsets.only(top: 5.w),
//     child: Text(
//       messageTime!,
//       style: TextStyle(
//         fontFamily: 'Campton',
//         color: Color(0xff908888),
//         fontSize: 15.sp,
//         fontWeight: FontWeight.w400,
//       ),
//     ),
//   ),
// Row containing logo and messageText
// Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
// if (logo != null && logo!.isNotEmpty) // Check for valid logo
//   Image.network(
//     logo!,
//     fit: BoxFit.fill,
//     width: 30.w,
//     height: 30.h,
//     errorBuilder: (context, error, stackTrace) => Icon(
//       Icons.account_circle,
//       size: 30.w,
//     ),
//   ),
//     SizedBox(width: 13.w),
// if (messageText != null && messageText!.isNotEmpty)
//   Flexible(
//     child: Text(
//       messageText!,
//       style: const TextStyle(
//         fontFamily: 'Campton',
//         color: Colors.black,
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//       ),
//     ),
//   ),
//   ],
// ),
// SizedBox(height: 10.w),
class OtherMessageWidget extends StatelessWidget {
  final String? messageText;
  final String? messageTime;
  final String? mediaUrl;

  OtherMessageWidget(this.messageText, this.messageTime, {this.mediaUrl});

  // Helper function to construct the correct media URL
  String formatMediaUrl(String? mediaUrl) {
    if (mediaUrl == null || mediaUrl.isEmpty) {
      return '';
    }
    String baseUrl = 'https://mdhealth.m-staging.in/storage';
    // Remove 'public' and prepend the base URL
    String formattedUrl = mediaUrl.replaceFirst('public/', '');
    return '$baseUrl/$formattedUrl';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 27.w, right: 47.w),
      padding:
          EdgeInsets.only(left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 182, 236, 207),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.w),
          topLeft: Radius.circular(20.w),
          bottomRight: Radius.circular(20.w),
          bottomLeft: Radius.circular(0.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mediaUrl != null &&
                  mediaUrl!.isNotEmpty) // Check if mediaUrl is provided
                Image.network(
                  formatMediaUrl(mediaUrl),
                  fit: BoxFit.fill,
                  width: 100.w,
                  height: 50.h,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.broken_image,
                    size: 30.w,
                    color: Colors.grey,
                  ),
                ),
              SizedBox(width: 13.w),
              Column(
                children: [
                  SizedBox(height: 13.w),
                  Text(
                    messageText ?? '',
                    style: const TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            messageTime ?? '',
            style: TextStyle(
              fontFamily: 'Campton',
              color: Color(0xff908888),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// class OtherMessageWidget extends StatelessWidget {
//   final String? messageText;
//   final String? messageTime;
//   final String? logo;

//   OtherMessageWidget(this.messageText, this.messageTime, this.logo);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 10.w, top: 27.w, right: 47.w),
//       padding:
//           EdgeInsets.only(left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 175, 73, 73),
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(20.w),
//           topLeft: Radius.circular(20.w),
//           bottomRight: Radius.circular(20.w),
//           bottomLeft: Radius.circular(0.w),
//         ),
//       ),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//         Row(
//           children: [
//             Image(
//               image: FileImage(
//                 File('${logo}'), // Assuming logo is the file path string
//               ),
//             ),
//             SizedBox(
//               width: 13.w,
//             ),
//             Flexible(
//               child: Text(
//                 '${messageText}',
//                 style: const TextStyle(
//                   fontFamily: 'Campton',
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Text(
//           '${messageTime}',
//           style: TextStyle(
//             fontFamily: 'Campton',
//             color: Color(0xff908888),
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ]),
//     );
//   }
// }
