// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/Screens/message/view/show_dailog.dart';
// // import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:md_health/widget/drop_down.dart';
// // import 'package:md_health/widget/text_field.dart';
// // import 'package:provider/provider.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class ChatScreenDemo extends StatefulWidget {
// //   const ChatScreenDemo({super.key});

// //   @override
// //   State<ChatScreenDemo> createState() => _ChatScreenDemoState();
// // }

// // class _ChatScreenDemoState extends State<ChatScreenDemo> {
// //   String? messageText;
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// //   // void messagesStream() async{
// //   //     await for (var snapshot in   _firestore.collection('messages').snapshots()){
// //   //      for(var message in snapshot.docs){
// //   //         print(message.data);
// //   //    }
// //   // }
// //   // }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(150.h),
// //         child: CustomAppBar(
// //           drawerTitle: "Acıbadem Hospital",
// //           hasBackButton: true,
// //           hasMdTitle: false,
// //         ),
// //       ),
// //       body: SafeArea(
// //         child: StreamBuilder(
// //             stream:
// //                 FirebaseFirestore.instance.collection('messages').snapshots(),
// //             builder: (context, snapshot) {
// //               if (!snapshot.hasData) {
// //                 return const Center(
// //                   child: CircularProgressIndicator(),
// //                 );
// //               }
// //               var messages = snapshot.data!.docs;
// //               List<Widget> messageWidgets = [];
// //               for (var message in messages) {
// //                 var messageText = message[
// //                     'text']; // Assuming 'text' is the field in Firestore

// //                 var messageWidget = MessageWidget(messageText);
// //                 messageWidgets.add(messageWidget);
// //               }
// //               return ListView(
// //                 children: messageWidgets,
// //               );
// //             }),
// //         // ElevatedButton(onPressed: (){
// //         //   messagesStream();
// //         // },
// //         //  child: Text('data')),
// //         // Container(
// //         //   height: 100,
// //         //   color: Colors.redAccent,
// //         //   child: Row(
// //         //     crossAxisAlignment: CrossAxisAlignment.center,
// //         //     children: [
// //         //         Expanded(child: TextField(
// //         //           onChanged: (value){
// //         //             messageText = value;
// //         //           },
// //         //         )),
// //         //         ElevatedButton(
// //         //           onPressed: (){
// //         //             _firestore.collection('messages').add({
// //         //               'text': messageText,
// //         //             });
// //         //           },
// //         //           child: const Text('send')
// //         //           )
// //         //     ],
// //         //   ),
// //         // )
// //         //   ],
// //         // )
// //       ),
// //     );
// //   }
// // }

// // class MessageWidget extends StatelessWidget {
// //   final String messageText;

// //   MessageWidget(this.messageText);

