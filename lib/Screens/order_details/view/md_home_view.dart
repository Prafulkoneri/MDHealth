// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
// import 'package:md_health/Screens/order_details/view/order_detail_view.dart';
// import 'package:md_health/Screens/purches_items/view/purches_item_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:provider/provider.dart';

// class MdHomeView extends StatefulWidget {
//   const MdHomeView({super.key});

//   @override
//   State<MdHomeView> createState() => _MdHomeViewState();
// }

// class _MdHomeViewState extends State<MdHomeView> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<NewMainScreenController>();
//     final watch = context.watch<NewMainScreenController>();
//     return BaseScreen(
//       backgroundColor: const Color(0xffF5F5F5),
//       appBar: CustomAppBar(
//         onBackPressed: () {
//           // read.setCurrentScreen(2);
//           watch.currentScreen = PurchesItemView();
//           Navigator.push(
//             context,
//             SlidePageRoute(
//               page: NewMainScreenView(
//                   // packageId:MdShopView
//                   //     widget.packageId,
//                   ),

//               direction:
//                   SlideDirection.left, // Specify the slide direction here
//               delay: Duration(milliseconds: 5000),
//             ),
//           );
//         },
//         // hasHiText: true,
//         hasBackButton: true,
//         hasMdTitle: false,
//         drawerTitle: "Orders - MDhome",
//       ),
//       content: Container(
//         padding:
//             EdgeInsets.only(left: 20.w, top: 48.w, bottom: 10.h, right: 18.w),
//         child: ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: 2,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   SlidePageRoute(
//                     page: AllOrderDetailView(
//                         // packageId:MdShopView
//                         //     widget.packageId,
//                         ),
//                     direction: SlideDirection
//                         .right, // Specify the slide direction here
//                     delay: Duration(milliseconds: 5000),
//                   ),
//                 );
//               },
//               child: Container(
//                   margin: EdgeInsets.only(
//                     bottom: 20.w,
//                   ),
//                   padding: EdgeInsets.only(
//                     left: 15.w,
//                     right: 12.w,
//                     top: 24.w,
//                     bottom: 12.w,
//                   ),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.10),
//                           // offset: Offset(2, 2),
//                           blurRadius: 20,
//                         ),
//                       ]),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image(
//                             image:
//                                 AssetImage("assets/images/product_Square.png"),
//                             height: 52.h,
//                             width: 52.w,
//                           ),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Order No: #MD3726378',
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Text(
//                                 " Home Patient Care Service",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Date:   ",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: black,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Card(
//                                 child: Container(
//                                   padding: EdgeInsets.only(right: 28),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         width: 1,
//                                         color: const Color.fromARGB(
//                                             0, 250, 239, 239)),
//                                     color: const Color(0xffFFFFFF),
//                                     borderRadius: BorderRadius.circular(2),
//                                   ),
//                                   child: Container(
//                                     padding: EdgeInsets.only(
//                                         top: 8.w, bottom: 5.w, right: 12.w),
//                                     decoration: BoxDecoration(
//                                       color: kDefaultActiveColor,
//                                       borderRadius: BorderRadius.circular(2),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // SizedBox(
//                           //   width: 5.w,
//                           // ),
//                           Text(
//                             "Remaining Time: 6 Days",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: black,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10.w,
//                       ),
//                       RichText(
//                         text: TextSpan(
//                           text: 'Total Price : ',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Color(0xff4CDB06),
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w700),

//                           /*defining default style is optional */
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: '1.517,71 ₺',
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Colors.black,
//                                   fontSize: 16.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