// //   @override
// //   Widget build(BuildContext context) {
// //     // return ListTile(
// //     //   title: Text(messageText,
// //     //   style: const TextStyle(
// //     //     color: Colors.amber
// //     //   ),
// //     //   ),
// //     // );
// //     return Container(
// //       margin: EdgeInsets.only(left: 47.w, top: 27.w, right: 18.w),
// //       padding:
// //           EdgeInsets.only(left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
// //       decoration: BoxDecoration(
// //         color: Colors.red,
// //         // color: const Color(0xffE2E2E2),
// //         borderRadius: BorderRadius.only(
// //           topRight: Radius.circular(20.w),
// //           topLeft: Radius.circular(
// //               20.w), // Set the top-right corner to be non-circular
// //           bottomRight: Radius.circular(
// //               0.w), // Set the bottom-left corner to be non-circular
// //           bottomLeft: Radius.circular(20.w),
// //         ),
// //       ),
// //       child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
// //         Row(
// //           children: [
// //             Image(
// //               image: const AssetImage("assets/images/Rectangle 707.png"),
// //               width: 50.w,
// //               height: 50.h,
// //             ),
// //             SizedBox(
// //               width: 13.w,
// //             ),
// //             Flexible(
// //               child: Text(
// //                 '${messageText}',
// //                 // " ak Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
// //                 style: TextStyle(
// //                   fontFamily: 'Campton',
// //                   color: Colors.black,
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w400,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         const Text(
// //           "11:40",
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
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/constants/styles/colors.dart';
// // import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:md_health/widget/drop_down.dart';
// // import 'package:md_health/widget/text_field.dart';

// // class ChatPage extends StatefulWidget {
// //   ChatPage({
// //     super.key,
// //   });

// //   @override
// //   State<ChatPage> createState() => _ChatPageState();
// // }

// // class _ChatPageState extends State<ChatPage> {

// //   @override
// //   Widget build(BuildContext context) =>

// //  Scaffold(
// //       // hasBottomNavBar: false,
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(150.h),
// //         child: CustomAppBar(
// //           drawerTitle: "Acıbadem Hospital",
// //           hasBackButton: true,
// //           hasMdTitle: false,
// //         ),
// //       ),
// //       backgroundColor: Color(0xffF5F5F5),
// //       body: Column(children: [
// //         Expanded(
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 SizedBox(
// //                   height: 21.h,
// //                 ),
// //                 Text(
// //                   "Today",
// //                   style: TextStyle(
// //                     fontFamily: 'Campton',
// //                     color: Color(0xff908888),
// //                     fontSize: 15,
// //                     fontWeight: FontWeight.w400,
// //                   ),
// //                 ),
// //                 Container(
// //                   margin: EdgeInsets.only(left: 47.w, top: 27.w, right: 18.w),
// //                   padding: EdgeInsets.only(
// //                       left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xffE2E2E2),
// //                     borderRadius: BorderRadius.only(
// //                       topRight: Radius.circular(20.w),
// //                       topLeft: Radius.circular(20
// //                           .w), // Set the top-right corner to be non-circular
// //                       bottomRight: Radius.circular(0
// //                           .w), // Set the bottom-left corner to be non-circular
// //                       bottomLeft: Radius.circular(20.w),
// //                     ),
// //                   ),
// //                   child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.end,
// //                       children: [
// //                         Row(
// //                           children: [
// //                             Image(
// //                               image: const AssetImage(
// //                                   "assets/images/Rectangle 707.png"),
// //                               width: 50.w,
// //                               height: 50.h,
// //                             ),
// //                             SizedBox(
// //                               width: 13.w,
// //                             ),
// //                             const Flexible(
// //                               child: Text(
// //                                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
// //                                 style: TextStyle(
// //                                   fontFamily: 'Campton',
// //                                   color: Colors.black,
// //                                   fontSize: 14,
// //                                   fontWeight: FontWeight.w400,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const Text(
// //                           "11:40",
// //                           style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: Color(0xff908888),
// //                             fontSize: 15,
// //                             fontWeight: FontWeight.w400,
// //                           ),
// //                         ),
// //                       ]),
// //                 ),
// //                 Container(
// //                   margin: EdgeInsets.only(left: 18.w, top: 27.w, right: 68.w),
// //                   padding: EdgeInsets.only(
// //                       left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xffFBFBFB),
// //                     borderRadius: BorderRadius.only(
// //                       topRight: Radius.circular(20.w),
// //                       topLeft: Radius.circular(20
// //                           .w), // Set the top-right corner to be non-circular
// //                       bottomLeft: Radius.circular(0
// //                           .w), // Set the bottom-left corner to be non-circular
// //                       bottomRight: Radius.circular(20.w),
// //                     ),
// //                   ),
// //                   child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.end,
// //                       children: [
// //                         Row(
// //                           children: [
// //                             Image(
// //                               image: const AssetImage(
// //                                   "assets/images/Rectangle 707.png"),
// //                               width: 50.w,
// //                               height: 50.h,
// //                             ),
// //                             SizedBox(
// //                               width: 13.w,
// //                             ),
// //                             const Flexible(
// //                               child: Text(
// //                                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
// //                                 style: TextStyle(
// //                                   fontFamily: 'Campton',
// //                                   color: Colors.black,
// //                                   fontSize: 14,
// //                                   fontWeight: FontWeight.w400,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const Text(
// //                           "11:40",
// //                           style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: Color(0xff908888),
// //                             fontSize: 15,
// //                             fontWeight: FontWeight.w400,
// //                           ),
// //                         ),
// //                       ]),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),

// //         // watch.ticketDetails?.ticketStatus!="Closed"?
// //         Container(
// //           margin: EdgeInsets.only(left: 18.w, right: 18.w),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   showDialog(
// //                       context: context,
// //                       builder: (BuildContext context) => AlertDialog(
// //                             shape: RoundedRectangleBorder(
// //                                 borderRadius:
// //                                     BorderRadius.all(Radius.circular(15.0))),

// //                             // insetPadding:
// //                             //    EdgeInsets.all(0),
// //                             contentPadding: EdgeInsets.only(top: 0.0),

// //                             content: Container(
// //                               // padding: EdgeInsets.only(right: 20.w),
// //                               width: ScreenUtil().screenWidth,
// //                               height: 400.h,
// //                               // padding:
// //                               //     EdgeInsets.only(bottom: 10.w),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.center,
// //                                 children: [
// //                                   Container(
// //                                     padding: EdgeInsets.only(
// //                                         right: 20.w, top: 16.w),
// //                                     child: Row(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.end,
// //                                       children: [
// //                                         SvgPicture.asset(
// //                                             "assets/icons/Close-Square black.svg"),
// //                                       ],
// //                                     ),
// //                                   ),

// //                                   SizedBox(
// //                                     height: 5.h,
// //                                   ),
// //                                   Text(
// //                                     "Make a Live Conversation Appoinment",
// //                                     textAlign: TextAlign.center,
// //                                     style: TextStyle(
// //                                         color: Colors.black,
// //                                         // letterSpacing: .5,
// //                                         fontSize: 23.sp,
// //                                         fontWeight: FontWeight.w700),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 10.h,
// //                                   ),
// //                                   Text(
// //                                     "Fill the form & get your live conversation appoinment",
// //                                     textAlign: TextAlign.center,
// //                                     style: TextStyle(
// //                                         color: Colors.black,
// //                                         // letterSpacing: .5,
// //                                         fontSize: 16.sp,
// //                                         fontWeight: FontWeight.w400),
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.only(
// //                                         left: 20.0.w, top: 33.w, right: 20.w),
// //                                     child: SDropDownField(
// //                                       titleHeader: "Conversation Objct",
// //                                       titleSize: 16.sp,
// //                                       onChanged: (value) {
// //                                         // read.onSelectAccountType(value);
// //                                       },
// //                                       hint: "Choose",
// //                                       items: [
// //                                         DropdownMenuItem(
// //                                           value: "current",
// //                                           child: Text(
// //                                             "Current",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "saving",
// //                                           child: Text(
// //                                             "Saving",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20.h,
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.only(
// //                                         left: 20.0.w, right: 20.w),
// //                                     child: SDropDownField(
// //                                       titleHeader: "Available Time",
// //                                       onChanged: (value) {
// //                                         // read.onSelectAccountType(value);
// //                                       },
// //                                       hint: "Choose",
// //                                       items: [
// //                                         DropdownMenuItem(
// //                                           value: "current",
// //                                           child: Text(
// //                                             "Current",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "saving",
// //                                           child: Text(
// //                                             "Saving",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),

// //                                   SizedBox(
// //                                     height: 30.h,
// //                                   ),
// //                                   PrimaryButton(
// //                                     // borderColor: Colors.black,
// //                                     width: 250.w,
// //                                     height: 45.w,

// //                                     borderRadius: 30,

// //                                     color: Color(0xff4CDB06),
// //                                     // color: kDefaultActiveColor,
// //                                     onTap: () {
// //                                       // Navigator.pop(context);
// //                                       showDialog(
// //                                           context: context,
// //                                           builder:
// //                                               (BuildContext context) =>
// //                                                   AlertDialog(
// //                                                     shape: RoundedRectangleBorder(
// //                                                         borderRadius:
// //                                                             BorderRadius.all(
// //                                                                 Radius.circular(
// //                                                                     15.0))),

// //                                                     // insetPadding:
// //                                                     //    EdgeInsets.all(0),
// //                                                     contentPadding:
// //                                                         EdgeInsets.only(
// //                                                             top: 0.0),

// //                                                     content: Container(
// //                                                       // padding: EdgeInsets.only(right: 20.w),
// //                                                       width: ScreenUtil()
// //                                                           .screenWidth,
// //                                                       height: 350.h,
// //                                                       // padding:
// //                                                       //     EdgeInsets.only(bottom: 10.w),
// //                                                       child: Column(
// //                                                         crossAxisAlignment:
// //                                                             CrossAxisAlignment
// //                                                                 .center,
// //                                                         children: [
// //                                                           Container(
// //                                                             padding: EdgeInsets
// //                                                                 .only(
// //                                                                     right:
// //                                                                         20.w,
// //                                                                     top:
// //                                                                         16.w),
// //                                                             child: Row(
// //                                                               mainAxisAlignment:
// //                                                                   MainAxisAlignment
// //                                                                       .end,
// //                                                               children: [
// //                                                                 SvgPicture.asset(
// //                                                                     "assets/icons/Close-Square black.svg"),
// //                                                               ],
// //                                                             ),
// //                                                           ),

// //                                                           SizedBox(
// //                                                             height: 5.h,
// //                                                           ),
// //                                                           Text(
// //                                                             "Make a Live Conversation Appoinment",
// //                                                             textAlign:
// //                                                                 TextAlign
// //                                                                     .center,
// //                                                             style: TextStyle(
// //                                                                 color: Colors
// //                                                                     .black,
// //                                                                 // letterSpacing: .5,
// //                                                                 fontSize:
// //                                                                     23.sp,
// //                                                                 fontWeight:
// //                                                                     FontWeight
// //                                                                         .w700),
// //                                                           ),
// //                                                           SizedBox(
// //                                                             height: 10.h,
// //                                                           ),
// //                                                           Text(
// //                                                             "Fill the form & get your live conversation appoinment",
// //                                                             textAlign:
// //                                                                 TextAlign
// //                                                                     .center,
// //                                                             style: TextStyle(
// //                                                                 color: Colors
// //                                                                     .black,
// //                                                                 // letterSpacing: .5,
// //                                                                 fontSize:
// //                                                                     16.sp,
// //                                                                 fontWeight:
// //                                                                     FontWeight
// //                                                                         .w400),
// //                                                           ),
// //                                                           SizedBox(
// //                                                             height: 30.h,
// //                                                           ),
// //                                                           Column(
// //                                                             children: [
// //                                                               Row(
// //                                                                 mainAxisAlignment:
// //                                                                     MainAxisAlignment
// //                                                                         .spaceEvenly,
// //                                                                 children: [
// //                                                                   GestureDetector(
// //                                                                     onTap: () {
// //                                                                       void onChecked() {
// //   isChecked = !isChecked;
// //   notifyListeners();
// // }
// //                                                                     },
// //                                                                     child: Container(
// //                                                                       padding: EdgeInsets
// //                                                                           .all(10
// //                                                                               .w),
// //                                                                       decoration: BoxDecoration(
// //                                                                           border: Border.all(
// //                                                                               width: 1,
// //                                                                               color: Color(0xff989898)),
// //                                                                           borderRadius: BorderRadius.circular(50)),
// //                                                                       child:
// //                                                                           Text(
// //                                                                         "10:00",
// //                                                                         textAlign:
// //                                                                             TextAlign.center,
// //                                                                         style: TextStyle(
// //                                                                             color: Colors.black,
// //                                                                             // letterSpacing: .5,
// //                                                                             fontSize: 16.sp,
// //                                                                             fontWeight: FontWeight.w400),
// //                                                                       ),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "11:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "12:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                               SizedBox(
// //                                                                 height: 10.h,
// //                                                               ),
// //                                                               Row(
// //                                                                 mainAxisAlignment:
// //                                                                     MainAxisAlignment
// //                                                                         .spaceEvenly,
// //                                                                 children: [
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                             ],
// //                                                           ),
// //                                                           SizedBox(
// //                                                             height: 39.h,
// //                                                           ),
// //                                                           PrimaryButton(
// //                                                             // borderColor: Colors.black,
// //                                                             width: 250.w,
// //                                                             height: 45.w,

// //                                                             borderRadius: 30,

// //                                                             color: Color(
// //                                                                 0xff4CDB06),
// //                                                             // color: kDefaultActiveColor,
// //                                                             onTap: () {
// //                                                               Navigator.pop(
// //                                                                   context);

// //                                                               // Navigator.push(
// //                                                               //   context,
// //                                                               //   MaterialPageRoute(builder: (context) => SignUpView()),
// //                                                               // );
// //                                                             },
// //                                                             child: Text(
// //                                                               "Submit",
// //                                                               style: TextStyle(
// //                                                                   color: Colors.black,
// //                                                                   // letterSpacing: .5,
// //                                                                   fontSize: 16.sp,
// //                                                                   fontWeight: FontWeight.w600),
// //                                                             ),
// //                                                           ),
// //                                                           // Row(
// //                                                           //   children: [
// //                                                           //     SeconderyCheckBox(
// //                                                           //       // value: watch.isVerifyChecked,
// //                                                           //       onChanged: (value) {
// //                                                           //         // read.onVerifyChecked(value);
// //                                                           //       },
// //                                                           //     ),
// //                                                           //   ],
// //                                                           // ),
// //                                                         ],
// //                                                       ),
// //                                                     ),
// //                                                   ));
// //                                       // Navigator.push(
// //                                       //   context,
// //                                       //   MaterialPageRoute(builder: (context) => SignUpView()),
// //                                       // );
// //                                     },
// //                                     child: Text(
// //                                       "Step 2: Date",
// //                                       style: TextStyle(
// //                                           color: Colors.black,
// //                                           // letterSpacing: .5,
// //                                           fontSize: 16.sp,
// //                                           fontWeight: FontWeight.w600),
// //                                     ),
// //                                   ),
// //                                   // Row(
// //                                   //   children: [
// //                                   //     SeconderyCheckBox(
// //                                   //       // value: watch.isVerifyChecked,
// //                                   //       onChanged: (value) {
// //                                   //         // read.onVerifyChecked(value);
// //                                   //       },
// //                                   //     ),
// //                                   //   ],
// //                                   // ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ));
// //                 },
// //                 child: Container(
// //                   padding: EdgeInsets.only(
// //                       left: 10.w, right: 10.w, top: 3.w, bottom: 3.w),
// //                   decoration: BoxDecoration(
// //                       color: Colors.red,
// //                       borderRadius: BorderRadius.circular(30)),
// //                   child: Row(
// //                     children: [
// //                       SvgPicture.asset(
// //                         "assets/icons/fluent_live-24-filled.svg",
// //                         width: 20.w,
// //                         height: 20.h,
// //                         color: Colors.white,
// //                       ),
// //                       Text(
// //                         "Live Conversation Appointments",
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: Colors.white,
// //                             // letterSpacing: .5,
// //                             fontSize: 15.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 padding: EdgeInsets.only(
// //                     left: 10.w, top: 3.w, bottom: 3.w, right: 10.w),
// //                 decoration: BoxDecoration(
// //                     color: Color(0xffD8D8D8),
// //                     borderRadius: BorderRadius.circular(20)),
// //                 child: SvgPicture.asset(
// //                   "assets/icons/fluent_attach-16-filled.svg",
// //                   width: 20.w,
// //                   height: 20.h,
// //                   // color: Colors.red,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         SizedBox(
// //           height: 10.h,
// //         ),
// //         Container(
// //           padding: EdgeInsets.only(left: 20.w, bottom: 10, right: 20.w),
// //           child: PrimarySTextFormFieldChat(
// //             color: black,
// //             // controller: watch.remarkController,
// //             // height: 65.h,
// //             // maxLines: 5,
// //             hintText: "Please text a message..",

// //             hintFontSize: 13,

// //             suffix: Padding(
// //               padding: EdgeInsets.only(right: 14.w),
// //               child: GestureDetector(
// //                   onTap: () {
// //                     // read.ticketReply(context);
// //                   },
// //                   child: SvgPicture.asset("assets/icons/uil_message.svg")),
// //             ),
// //             enableBorder: false,
// //           ),
// //         ),
// //       ]),
// //     );
// // }
// ////////////////////////////////////////////////////////////////NEW//////////////////////////////////////
// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';
// // import 'package:md_health/Screens/message/controller/conversations_list_controller.dart';
// // import 'package:md_health/Screens/message/view/show_dailog.dart';
// // import 'package:md_health/constants/styles/colors.dart';
// // import 'package:md_health/widget/base_screen.dart';
// // import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:md_health/widget/drop_down.dart';
// // import 'package:md_health/widget/text_field.dart';
// // import 'package:provider/provider.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class ChatPage extends StatefulWidget {
// //   final String? convertionID;
// //   final String? customerId;
// //   final String? senderName;
// //   final String? logo;
// //   const ChatPage(
// //       {super.key,
// //       required this.convertionID,
// //       required this.customerId,
// //       required this.senderName,
// //       required this.logo});

// //   @override
// //   State<ChatPage> createState() => _ChatPageState();
// // }

// // class _ChatPageState extends State<ChatPage> {
// //   String? messageText;
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   final TextEditingController _messageController = TextEditingController();
// //   void _sendMessage(String messageText) {
// //     FirebaseFirestore.instance.collection('messages').add({
// //       'text': messageText,
// //       ''
// //           'timestamp': FieldValue.serverTimestamp(),
// //     });

// //     _messageController.clear();
// //   }

// //   @override
// //   void initState() {
// //     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
// //       context.read<ConversationListController>().initState(context);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final read = context.read<ConversationListController>();
// //     final watch = context.watch<ConversationListController>();
// //     return Scaffold(
// //       // hasBottomNavBar: false,
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(150.h),
// //         child: CustomAppBar(
// //           drawerTitle: "Acıbadem Hospital",
// //           hasBackButton: true,
// //           hasMdTitle: false,
// //         ),
// //       ),
// //       backgroundColor: const Color(0xffF5F5F5),
// //       body: Column(children: [
// //         Expanded(
// //           child: StreamBuilder(
// //               stream:
// //                   FirebaseFirestore.instance.collection('messages').snapshots(),
// //               builder: (context, snapshot) {
// //                 if (snapshot.connectionState == ConnectionState.waiting) {
// //                   return const Center(
// //                     child: CircularProgressIndicator(),
// //                   );
// //                 }
// //                 if (snapshot.hasError) {
// //                   return Center(
// //                     child: Text('Error: ${snapshot.error}'),
// //                   );
// //                 }

// //                 var messages = snapshot.data!.docs;
// //                 List<Widget> messageWidgets = [];
// //                 for (var message in messages) {
// //                   var messageText = message['text'] as String?;
// //                   if (messageText != null) {
// //                     var messageWidget = MessageWidget(messageText);
// //                     messageWidgets.add(messageWidget);
// //                   }
// //                 }

// //                 return ListView(
// //                   reverse: true,
// //                   children: messageWidgets,
// //                 );
// //               }),
// //         ),

// //         // watch.ticketDetails?.ticketStatus!="Closed"?
// //         Container(
// //           margin: EdgeInsets.only(left: 18.w, right: 18.w),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   widget.convertionID;

// //                   Navigator.pop(context);
// //                   showDialog(
// //                       context: context,
// //                       builder: (BuildContext context) => AlertDialog(
// //                             shape: const RoundedRectangleBorder(
// //                                 borderRadius:
// //                                     BorderRadius.all(Radius.circular(15.0))),

// //                             // insetPadding:
// //                             //    EdgeInsets.all(0),
// //                             contentPadding: const EdgeInsets.only(top: 0.0),

// //                             content: Container(
// //                               // padding: EdgeInsets.only(right: 20.w),
// //                               width: ScreenUtil().screenWidth,
// //                               height: 400.h,
// //                               // padding:
// //                               //     EdgeInsets.only(bottom: 10.w),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.center,
// //                                 children: [
// //                                   GestureDetector(
// //                                     onTap: () {
// //                                       Navigator.pop(context);
// //                                     },
// //                                     child: Container(
// //                                       padding: EdgeInsets.only(
// //                                           right: 20.w, top: 16.w),
// //                                       child: Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.end,
// //                                         children: [
// //                                           SvgPicture.asset(
// //                                               "assets/icons/Close-Square black.svg"),
// //                                         ],
// //                                       ),
// //                                     ),
// //                                   ),

// //                                   SizedBox(
// //                                     height: 5.h,
// //                                   ),
// //                                   Text(
// //                                     "Make a Live Conversation Appoinment",
// //                                     textAlign: TextAlign.center,
// //                                     style: TextStyle(
// //                                         color: Colors.black,
// //                                         // letterSpacing: .5,
// //                                         fontSize: 23.sp,
// //                                         fontWeight: FontWeight.w700),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 10.h,
// //                                   ),
// //                                   Text(
// //                                     "Fill the form & get your live conversation appoinment",
// //                                     textAlign: TextAlign.center,
// //                                     style: TextStyle(
// //                                         color: Colors.black,
// //                                         // letterSpacing: .5,
// //                                         fontSize: 16.sp,
// //                                         fontWeight: FontWeight.w400),
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.only(
// //                                         left: 20.0.w, top: 33.w, right: 20.w),
// //                                     child: SDropDownField(
// //                                       titleHeader: "Conversation Objct",
// //                                       titleSize: 16.sp,
// //                                       onChanged: (value) {
// //                                         read.onSelectObject(value);
// //                                         print("watch.selectedObject");

// //                                         print(watch.selectedObject);
// //                                         print("watch.selectedObject");

// //                                         // read.onSelectAccountType(value);
// //                                       },
// //                                       hint: "Choose",
// //                                       value: watch.selectedObject,
// //                                       items: [
// //                                         DropdownMenuItem(
// //                                           value: "About Treatments",
// //                                           child: Text(
// //                                             "About Treatments",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "Other",
// //                                           child: Text(
// //                                             "Other",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "",
// //                                           child: Text(
// //                                             "",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20.h,
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.only(
// //                                         left: 20.0.w, right: 20.w),
// //                                     child: SDropDownField(
// //                                       titleHeader: "Available Time",
// //                                       titleSize: 16.sp,
// //                                       onChanged: (value) {
// //                                         read.onSelectObject(value);

// //                                         // read.onSelectAccountType(value);
// //                                       },
// //                                       hint: "Choose",
// //                                       value: read.selectedDate,
// //                                       items: [
// //                                         DropdownMenuItem(
// //                                           value: "Today",
// //                                           child: Text(
// //                                             "Today",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "Tommorow",
// //                                           child: Text(
// //                                             "Tommorow",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "Day After Tommorow",
// //                                           child: Text(
// //                                             "Day After Tommorow",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),

// //                                   SizedBox(
// //                                     height: 30.h,
// //                                   ),
// //                                   PrimaryButton(
// //                                     // borderColor: Colors.black,
// //                                     width: 250.w,
// //                                     height: 45.w,

// //                                     borderRadius: 30,

// //                                     color: const Color(0xff4CDB06),
// //                                     // color: kDefaultActiveColor,
// //                                     onTap: () {
// //                                       Navigator.pop(context);
// //                                       print(watch.selectedDate);
// //                                       print(watch.selectedObject);
// //                                       watch.selectedDate;
// //                                       watch.selectedObject;
// //                                       widget.convertionID;
// //                                       showDialog(
// //                                           context: context,
// //                                           builder: (BuildContext context) {
// //                                             return StatefulBuilder(builder:
// //                                                 (BuildContext context,
// //                                                     StateSetter setState) {
// //                                               return AlertDialog(
// //                                                   shape: RoundedRectangleBorder(
// //                                                       borderRadius:
// //                                                           BorderRadius.all(
// //                                                               Radius.circular(
// //                                                                   15.0))),

// //                                                   // insetPadding:
// //                                                   //    EdgeInsets.all(0),
// //                                                   contentPadding:
// //                                                       EdgeInsets.only(top: 0.0),
// //                                                   content: ShowMyDailog(
// //                                                     convertionId:
// //                                                         widget.convertionID,
// //                                                     object:
// //                                                         watch.selectedObject,
// //                                                     dateTime:
// //                                                         watch.selectedDate,
// //                                                   ));
// //                                             });
// //                                           });
// //                                       // Navigator.push(
// //                                       //   context,
// //                                       //   MaterialPageRoute(builder: (context) => SignUpView()),
// //                                       // );
// //                                     },
// //                                     child: Text(
// //                                       "Step 2: Date",
// //                                       style: TextStyle(
// //                                           color: Colors.black,
// //                                           // letterSpacing: .5,
// //                                           fontSize: 16.sp,
// //                                           fontWeight: FontWeight.w600),
// //                                     ),
// //                                   ),
// //                                   // Row(
// //                                   //   children: [
// //                                   //     SeconderyCheckBox(
// //                                   //       // value: watch.isVerifyChecked,
// //                                   //       onChanged: (value) {
// //                                   //         // read.onVerifyChecked(value);
// //                                   //       },
// //                                   //     ),
// //                                   //   ],
// //                                   // ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ));
// //                 },
// //                 child: Container(
// //                   padding: EdgeInsets.only(
// //                       left: 10.w, right: 10.w, top: 3.w, bottom: 3.w),
// //                   decoration: BoxDecoration(
// //                       color: Colors.red,
// //                       borderRadius: BorderRadius.circular(30)),
// //                   child: Row(
// //                     children: [
// //                       SvgPicture.asset(
// //                         "assets/icons/fluent_live-24-filled.svg",
// //                         width: 20.w,
// //                         height: 20.h,
// //                         color: Colors.white,
// //                       ),
// //                       Text(
// //                         " Send Live Consultation Request",
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: Colors.white,
// //                             // letterSpacing: .5,
// //                             fontSize: 15.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 padding: EdgeInsets.only(
// //                     left: 10.w, top: 3.w, bottom: 3.w, right: 10.w),
// //                 decoration: BoxDecoration(
// //                     color: const Color(0xffD8D8D8),
// //                     borderRadius: BorderRadius.circular(20)),
// //                 child: SvgPicture.asset(
// //                   "assets/icons/fluent_attach-16-filled.svg",
// //                   width: 20.w,
// //                   height: 20.h,
// //                   // color: Colors.red,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         SizedBox(
// //           height: 10.h,
// //         ),
// //         Container(
// //           // color: Colors.black,
// //           padding: EdgeInsets.only(left: 20.w, bottom: 10, right: 20.w),
// //           child: PrimarySTextFormFieldChat(
// //             // color: Colors.red,
// //             controller: _messageController,
// //             // height: 65.h,
// //             // maxLines: 5,
// //             textStyle: TextStyle(color: Colors.black),
// //             onChanged: (value) {
// //               messageText = value;
// //             },
// //             hintText: "Write message",

// //             hintFontSize: 16.sp,

// //             suffix: Padding(
// //               padding: EdgeInsets.only(right: 14.w),
// //               child: GestureDetector(
// //                   onTap: () {
// //                     _sendMessage(messageText ?? '');
// //                     // read.ticketReply(context);
// //                     // _firestore.collection('messages').add({
// //                     //   'text': messageText,
// //                     // });
// //                   },
// //                   child: SvgPicture.asset("assets/icons/uil_message.svg")),
// //             ),
// //             enableBorder: false,
// //           ),
// //         ),
// //       ]),
// //     );
// //   }
// // }

// // class MessageWidget extends StatelessWidget {
// //   final String messageText;

// //   MessageWidget(this.messageText);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(left: 47.w, top: 27.w, right: 18.w),
// //       padding:
// //           EdgeInsets.only(left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
// //       decoration: BoxDecoration(
// //         //  color: Colors.red,
// //         color: const Color(0xffE2E2E2),
// //         borderRadius: BorderRadius.only(
// //           topRight: Radius.circular(20.w),
// //           topLeft: Radius.circular(
// //               20.w), // Set the top-right corner to be non-circular
// //           bottomRight: Radius.circular(
// //               0.w), // Set the bottom-left corner to be non-circular
// //           bottomLeft: Radius.circular(20.w),
// //         ),
// //       ),
// //       child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
// //         Row(
// //           children: [
// //             Image(
// //               image: const AssetImage("assets/images/Rectangle 707.png"),
// //               width: 50.w,
// //               height: 50.h,
// //             ),
// //             SizedBox(
// //               width: 13.w,
// //             ),
// //             Flexible(
// //               child: Text(
// //                 '${messageText}',
// //                 // " ak Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
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
// //         const Text(
// //           "11:40",
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
// /////////////////////////////////19/3/2024//////////////////////////
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/constants/styles/colors.dart';
// // import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:md_health/widget/drop_down.dart';
// // import 'package:md_health/widget/text_field.dart';

// // class ChatPage extends StatefulWidget {
// //   ChatPage({
// //     super.key,
// //   });

// //   @override
// //   State<ChatPage> createState() => _ChatPageState();
// // }

// // class _ChatPageState extends State<ChatPage> {

// //   @override
// //   Widget build(BuildContext context) =>

// //  Scaffold(
// //       // hasBottomNavBar: false,
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(150.h),
// //         child: CustomAppBar(
// //           drawerTitle: "Acıbadem Hospital",
// //           hasBackButton: true,
// //           hasMdTitle: false,
// //         ),
// //       ),
// //       backgroundColor: Color(0xffF5F5F5),
// //       body: Column(children: [
// //         Expanded(
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 SizedBox(
// //                   height: 21.h,
// //                 ),
// //                 Text(
// //                   "Today",
// //                   style: TextStyle(
// //                     fontFamily: 'Campton',
// //                     color: Color(0xff908888),
// //                     fontSize: 15,
// //                     fontWeight: FontWeight.w400,
// //                   ),
// //                 ),
// //                 Container(
// //                   margin: EdgeInsets.only(left: 47.w, top: 27.w, right: 18.w),
// //                   padding: EdgeInsets.only(
// //                       left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xffE2E2E2),
// //                     borderRadius: BorderRadius.only(
// //                       topRight: Radius.circular(20.w),
// //                       topLeft: Radius.circular(20
// //                           .w), // Set the top-right corner to be non-circular
// //                       bottomRight: Radius.circular(0
// //                           .w), // Set the bottom-left corner to be non-circular
// //                       bottomLeft: Radius.circular(20.w),
// //                     ),
// //                   ),
// //                   child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.end,
// //                       children: [
// //                         Row(
// //                           children: [
// //                             Image(
// //                               image: const AssetImage(
// //                                   "assets/images/Rectangle 707.png"),
// //                               width: 50.w,
// //                               height: 50.h,
// //                             ),
// //                             SizedBox(
// //                               width: 13.w,
// //                             ),
// //                             const Flexible(
// //                               child: Text(
// //                                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
// //                                 style: TextStyle(
// //                                   fontFamily: 'Campton',
// //                                   color: Colors.black,
// //                                   fontSize: 14,
// //                                   fontWeight: FontWeight.w400,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const Text(
// //                           "11:40",
// //                           style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: Color(0xff908888),
// //                             fontSize: 15,
// //                             fontWeight: FontWeight.w400,
// //                           ),
// //                         ),
// //                       ]),
// //                 ),
// //                 Container(
// //                   margin: EdgeInsets.only(left: 18.w, top: 27.w, right: 68.w),
// //                   padding: EdgeInsets.only(
// //                       left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xffFBFBFB),
// //                     borderRadius: BorderRadius.only(
// //                       topRight: Radius.circular(20.w),
// //                       topLeft: Radius.circular(20
// //                           .w), // Set the top-right corner to be non-circular
// //                       bottomLeft: Radius.circular(0
// //                           .w), // Set the bottom-left corner to be non-circular
// //                       bottomRight: Radius.circular(20.w),
// //                     ),
// //                   ),
// //                   child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.end,
// //                       children: [
// //                         Row(
// //                           children: [
// //                             Image(
// //                               image: const AssetImage(
// //                                   "assets/images/Rectangle 707.png"),
// //                               width: 50.w,
// //                               height: 50.h,
// //                             ),
// //                             SizedBox(
// //                               width: 13.w,
// //                             ),
// //                             const Flexible(
// //                               child: Text(
// //                                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
// //                                 style: TextStyle(
// //                                   fontFamily: 'Campton',
// //                                   color: Colors.black,
// //                                   fontSize: 14,
// //                                   fontWeight: FontWeight.w400,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const Text(
// //                           "11:40",
// //                           style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: Color(0xff908888),
// //                             fontSize: 15,
// //                             fontWeight: FontWeight.w400,
// //                           ),
// //                         ),
// //                       ]),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),

// //         // watch.ticketDetails?.ticketStatus!="Closed"?
// //         Container(
// //           margin: EdgeInsets.only(left: 18.w, right: 18.w),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   showDialog(
// //                       context: context,
// //                       builder: (BuildContext context) => AlertDialog(
// //                             shape: RoundedRectangleBorder(
// //                                 borderRadius:
// //                                     BorderRadius.all(Radius.circular(15.0))),

// //                             // insetPadding:
// //                             //    EdgeInsets.all(0),
// //                             contentPadding: EdgeInsets.only(top: 0.0),

// //                             content: Container(
// //                               // padding: EdgeInsets.only(right: 20.w),
// //                               width: ScreenUtil().screenWidth,
// //                               height: 400.h,
// //                               // padding:
// //                               //     EdgeInsets.only(bottom: 10.w),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.center,
// //                                 children: [
// //                                   Container(
// //                                     padding: EdgeInsets.only(
// //                                         right: 20.w, top: 16.w),
// //                                     child: Row(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.end,
// //                                       children: [
// //                                         SvgPicture.asset(
// //                                             "assets/icons/Close-Square black.svg"),
// //                                       ],
// //                                     ),
// //                                   ),

// //                                   SizedBox(
// //                                     height: 5.h,
// //                                   ),
// //                                   Text(
// //                                     "Make a Live Conversation Appoinment",
// //                                     textAlign: TextAlign.center,
// //                                     style: TextStyle(
// //                                         color: Colors.black,
// //                                         // letterSpacing: .5,
// //                                         fontSize: 23.sp,
// //                                         fontWeight: FontWeight.w700),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 10.h,
// //                                   ),
// //                                   Text(
// //                                     "Fill the form & get your live conversation appoinment",
// //                                     textAlign: TextAlign.center,
// //                                     style: TextStyle(
// //                                         color: Colors.black,
// //                                         // letterSpacing: .5,
// //                                         fontSize: 16.sp,
// //                                         fontWeight: FontWeight.w400),
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.only(
// //                                         left: 20.0.w, top: 33.w, right: 20.w),
// //                                     child: SDropDownField(
// //                                       titleHeader: "Conversation Objct",
// //                                       titleSize: 16.sp,
// //                                       onChanged: (value) {
// //                                         // read.onSelectAccountType(value);
// //                                       },
// //                                       hint: "Choose",
// //                                       items: [
// //                                         DropdownMenuItem(
// //                                           value: "current",
// //                                           child: Text(
// //                                             "Current",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "saving",
// //                                           child: Text(
// //                                             "Saving",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20.h,
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.only(
// //                                         left: 20.0.w, right: 20.w),
// //                                     child: SDropDownField(
// //                                       titleHeader: "Available Time",
// //                                       onChanged: (value) {
// //                                         // read.onSelectAccountType(value);
// //                                       },
// //                                       hint: "Choose",
// //                                       items: [
// //                                         DropdownMenuItem(
// //                                           value: "current",
// //                                           child: Text(
// //                                             "Current",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "saving",
// //                                           child: Text(
// //                                             "Saving",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),

// //                                   SizedBox(
// //                                     height: 30.h,
// //                                   ),
// //                                   PrimaryButton(
// //                                     // borderColor: Colors.black,
// //                                     width: 250.w,
// //                                     height: 45.w,

// //                                     borderRadius: 30,

// //                                     color: Color(0xff4CDB06),
// //                                     // color: kDefaultActiveColor,
// //                                     onTap: () {
// //                                       // Navigator.pop(context);
// //                                       showDialog(
// //                                           context: context,
// //                                           builder:
// //                                               (BuildContext context) =>
// //                                                   AlertDialog(
// //                                                     shape: RoundedRectangleBorder(
// //                                                         borderRadius:
// //                                                             BorderRadius.all(
// //                                                                 Radius.circular(
// //                                                                     15.0))),

// //                                                     // insetPadding:
// //                                                     //    EdgeInsets.all(0),
// //                                                     contentPadding:
// //                                                         EdgeInsets.only(
// //                                                             top: 0.0),

// //                                                     content: Container(
// //                                                       // padding: EdgeInsets.only(right: 20.w),
// //                                                       width: ScreenUtil()
// //                                                           .screenWidth,
// //                                                       height: 350.h,
// //                                                       // padding:
// //                                                       //     EdgeInsets.only(bottom: 10.w),
// //                                                       child: Column(
// //                                                         crossAxisAlignment:
// //                                                             CrossAxisAlignment
// //                                                                 .center,
// //                                                         children: [
// //                                                           Container(
// //                                                             padding: EdgeInsets
// //                                                                 .only(
// //                                                                     right:
// //                                                                         20.w,
// //                                                                     top:
// //                                                                         16.w),
// //                                                             child: Row(
// //                                                               mainAxisAlignment:
// //                                                                   MainAxisAlignment
// //                                                                       .end,
// //                                                               children: [
// //                                                                 SvgPicture.asset(
// //                                                                     "assets/icons/Close-Square black.svg"),
// //                                                               ],
// //                                                             ),
// //                                                           ),

// //                                                           SizedBox(
// //                                                             height: 5.h,
// //                                                           ),
// //                                                           Text(
// //                                                             "Make a Live Conversation Appoinment",
// //                                                             textAlign:
// //                                                                 TextAlign
// //                                                                     .center,
// //                                                             style: TextStyle(
// //                                                                 color: Colors
// //                                                                     .black,
// //                                                                 // letterSpacing: .5,
// //                                                                 fontSize:
// //                                                                     23.sp,
// //                                                                 fontWeight:
// //                                                                     FontWeight
// //                                                                         .w700),
// //                                                           ),
// //                                                           SizedBox(
// //                                                             height: 10.h,
// //                                                           ),
// //                                                           Text(
// //                                                             "Fill the form & get your live conversation appoinment",
// //                                                             textAlign:
// //                                                                 TextAlign
// //                                                                     .center,
// //                                                             style: TextStyle(
// //                                                                 color: Colors
// //                                                                     .black,
// //                                                                 // letterSpacing: .5,
// //                                                                 fontSize:
// //                                                                     16.sp,
// //                                                                 fontWeight:
// //                                                                     FontWeight
// //                                                                         .w400),
// //                                                           ),
// //                                                           SizedBox(
// //                                                             height: 30.h,
// //                                                           ),
// //                                                           Column(
// //                                                             children: [
// //                                                               Row(
// //                                                                 mainAxisAlignment:
// //                                                                     MainAxisAlignment
// //                                                                         .spaceEvenly,
// //                                                                 children: [
// //                                                                   GestureDetector(
// //                                                                     onTap: () {
// //                                                                       void onChecked() {
// //   isChecked = !isChecked;
// //   notifyListeners();
// // }
// //                                                                     },
// //                                                                     child: Container(
// //                                                                       padding: EdgeInsets
// //                                                                           .all(10
// //                                                                               .w),
// //                                                                       decoration: BoxDecoration(
// //                                                                           border: Border.all(
// //                                                                               width: 1,
// //                                                                               color: Color(0xff989898)),
// //                                                                           borderRadius: BorderRadius.circular(50)),
// //                                                                       child:
// //                                                                           Text(
// //                                                                         "10:00",
// //                                                                         textAlign:
// //                                                                             TextAlign.center,
// //                                                                         style: TextStyle(
// //                                                                             color: Colors.black,
// //                                                                             // letterSpacing: .5,
// //                                                                             fontSize: 16.sp,
// //                                                                             fontWeight: FontWeight.w400),
// //                                                                       ),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "11:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "12:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                               SizedBox(
// //                                                                 height: 10.h,
// //                                                               ),
// //                                                               Row(
// //                                                                 mainAxisAlignment:
// //                                                                     MainAxisAlignment
// //                                                                         .spaceEvenly,
// //                                                                 children: [
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                   Container(
// //                                                                     padding: EdgeInsets
// //                                                                         .all(10
// //                                                                             .w),
// //                                                                     decoration: BoxDecoration(
// //                                                                         border: Border.all(
// //                                                                             width: 1,
// //                                                                             color: Color(0xff989898)),
// //                                                                         borderRadius: BorderRadius.circular(50)),
// //                                                                     child:
// //                                                                         Text(
// //                                                                       "10:00",
// //                                                                       textAlign:
// //                                                                           TextAlign.center,
// //                                                                       style: TextStyle(
// //                                                                           color: Colors.black,
// //                                                                           // letterSpacing: .5,
// //                                                                           fontSize: 16.sp,
// //                                                                           fontWeight: FontWeight.w400),
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                             ],
// //                                                           ),
// //                                                           SizedBox(
// //                                                             height: 39.h,
// //                                                           ),
// //                                                           PrimaryButton(
// //                                                             // borderColor: Colors.black,
// //                                                             width: 250.w,
// //                                                             height: 45.w,

// //                                                             borderRadius: 30,

// //                                                             color: Color(
// //                                                                 0xff4CDB06),
// //                                                             // color: kDefaultActiveColor,
// //                                                             onTap: () {
// //                                                               Navigator.pop(
// //                                                                   context);

// //                                                               // Navigator.push(
// //                                                               //   context,
// //                                                               //   MaterialPageRoute(builder: (context) => SignUpView()),
// //                                                               // );
// //                                                             },
// //                                                             child: Text(
// //                                                               "Submit",
// //                                                               style: TextStyle(
// //                                                                   color: Colors.black,
// //                                                                   // letterSpacing: .5,
// //                                                                   fontSize: 16.sp,
// //                                                                   fontWeight: FontWeight.w600),
// //                                                             ),
// //                                                           ),
// //                                                           // Row(
// //                                                           //   children: [
// //                                                           //     SeconderyCheckBox(
// //                                                           //       // value: watch.isVerifyChecked,
// //                                                           //       onChanged: (value) {
// //                                                           //         // read.onVerifyChecked(value);
// //                                                           //       },
// //                                                           //     ),
// //                                                           //   ],
// //                                                           // ),
// //                                                         ],
// //                                                       ),
// //                                                     ),
// //                                                   ));
// //                                       // Navigator.push(
// //                                       //   context,
// //                                       //   MaterialPageRoute(builder: (context) => SignUpView()),
// //                                       // );
// //                                     },
// //                                     child: Text(
// //                                       "Step 2: Date",
// //                                       style: TextStyle(
// //                                           color: Colors.black,
// //                                           // letterSpacing: .5,
// //                                           fontSize: 16.sp,
// //                                           fontWeight: FontWeight.w600),
// //                                     ),
// //                                   ),
// //                                   // Row(
// //                                   //   children: [
// //                                   //     SeconderyCheckBox(
// //                                   //       // value: watch.isVerifyChecked,
// //                                   //       onChanged: (value) {
// //                                   //         // read.onVerifyChecked(value);
// //                                   //       },
// //                                   //     ),
// //                                   //   ],
// //                                   // ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ));
// //                 },
// //                 child: Container(
// //                   padding: EdgeInsets.only(
// //                       left: 10.w, right: 10.w, top: 3.w, bottom: 3.w),
// //                   decoration: BoxDecoration(
// //                       color: Colors.red,
// //                       borderRadius: BorderRadius.circular(30)),
// //                   child: Row(
// //                     children: [
// //                       SvgPicture.asset(
// //                         "assets/icons/fluent_live-24-filled.svg",
// //                         width: 20.w,
// //                         height: 20.h,
// //                         color: Colors.white,
// //                       ),
// //                       Text(
// //                         "Live Conversation Appointments",
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: Colors.white,
// //                             // letterSpacing: .5,
// //                             fontSize: 15.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 padding: EdgeInsets.only(
// //                     left: 10.w, top: 3.w, bottom: 3.w, right: 10.w),
// //                 decoration: BoxDecoration(
// //                     color: Color(0xffD8D8D8),
// //                     borderRadius: BorderRadius.circular(20)),
// //                 child: SvgPicture.asset(
// //                   "assets/icons/fluent_attach-16-filled.svg",
// //                   width: 20.w,
// //                   height: 20.h,
// //                   // color: Colors.red,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         SizedBox(
// //           height: 10.h,
// //         ),
// //         Container(
// //           padding: EdgeInsets.only(left: 20.w, bottom: 10, right: 20.w),
// //           child: PrimarySTextFormFieldChat(
// //             color: black,
// //             // controller: watch.remarkController,
// //             // height: 65.h,
// //             // maxLines: 5,
// //             hintText: "Please text a message..",

// //             hintFontSize: 13,

// //             suffix: Padding(
// //               padding: EdgeInsets.only(right: 14.w),
// //               child: GestureDetector(
// //                   onTap: () {
// //                     // read.ticketReply(context);
// //                   },
// //                   child: SvgPicture.asset("assets/icons/uil_message.svg")),
// //             ),
// //             enableBorder: false,
// //           ),
// //         ),
// //       ]),
// //     );
// // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';
// // import 'package:md_health/Screens/message/controller/conversations_list_controller.dart';
// // import 'package:md_health/Screens/message/view/show_dailog.dart';
// // import 'package:md_health/constants/styles/colors.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:md_health/widget/base_screen.dart';
// // import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:md_health/widget/drop_down.dart';
// // import 'package:md_health/widget/text_field.dart';
// // import 'package:provider/provider.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:intl/intl.dart';
// // import 'package:image_picker/image_picker.dart';

// // class ChatPage extends StatefulWidget {
// //   final String? convertionID;
// //   final String? customerId;
// //   final String? senderName;
// //   final String? logo;
// //   const ChatPage(
// //       {super.key,
// //       required this.convertionID,
// //       required this.customerId,
// //       required this.senderName,
// //       required this.logo});

// //   @override
// //   State<ChatPage> createState() => _ChatPageState();
// // }

// // String getCurrentTime() {
// //   // Get the current DateTime
// //   DateTime now = DateTime.now();

// //   // Format the DateTime using a 24-hour format
// //   String formattedTime = DateFormat.Hm().format(now);

// //   return formattedTime;
// // }

// // class _ChatPageState extends State<ChatPage> {
// //   String? messageText;
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   final TextEditingController _messageController = TextEditingController();

// //   // void _sendMessage(String messageText) {
// //   //   FirebaseFirestore.instance.collection('apptesting').add({
// //   //     'text': messageText,
// //   //     'sender_type': 'customer',
// //   //     'current_time': '20:07',
// //   //     'user_id': '5',
// //   //     'timestamp': FieldValue.serverTimestamp(),
// //   //   });
// //   //   _messageController.clear();
// //   // }
// //   void _sendMessage(String messageText) {
// //     FirebaseFirestore.instance.collection('apptesting').add({
// //       'text': messageText,
// //       'sender_type': 'customer',
// //       'current_time': getCurrentTime(),
// //       'user_id': widget.customerId,
// //       'timestamp': FieldValue.serverTimestamp(),
// //     });

// //     _messageController.clear();
// //   }

// //   @override
// //   void initState() {
// //     print(getCurrentTime());
// //     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
// //       context.read<ConversationListController>().initState(context);
// //     });
// //   }

// //   Future<void> _pickImage() async {
// //     final pickedFile =
// //         await ImagePicker().getImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       // You can now send the selected image as a message
// //       _sendMessage(pickedFile.path);
// //     } else {
// //       // User canceled the picker
// //     }
// //   }

// // /////////////////////////////////////////////////////////////////
// //   @override
// //   Widget build(BuildContext context) {
// //     final read = context.read<ConversationListController>();
// //     final watch = context.watch<ConversationListController>();
// //     return Scaffold(
// //       // hasBottomNavBar: false,
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(150.h),
// //         child: CustomAppBar(
// //           drawerTitle: "Acıbadem Hospital",
// //           hasBackButton: true,
// //           hasMdTitle: false,
// //         ),
// //       ),
// //       backgroundColor: const Color(0xffF5F5F5),
// //       body: Column(children: [
// //         Expanded(
// //           child: StreamBuilder(
// //               stream: FirebaseFirestore.instance
// //                   .collection('apptesting')
// //                   .snapshots(),
// //               builder: (context, snapshot) {
// //                 if (!snapshot.hasData) {
// //                   return const Center(
// //                     child: CircularProgressIndicator(),
// //                   );
// //                 }
// //                 var messages = snapshot.data!.docs;
// //                 List<Widget> messageWidgets = [];
// //                 for (var message in messages) {
// //                   var messageText = message['text'] as String;
// //                   var user_type = message['sender_type'] as String;
// //                   var messageTime = message['current_time'] as String?;
// //                   var logo = '';
// //                   if (messageText != null) {
// //                     if (user_type != 'customer') {
// //                       var messageWidget =
// //                           OtherMessageWidget(messageText, messageTime, logo);
// //                       messageWidgets.add(messageWidget);
// //                     } else {
// //                       var messageWidget =
// //                           MessageWidget(messageText, messageTime, logo);

// //                       messageWidgets.add(messageWidget);
// //                     }
// //                   }
// //                 }

// //                 return ListView(
// //                   reverse: true,
// //                   children: messageWidgets,
// //                 );
// //               }),
// //         ),
// //         SizedBox(
// //           height: 10.w,
// //         ),
// //         // watch.ticketDetails?.ticketStatus!="Closed"?
// //         Container(
// //           margin: EdgeInsets.only(left: 18.w, right: 18.w),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   widget.convertionID;

// //                   Navigator.pop(context);
// //                   showDialog(
// //                       context: context,
// //                       builder: (BuildContext context) => AlertDialog(
// //                             shape: const RoundedRectangleBorder(
// //                                 borderRadius:
// //                                     BorderRadius.all(Radius.circular(15.0))),

// //                             // insetPadding:
// //                             //    EdgeInsets.all(0),
// //                             contentPadding: const EdgeInsets.only(top: 0.0),

// //                             content: Container(
// //                               // padding: EdgeInsets.only(right: 20.w),
// //                               width: ScreenUtil().screenWidth,
// //                               height: 400.h,
// //                               // padding:
// //                               //     EdgeInsets.only(bottom: 10.w),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.center,
// //                                 children: [
// //                                   GestureDetector(
// //                                     onTap: () {
// //                                       Navigator.pop(context);
// //                                     },
// //                                     child: Container(
// //                                       padding: EdgeInsets.only(
// //                                           right: 20.w, top: 16.w),
// //                                       child: Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.end,
// //                                         children: [
// //                                           SvgPicture.asset(
// //                                               "assets/icons/Close-Square black.svg"),
// //                                         ],
// //                                       ),
// //                                     ),
// //                                   ),

// //                                   SizedBox(
// //                                     height: 5.h,
// //                                   ),
// //                                   Text(
// //                                     "Make a Live Conversation Appoinment",
// //                                     textAlign: TextAlign.center,
// //                                     style: TextStyle(
// //                                         color: Colors.black,
// //                                         // letterSpacing: .5,
// //                                         fontSize: 23.sp,
// //                                         fontWeight: FontWeight.w700),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 10.h,
// //                                   ),
// //                                   Text(
// //                                     "Fill the form & get your live conversation appoinment",
// //                                     textAlign: TextAlign.center,
// //                                     style: TextStyle(
// //                                         color: Colors.black,
// //                                         // letterSpacing: .5,
// //                                         fontSize: 16.sp,
// //                                         fontWeight: FontWeight.w400),
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.only(
// //                                         left: 20.0.w, top: 33.w, right: 20.w),
// //                                     child: SDropDownField(
// //                                       titleHeader: "Conversation Objct",
// //                                       titleSize: 16.sp,
// //                                       onChanged: (value) {
// //                                         read.onSelectObject(value);
// //                                         print("watch.selectedObject");

// //                                         print(watch.selectedObject);
// //                                         print("watch.selectedObject");

// //                                         // read.onSelectAccountType(value);
// //                                       },
// //                                       hint: "Choose",
// //                                       value: watch.selectedObject,
// //                                       items: [
// //                                         DropdownMenuItem(
// //                                           value: "About Treatments",
// //                                           child: Text(
// //                                             "About Treatments",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "Other",
// //                                           child: Text(
// //                                             "Other",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "",
// //                                           child: Text(
// //                                             "",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20.h,
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.only(
// //                                         left: 20.0.w, right: 20.w),
// //                                     child: SDropDownField(
// //                                       titleHeader: "Available Time",
// //                                       titleSize: 16.sp,
// //                                       onChanged: (value) {
// //                                         read.onSelectObject(value);

// //                                         // read.onSelectAccountType(value);
// //                                       },
// //                                       hint: "Choose",
// //                                       value: read.selectedDate,
// //                                       items: [
// //                                         DropdownMenuItem(
// //                                           value: "Today",
// //                                           child: Text(
// //                                             "Today",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "Tommorow",
// //                                           child: Text(
// //                                             "Tommorow",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         DropdownMenuItem(
// //                                           value: "Day After Tommorow",
// //                                           child: Text(
// //                                             "Day After Tommorow",
// //                                             style: TextStyle(
// //                                               fontSize: 14.sp,
// //                                             ),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),

// //                                   SizedBox(
// //                                     height: 30.h,
// //                                   ),
// //                                   PrimaryButton(
// //                                     // borderColor: Colors.black,
// //                                     width: 250.w,
// //                                     height: 45.w,

// //                                     borderRadius: 30,

// //                                     color: const Color(0xff4CDB06),
// //                                     // color: kDefaultActiveColor,
// //                                     onTap: () {
// //                                       Navigator.pop(context);
// //                                       print(watch.selectedDate);
// //                                       print(watch.selectedObject);
// //                                       watch.selectedDate;
// //                                       watch.selectedObject;
// //                                       widget.convertionID;
// //                                       showDialog(
// //                                           context: context,
// //                                           builder: (BuildContext context) {
// //                                             return StatefulBuilder(builder:
// //                                                 (BuildContext context,
// //                                                     StateSetter setState) {
// //                                               return AlertDialog(
// //                                                   shape: RoundedRectangleBorder(
// //                                                       borderRadius:
// //                                                           BorderRadius.all(
// //                                                               Radius.circular(
// //                                                                   15.0))),

// //                                                   // insetPadding:
// //                                                   //    EdgeInsets.all(0),
// //                                                   contentPadding:
// //                                                       EdgeInsets.only(top: 0.0),
// //                                                   content: ShowMyDailog(
// //                                                     convertionId:
// //                                                         widget.convertionID,
// //                                                     object:
// //                                                         watch.selectedObject,
// //                                                     dateTime:
// //                                                         watch.selectedDate,
// //                                                   ));
// //                                             });
// //                                           });
// //                                       // Navigator.push(
// //                                       //   context,
// //                                       //   MaterialPageRoute(builder: (context) => SignUpView()),
// //                                       // );
// //                                     },
// //                                     child: Text(
// //                                       "Step 2: Date",
// //                                       style: TextStyle(
// //                                           color: Colors.black,
// //                                           // letterSpacing: .5,
// //                                           fontSize: 16.sp,
// //                                           fontWeight: FontWeight.w600),
// //                                     ),
// //                                   ),
// //                                   // Row(
// //                                   //   children: [
// //                                   //     SeconderyCheckBox(
// //                                   //       // value: watch.isVerifyChecked,
// //                                   //       onChanged: (value) {
// //                                   //         // read.onVerifyChecked(value);
// //                                   //       },
// //                                   //     ),
// //                                   //   ],
// //                                   // ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ));
// //                 },
// //                 child: Container(
// //                   padding: EdgeInsets.only(
// //                       left: 10.w, right: 10.w, top: 3.w, bottom: 3.w),
// //                   decoration: BoxDecoration(
// //                       color: Colors.red,
// //                       borderRadius: BorderRadius.circular(30)),
// //                   child: Row(
// //                     children: [
// //                       SvgPicture.asset(
// //                         "assets/icons/fluent_live-24-filled.svg",
// //                         width: 20.w,
// //                         height: 20.h,
// //                         color: Colors.white,
// //                       ),
// //                       Text(
// //                         " Send Live Consultation Request",
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: Colors.white,
// //                             // letterSpacing: .5,
// //                             fontSize: 15.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               GestureDetector(
// //                 onTap: _pickImage,
// //                 child: Container(
// //                   padding: EdgeInsets.only(
// //                       left: 10.w, top: 3.w, bottom: 3.w, right: 10.w),
// //                   decoration: BoxDecoration(
// //                       color: const Color(0xffD8D8D8),
// //                       borderRadius: BorderRadius.circular(20)),
// //                   child: SvgPicture.asset(
// //                     "assets/icons/fluent_attach-16-filled.svg",
// //                     width: 20.w,
// //                     height: 20.h,
// //                     // color: Colors.red,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         SizedBox(
// //           height: 10.h,
// //         ),
// //         Container(
// //           // color: Colors.black,
// //           padding: EdgeInsets.only(left: 20.w, bottom: 10, right: 20.w),
// //           child: PrimarySTextFormFieldChat(
// //             // color: Colors.red,
// //             controller: _messageController,
// //             // height: 65.h,
// //             // maxLines: 5,
// //             textStyle: TextStyle(color: Colors.black),
// //             onChanged: (value) {
// //               messageText = value;
// //             },
// //             hintText: "Write message",

// //             hintFontSize: 16.sp,

// //             suffix: Padding(
// //               padding: EdgeInsets.only(right: 14.w),
// //               child: GestureDetector(
// //                   onTap: () {
// //                     if (messageText != null) {
// //                       _sendMessage(messageText.toString());
// //                     } else {
// //                       Utils.showPrimarySnackbar(context, "Please ",
// //                           type: SnackType.error);
// //                     }
// //                   },
// //                   child: SvgPicture.asset("assets/icons/uil_message.svg")),
// //             ),
// //             enableBorder: false,
// //           ),
// //         ),
// //       ]),
// //     );
// //   }
// // }

// // class MessageWidget extends StatelessWidget {
// //   final String? messageText;
// //   final String? messageTime;
// //   final String? logo;

// //   MessageWidget(this.messageText, this.messageTime, this.logo);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(left: 47.w, top: 27.w, right: 18.w),
// //       padding:
// //           EdgeInsets.only(left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
// //       decoration: BoxDecoration(
// //         //  color: Colors.red,
// //         color: const Color(0xffE2E2E2),
// //         borderRadius: BorderRadius.only(
// //           topRight: Radius.circular(20.w),
// //           topLeft: Radius.circular(
// //               20.w), // Set the top-right corner to be non-circular
// //           bottomRight: Radius.circular(
// //               0.w), // Set the bottom-left corner to be non-circular
// //           bottomLeft: Radius.circular(20.w),
// //         ),
// //       ),
// //       child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
// //         Row(
// //           children: [
// //             Image(
// //               image: const AssetImage("assets/images/Rectangle 707.png"),
// //               width: 50.w,
// //               height: 50.h,
// //             ),
// //             SizedBox(
// //               width: 13.w,
// //             ),
// //             Flexible(
// //               child: Text(
// //                 '${messageText}',
// //                 // " ak Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
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
// //         //  color: Colors.red,
// //         color: Color.fromARGB(255, 175, 73, 73),
// //         borderRadius: BorderRadius.only(
// //           topRight: Radius.circular(20.w),
// //           topLeft: Radius.circular(
// //               20.w), // Set the top-right corner to be non-circular
// //           bottomRight: Radius.circular(
// //               20.w), // Set the bottom-left corner to be non-circular
// //           bottomLeft: Radius.circular(0.w),
// //         ),
// //       ),
// //       child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
// //         Row(
// //           children: [
// //             Image(
// //               image: const AssetImage("assets/images/Rectangle 707.png"),
// //               width: 50.w,
// //               height: 50.h,
// //             ),
// //             SizedBox(
// //               width: 13.w,
// //             ),
// //             Flexible(
// //               child: Text(
// //                 '${messageText}',
// //                 // " ak Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
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
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ImageMessageWidget extends StatelessWidget {
//   final String imageUrl;
//   final String? messageTime;
//   final String? logo;

//   const ImageMessageWidget(this.imageUrl, this.messageTime, this.logo,
//       {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 10.w, top: 27.w, right: 47.w),
//       padding:
//           EdgeInsets.only(left: 22.w, top: 19.w, bottom: 10.w, right: 13.w),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 175, 73, 73),
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(20.w),
//           topLeft: Radius.circular(20.w),
//           bottomRight: Radius.circular(20.w),
//           bottomLeft: Radius.circular(0.w),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               // Display logo if available
//               if (logo != null)
//                 Image.network(
//                   logo!,
//                   width: 30.w,
//                   height: 30.h,
//                   fit: BoxFit.cover,
//                 ),
//               SizedBox(width: 10.w),
//               // Display the image message
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.w),
//                   child: Image.network(
//                     imageUrl,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 5.w),
//           // Display the time of the message
//           if (messageTime != null)
//             Text(
//               messageTime!,
//               style: TextStyle(
//                 fontFamily: 'Campton',
//                 color: const Color(0xff908888),
//                 fontSize: 15,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
