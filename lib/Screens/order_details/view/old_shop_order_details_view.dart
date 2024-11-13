// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/diet_plan/view/popup_widget_step_2.dart';
// import 'package:md_health/Screens/order_details/controller/order_details_food_controller.dart';
// import 'package:md_health/Screens/order_details/controller/shop_details_controller.dart';
// import 'package:md_health/Screens/order_details/view/md_food_view.dart';
// import 'package:md_health/Screens/order_details/view/md_shop_view.dart';
// import 'package:md_health/Screens/order_details/view/shop_order_cancel_reason_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/check_box.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';

// class ShopOrderDetailsOrderView extends StatefulWidget {
//   final String? shopOrderId;
//   const ShopOrderDetailsOrderView({super.key, required this.shopOrderId});

//   @override
//   State<ShopOrderDetailsOrderView> createState() =>
//       _ShopOrderDetailsOrderViewState();
// }

// class _ShopOrderDetailsOrderViewState extends State<ShopOrderDetailsOrderView>
//     with TickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       // log(widget.packageId ?? '');
//       context
//           .read<ShopListDetailsController>()
//           .initState(context, widget.shopOrderId);
//     });
//     _animationController = AnimationController(
//       vsync: this,
//       duration:
//           const Duration(milliseconds: 500), // Adjust the duration as needed
//     );
//     _animation = Tween<double>(begin: 1, end: 0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.linear),
//     );
//   }

//   void showStepOneDialog({String? id}) {
//     debugPrint('/////////////$id///////////////');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: PopupDialogWidgetStepTwo(
//                   foodPackageId: id.toString(),
//                   onTap: () {
//                     // Navigator.pop(context);
//                     // showDialog(
//                     //     context: context,
//                     //     builder: (BuildContext context) {
//                     //       return PopupDialogWidgetStepOne(
//                     //         onTapText: 'Myself',
//                     //         child: Padding(
//                     //           padding: EdgeInsets.symmetric(horizontal: 10.w),
//                     //           child: Text(
//                     //             "Who is this purchase for?",
//                     //             style: TextStyle(
//                     //               fontFamily: 'Campton',
//                     //               color: Colors.black,
//                     //               fontSize: 17.sp,
//                     //               fontWeight: FontWeight.w600,
//                     //             ),
//                     //           ),
//                     //         ),
//                     //         onTap: () {
//                     //           Navigator.pop(context);
//                     //           showDialog(
//                     //               context: context,
//                     //               builder: (BuildContext context) {
//                     //                 return PaymentDetailsViewDiet();
//                     //               });
//                     //         },
//                     //         onTapButton2: () {
//                     //           Navigator.push(
//                     //             context,
//                     //             MaterialPageRoute(
//                     //                 builder: (context) =>
//                     //                     const InformationFormView()),
//                     //           );
//                     //         },
//                     //       );
//                     //     });
//                   }),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget build(BuildContext context) {
//     final read = context.read<ShopListDetailsController>();
//     final watch = context.watch<ShopListDetailsController>();
//     return BaseScreen(
//       backgroundColor: const Color(0xffF5F5F5),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(125.h),
//         child: CustomAppBar(
//             onBackPressed: () {
//               Navigator.push(
//                 context,
//                 SlidePageRoute(
//                   page: OrderMdShopView(
//                       // packageId:MdShopView
//                       //     widget.packageId,
//                       ),
//                   direction:
//                       SlideDirection.left, // Specify the slide direction here
//                   delay: Duration(milliseconds: 5000),
//                 ),
//               );
//             },
//             // hasHiText: true,
//             hasBackButton: true,
//             hasMdTitle: false,
//             drawerTitle: "Order No: ${watch.orderId}"
//             // ${watch.foodOrderId.toString()}

//             ),
//       ),
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.only(
//               left: 25.w,
//               top: 30.w,
//             ),
//             child: Text(
//               'Products',
//               style: TextStyle(
//                   fontFamily: 'Campton',
//                   color: Colors.black,
//                   fontSize: 19.sp,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(
//                 left: 18.w, top: 17.w, bottom: 9.h, right: 18.w),
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: watch.shopProductDetails?.length ?? 0,
//               itemBuilder: (context, index) {
//                 final element = watch.shopProductDetails?[index];
//                 return Container(
//                     margin: EdgeInsets.only(
//                       bottom: 10.w,
//                     ),
//                     padding: EdgeInsets.only(
//                         left: 15.w, top: 5.w, bottom: 5.w, right: 8.w),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.10),
//                             // offset: Offset(2, 2),
//                             blurRadius: 20,
//                           ),
//                         ]),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // element?.companyLogoImagePath == ""
//                             //     ? SizedBox(
//                             //         height: 50.w,
//                             //         width: 50.w,
//                             //         child: Image.asset(
//                             //           "assets/images/image_not_found.png",
//                             //           fit: BoxFit.cover,
//                             //         ),
//                             //       )
//                             //     : SizedBox(
//                             //         height: 50.w,
//                             //         width: 50.w,
//                             //         child: AppNetworkImages(
//                             //           imageUrl:
//                             //               "${element?.companyLogoImagePath}",
//                             //           fit: BoxFit.cover,
//                             //         ),
//                             //       ),
//                             Image(
//                               image: AssetImage(
//                                   "assets/images/product_Square.png"),
//                               height: 50.h,
//                               width: 50.w,
//                             ),
//                             SizedBox(
//                               width: 10.w,
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 // mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     // mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         '${element?.productName}',
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       Text(
//                                         "Price :",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.w600),
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         '${element?.quantity}x(Pcs)',
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       Text(
//                                         '${element?.amountPaid} ₺',
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ));
//               },
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 20.w, right: 20.w),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Status: ',
//                       style: TextStyle(
//                           fontFamily: 'Campton',
//                           color: Colors.black,
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         text: 'Shipping Fee:',
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: black,
//                             fontSize: 13.sp,
//                             fontWeight: FontWeight.w500),

//                         /*defining default style is optional */
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: '${watch.deliveryCharge ?? ""} ₺',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 fontSize: 13.sp,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 7.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(
//                           left: 20.w, top: 5.w, bottom: 5.w, right: 18.w),
//                       decoration: BoxDecoration(
//                           // color:
//                           //     watch.orderFoodDetails?.orderStatus == "pending"
//                           //         ? Color(0xffF3771D)
//                           //         : watch.orderFoodDetails?.orderStatus ==
//                           //                 "in_progress"
//                           //             ? Color(0xff4CDB06)
//                           //             : Colors.orange,
//                           color:
//                               watch.orderFoodDetails?.orderStatus == "pending"
//                                   ? Color(0xffF3771D)
//                                   : watch.orderFoodDetails?.orderStatus ==
//                                           "completed"
//                                       ? Colors.green
//                                       : Colors.red,
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Center(
//                         child: Text(
//                           '${watch.orderStatus ?? ""}',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.black,
//                               fontSize: 10.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         text: 'Total Price: ',
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: Color(0xff4CDB06),
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w700),

//                         /*defining default style is optional */
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: '${watch.totalAmountPaid ?? ""}₺',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 18.w, top: 23.w, right: 18.w),
//             padding: EdgeInsets.only(left: 28.w, top: 28.w, right: 14.w),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.10),
//                     // offset: Offset(2, 2),
//                     blurRadius: 20,
//                   ),
//                 ]),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Address ',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 13.w,
//                 ),
//                 Text(
//                   'Delivery Address ',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 6.w,
//                 ),
//                 Text(
//                   "${watch.address ?? ""}",

//                   // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 13.w,
//                 ),
//                 Text(
//                   '${watch.city ?? ""} / ${watch.country ?? ""}',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 22.w,
//                 ),
//                 PrimaryButton(
//                   // width: 366.w,
//                   height: 39.h,
//                   // borderRadius: BorderRadius.circular(),
//                   borderRadius: 30,
//                   // width: ScreenUtil().screenWidth,
//                   color: Color(0xff000000),
//                   onTap: () {
//                     // showDialog(
//                     //     context: context,
//                     //     builder: (BuildContext context) => AlertDialog(
//                     //           shape: RoundedRectangleBorder(
//                     //               borderRadius:
//                     //                   BorderRadius.all(Radius.circular(15.0))),

//                     //           // insetPadding:
//                     //           //    EdgeInsets.all(0),
//                     //           contentPadding: EdgeInsets.only(top: 0.0),

//                     //           content: Container(
//                     //             width: ScreenUtil().screenWidth,
//                     //             height: 500.h,
//                     //             // padding:
//                     //             //     EdgeInsets.only(bottom: 10.w),
//                     //             child: Column(
//                     //               crossAxisAlignment: CrossAxisAlignment.center,
//                     //               children: [
//                     //                 Stack(
//                     //                   children: [
//                     //                     Container(
//                     //                       decoration: BoxDecoration(
//                     //                           borderRadius: BorderRadius.all(
//                     //                               Radius.circular(15.0))),
//                     //                       child: ClipRRect(
//                     //                         borderRadius: BorderRadius.circular(
//                     //                             15), // Image border
//                     //                         child: SizedBox.fromSize(
//                     //                           // size: Size.fromRadius(
//                     //                           //     10), // Image radius
//                     //                           child: Image(
//                     //                               image: AssetImage(
//                     //                                   "assets/images/green_pop_up.png")),
//                     //                         ),
//                     //                       ),

//                     //                       // Image(
//                     //                       //     image: AssetImage(
//                     //                       //         "assets/images/pop__new_.png")),
//                     //                     ),
//                     //                     Positioned(
//                     //                         top: 15,
//                     //                         right: 15,
//                     //                         // left: 0,
//                     //                         child: GestureDetector(
//                     //                           onTap: () {
//                     //                             Navigator.pop(context);
//                     //                             // Navigator.push(
//                     //                             //   context,
//                     //                             //   MaterialPageRoute(
//                     //                             //       builder: (context) =>
//                     //                             //           FoodOrderDetailsOrderView()),
//                     //                             // );
//                     //                             // Now using the context obtained from the builder
//                     //                           },
//                     //                           child: SvgPicture.asset(
//                     //                               "assets/icons/red_close.svg"),
//                     //                         )),
//                     //                     Positioned(
//                     //                       top: 25,
//                     //                       right: 135,
//                     //                       // left: 0,
//                     //                       child: SvgPicture.asset(
//                     //                           "assets/icons/location_01.svg"),
//                     //                       width: 40.w,
//                     //                       height: 40.w,
//                     //                     ),
//                     //                     Positioned(
//                     //                       top: 80,
//                     //                       right: 55,
//                     //                       // left: 0,
//                     //                       child: Text(
//                     //                         "Delivery Address",
//                     //                         style: TextStyle(
//                     //                             color: Colors.black,
//                     //                             // letterSpacing: .5,
//                     //                             fontSize: 25.sp,
//                     //                             fontWeight: FontWeight.w700),
//                     //                       ),
//                     //                     )
//                     //                   ],
//                     //                 ),
//                     //                 SizedBox(
//                     //                   height: 38.h,
//                     //                 ),
//                     //                 Text(
//                     //                   "Change Delivery Address",
//                     //                   style: TextStyle(
//                     //                       color: Colors.black,
//                     //                       // letterSpacing: .5,
//                     //                       fontSize: 16.sp,
//                     //                       fontWeight: FontWeight.w500),
//                     //                 ),
//                     //                 SizedBox(
//                     //                   height: 30.h,
//                     //                 ),
//                     //                 Padding(
//                     //                   padding: EdgeInsets.only(
//                     //                       left: 20.0.w, right: 20.w),
//                     //                   child: SDropDownField(
//                     //                     // titleHeader: "*Patient Country",
//                     //                     onChanged: (value) {
//                     //                       // read.onSelectAccountType(value);
//                     //                     },
//                     //                     hint: "Your Country",
//                     //                     items: [
//                     //                       DropdownMenuItem(
//                     //                         value: "current",
//                     //                         child: Text(
//                     //                           "Current",
//                     //                           style: TextStyle(
//                     //                             fontSize: 14.sp,
//                     //                           ),
//                     //                         ),
//                     //                       ),
//                     //                       DropdownMenuItem(
//                     //                         value: "saving",
//                     //                         child: Text(
//                     //                           "Saving",
//                     //                           style: TextStyle(
//                     //                             fontSize: 14.sp,
//                     //                           ),
//                     //                         ),
//                     //                       )
//                     //                     ],
//                     //                   ),
//                     //                 ),
//                     //                 Padding(
//                     //                   padding: EdgeInsets.only(
//                     //                       left: 20.0.w, top: 25.w, right: 20.w),
//                     //                   child: SDropDownField(
//                     //                     // titleHeader: "*Patient Country",
//                     //                     onChanged: (value) {
//                     //                       // read.onSelectAccountType(value);
//                     //                     },
//                     //                     hint: "Your City",
//                     //                     items: [
//                     //                       DropdownMenuItem(
//                     //                         value: "current",
//                     //                         child: Text(
//                     //                           "Current",
//                     //                           style: TextStyle(
//                     //                             fontSize: 14.sp,
//                     //                           ),
//                     //                         ),
//                     //                       ),
//                     //                       DropdownMenuItem(
//                     //                         value: "saving",
//                     //                         child: Text(
//                     //                           "Saving",
//                     //                           style: TextStyle(
//                     //                             fontSize: 14.sp,
//                     //                           ),
//                     //                         ),
//                     //                       )
//                     //                     ],
//                     //                   ),
//                     //                 ),
//                     //                 Padding(
//                     //                   padding: EdgeInsets.only(
//                     //                       left: 20.0.w, top: 25.w, right: 20.w),
//                     //                   child: PrimaryInformationTextFormField(
//                     //                     // color: Colors.red,
//                     //                     // width: 48.w,
//                     //                     // titleHeader: "*Patient Contact Number",
//                     //                     hintText: "Your Address",
//                     //                   ),
//                     //                 ),
//                     //                 SizedBox(
//                     //                   height: 30.h,
//                     //                 ),
//                     //                 Container(
//                     //                   // padding: EdgeInsets.only(left: 18.0.w),
//                     //                   child: PrimaryButton(
//                     //                     // borderColor: Colors.black,
//                     //                     width: 250.w,
//                     //                     height: 50.w,

//                     //                     borderRadius: 30,

//                     //                     color: Color(0xff4CDB06),
//                     //                     // color: kDefaultActiveColor,
//                     //                     onTap: () {
//                     //                       // Navigator.pop(context);

//                     //                       // Navigator.push(
//                     //                       //   context,
//                     //                       //   MaterialPageRoute(builder: (context) => SignUpView()),
//                     //                       // );
//                     //                     },
//                     //                     child: Text(
//                     //                       "Save Changes",
//                     //                       style: TextStyle(
//                     //                           color: Colors.black,
//                     //                           // letterSpacing: .5,
//                     //                           fontSize: 16.sp,
//                     //                           fontWeight: FontWeight.w600),
//                     //                     ),
//                     //                   ),
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //           ),
//                     //         ));
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => SignUpView()),
//                     // );
//                   },
//                   child: Text(
//                     "Change Delivery Address",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.white,
//                         // letterSpacing: .5,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 64.w,
//                 ),
//                 Text(
//                   'Invoice Address ',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 31.w,
//                 ),
//                 Text(
//                   "${watch.address ?? ""}",
//                   // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 22.w,
//                 ),

//                 Text(
//                   '${watch.city ?? ""} / ${watch.country ?? ""}',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 13.w,
//                 ),
//                 PrimaryButton(
//                   // width: 366.w,
//                   height: 39.h,
//                   // borderRadius: BorderRadius.circular(),
//                   borderRadius: 30,
//                   // width: ScreenUtil().screenWidth,
//                   color: Color(0xff000000),
//                   onTap: () {
//                     showDialog(
//                         context: context,
//                         builder: (BuildContext context) => AlertDialog(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(15.0))),

//                               // insetPadding:
//                               //    EdgeInsets.all(0),
//                               contentPadding: EdgeInsets.only(top: 0.0),

//                               content: Container(
//                                 width: ScreenUtil().screenWidth,
//                                 height: 500.h,
//                                 // padding:
//                                 //     EdgeInsets.only(bottom: 10.w),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(15.0))),
//                                           child: ClipRRect(
//                                             borderRadius: BorderRadius.circular(
//                                                 15), // Image border
//                                             child: SizedBox.fromSize(
//                                               // size: Size.fromRadius(
//                                               //     10), // Image radius
//                                               child: Image(
//                                                   image: AssetImage(
//                                                       "assets/images/green_pop_up.png")),
//                                             ),
//                                           ),

//                                           // Image(
//                                           //     image: AssetImage(
//                                           //         "assets/images/pop__new_.png")),
//                                         ),
//                                         Positioned(
//                                             top: 15,
//                                             right: 15,
//                                             // left: 0,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: SvgPicture.asset(
//                                                   "assets/icons/red_close.svg"),
//                                             )),
//                                         Positioned(
//                                           top: 25,
//                                           right: 135,
//                                           // left: 0,
//                                           child: SvgPicture.asset(
//                                               "assets/icons/address_01.svg"),
//                                           height: 40.w,
//                                           width: 40.w,
//                                         ),
//                                         Positioned(
//                                           top: 80,
//                                           right: 55,
//                                           // left: 0,
//                                           child: Text(
//                                             "Invoice Address",
//                                             style: TextStyle(
//                                                 fontFamily: 'Campton',
//                                                 color: Colors.black,
//                                                 // letterSpacing: .5,
//                                                 fontSize: 25.sp,
//                                                 fontWeight: FontWeight.w700),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 38.h,
//                                     ),
//                                     Text(
//                                       "Change Invoice Address",
//                                       style: TextStyle(
//                                           fontFamily: 'Campton',
//                                           color: Colors.black,
//                                           // letterSpacing: .5,
//                                           fontSize: 16.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: 30.h,
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 20.0.w, right: 20.w),
//                                       child: SDropDownField(
//                                         // titleHeader: "*Patient Country",
//                                         onChanged: (value) {
//                                           // read.onSelectAccountType(value);
//                                         },
//                                         hint: "Your Country",
//                                         items: [
//                                           DropdownMenuItem(
//                                             value: "current",
//                                             child: Text(
//                                               "Current",
//                                               style: TextStyle(
//                                                 fontSize: 14.sp,
//                                               ),
//                                             ),
//                                           ),
//                                           DropdownMenuItem(
//                                             value: "saving",
//                                             child: Text(
//                                               "Saving",
//                                               style: TextStyle(
//                                                 fontSize: 14.sp,
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 20.0.w, top: 25.w, right: 20.w),
//                                       child: SDropDownField(
//                                         // titleHeader: "*Patient Country",
//                                         onChanged: (value) {
//                                           // read.onSelectAccountType(value);
//                                         },
//                                         hint: "Your City",
//                                         items: [
//                                           DropdownMenuItem(
//                                             value: "current",
//                                             child: Text(
//                                               "Current",
//                                               style: TextStyle(
//                                                 fontSize: 14.sp,
//                                               ),
//                                             ),
//                                           ),
//                                           DropdownMenuItem(
//                                             value: "saving",
//                                             child: Text(
//                                               "Saving",
//                                               style: TextStyle(
//                                                 fontSize: 14.sp,
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 20.0.w, top: 25.w, right: 20.w),
//                                       child: PrimaryInformationTextFormField(
//                                         // color: Colors.red,
//                                         // width: 48.w,
//                                         // titleHeader: "*Patient Contact Number",
//                                         hintText: "Your Address",
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 30.h,
//                                     ),
//                                     Container(
//                                       // padding: EdgeInsets.only(left: 18.0.w),
//                                       child: PrimaryButton(
//                                         // borderColor: Colors.black,
//                                         width: 250.w,
//                                         height: 50.w,

//                                         borderRadius: 30,

//                                         color: Color(0xff4CDB06),
//                                         // color: kDefaultActiveColor,
//                                         onTap: () {
//                                           Navigator.pop(context);

//                                           // Navigator.push(
//                                           //   context,
//                                           //   MaterialPageRoute(builder: (context) => SignUpView()),
//                                           // );
//                                         },
//                                         child: Text(
//                                           "Save Changes",
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               // letterSpacing: .5,
//                                               fontSize: 16.sp,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ));
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => SignUpView()),
//                     // );
//                   },
//                   child: Text(
//                     "Change Invoice Address",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.white,
//                         // letterSpacing: .5,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),

//                 SizedBox(
//                   height: 64.w,
//                 ),
//                 Text(
//                   'Payment Info ',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 11.w,
//                 ),
//                 Text(
//                   "${watch.paymentMode}",
//                   // 'via Credit / Debit Card  ( **** **** **** 9892 )',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 6.w,
//                 ),
//                 watch.paymentMode == "card"
//                     ? Text(
//                         '3D Secure -  Payment Completed',
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: Colors.black,
//                             fontStyle: FontStyle.italic,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w600),
//                       )
//                     : Container(),
//                 SizedBox(
//                   height: 20.w,
//                 ),
//                 PrimaryButton(
//                   width: 366.w,
//                   height: 40.h,
//                   // borderRadius: BorderRadius.circular(),
//                   borderRadius: 30,
//                   // width: ScreenUtil().screenWidth,
//                   color: Color(0xffF55C5C),
//                   onTap: () {
//                     print(watch.orderId);
//                     showDialog(
//                         context: context,
//                         builder: (BuildContext context) => AlertDialog(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15.0))),

//                             // insetPadding:
//                             //    EdgeInsets.all(0),
//                             contentPadding: EdgeInsets.only(top: 0.0),
//                             content: ShopOrderDetailsCancellpopUp(
//                               shopOrderId: watch.shopOrderId,
//                             )
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => SignUpView()),
//                             // );
//                             ));
//                   },
//                   child: Text(
//                     "Cancellation Request",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.white,
//                         // letterSpacing: .5,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 // Text(
//                 //   "Shipping Info",
//                 //   style: TextStyle(
//                 //       color: Colors.black,
//                 //       // letterSpacing: .5,
//                 //       fontSize: 20.sp,
//                 //       fontWeight: FontWeight.w600),
//                 // ),
//                 // RichText(
//                 //   text: TextSpan(
//                 //     text: 'Company : ',
//                 //     style: TextStyle(
//                 //         fontFamily: 'Campton',
//                 //         color: black,
//                 //         fontSize: 18.sp,
//                 //         fontWeight: FontWeight.w400),

//                 //     /*defining default style is optional */
//                 //     children: <TextSpan>[
//                 //       TextSpan(
//                 //         text: 'DHL Express',
//                 //         style: TextStyle(
//                 //             fontFamily: 'Campton',
//                 //             color: Colors.black,
//                 //             fontSize: 18.sp,
//                 //             fontWeight: FontWeight.w600),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // RichText(
//                 //   text: TextSpan(
//                 //     text: 'Tracking No : ',
//                 //     style: TextStyle(
//                 //         fontFamily: 'Campton',
//                 //         color: black,
//                 //         fontSize: 18.sp,
//                 //         fontWeight: FontWeight.w400),

//                 //     /*defining default style is optional */
//                 //     children: <TextSpan>[
//                 //       TextSpan(
//                 //         text: 'DHL383738',
//                 //         style: TextStyle(
//                 //             fontFamily: 'Campton',
//                 //             color: Colors.black,
//                 //             fontSize: 18.sp,
//                 //             fontWeight: FontWeight.w600),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 33.h,
//                 // ),
//                 // PrimaryButton(
//                 //   // borderRadius: BorderRadius.circular(),
//                 //   borderRadius: 30,
//                 //   // width: ScreenUtil().screenWidth,
//                 //   color: Color(0xffFFC900),
//                 //   onTap: () {
//                 //     // Navigator.push(
//                 //     //   context,
//                 //     //   MaterialPageRoute(builder: (context) => SignUpView()),
//                 //     // );
//                 //   },
//                 //   child: Text(
//                 //     "Where is my cargo?",
//                 //     style: TextStyle(
//                 //         color: Color(0xffE80000),
//                 //         // letterSpacing: .5,
//                 //         fontSize: 16.sp,
//                 //         fontWeight: FontWeight.w600),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 11.h,
//                 // ),
//                 // PrimaryButton(
//                 //   // borderRadius: BorderRadius.circular(),
//                 //   borderRadius: 30,
//                 //   // width: ScreenUtil().screenWidth,
//                 //   color: Color(0xffF3771D),
//                 //   onTap: () {
//                 //     showDialog(
//                 //         context: context,
//                 //         builder: (_) => AlertDialog(
//                 //               shape: RoundedRectangleBorder(
//                 //                   borderRadius:
//                 //                       BorderRadius.all(Radius.circular(15.0))),

//                 //               // insetPadding:
//                 //               //    EdgeInsets.all(0),
//                 //               contentPadding: EdgeInsets.only(top: 0.0),

//                 //               content: Container(
//                 //                 width: ScreenUtil().screenWidth,
//                 //                 height: 450.h,
//                 //                 // padding:
//                 //                 //     EdgeInsets.only(bottom: 10.w),
//                 //                 child: Column(
//                 //                   crossAxisAlignment: CrossAxisAlignment.start,
//                 //                   children: [
//                 //                     Stack(
//                 //                       children: [
//                 //                         Container(
//                 //                           decoration: BoxDecoration(
//                 //                               borderRadius: BorderRadius.all(
//                 //                                   Radius.circular(15.0))),
//                 //                           child: ClipRRect(
//                 //                             borderRadius: BorderRadius.circular(
//                 //                                 15), // Image border
//                 //                             child: SizedBox.fromSize(
//                 //                               // size: Size.fromRadius(
//                 //                               //     10), // Image radius
//                 //                               child: Image(
//                 //                                   image: AssetImage(
//                 //                                       "assets/images/refund_pop_up.png")),
//                 //                             ),
//                 //                           ),

//                 //                           // Image(
//                 //                           //     image: AssetImage(
//                 //                           //         "assets/images/pop__new_.png")),
//                 //                         ),
//                 //                         Positioned(
//                 //                             top: 15,
//                 //                             right: 15,
//                 //                             // left: 0,
//                 //                             child: GestureDetector(
//                 //                               onTap: () {
//                 //                                 Navigator.pop(context);
//                 //                               },
//                 //                               child: SvgPicture.asset(
//                 //                                   "assets/icons/red_close.svg"),
//                 //                             )),
//                 //                         Positioned(
//                 //                             top: 25,
//                 //                             right: 135,
//                 //                             // left: 0,
//                 //                             child: SvgPicture.asset(
//                 //                                 "assets/icons/refund.svg")),
//                 //                         Positioned(
//                 //                           top: 80,
//                 //                           right: 60,
//                 //                           // left: 0,
//                 //                           child: Text(
//                 //                             "Start a refund",
//                 //                             style: TextStyle(
//                 //                                 color: Colors.white,
//                 //                                 // letterSpacing: .5,
//                 //                                 fontSize: 25.sp,
//                 //                                 fontWeight: FontWeight.w700),
//                 //                           ),
//                 //                         )
//                 //                       ],
//                 //                     ),
//                 //                     SizedBox(
//                 //                       height: 38.h,
//                 //                     ),
//                 //                     Container(
//                 //                       padding: EdgeInsets.only(left: 18.0.w),
//                 //                       child: Text(
//                 //                         "Refund Detail",
//                 //                         style: TextStyle(
//                 //                             color: Colors.black,
//                 //                             // letterSpacing: .5,
//                 //                             fontSize: 16.sp,
//                 //                             fontWeight: FontWeight.w500),
//                 //                       ),
//                 //                     ),
//                 //                     SizedBox(
//                 //                       height: 10.h,
//                 //                     ),
//                 //                     Padding(
//                 //                       padding: EdgeInsets.only(
//                 //                           left: 10.0.w, right: 10.w),
//                 //                       child: PrimaryInformationTextFormField(
//                 //                         maxLines: 100,

//                 //                         // color: Colors.red,
//                 //                         height: 100.w,
//                 //                         // titleHeader: "*Patient Contact Number",
//                 //                         hintText:
//                 //                             "Please write your treatment cancellation request in detail",
//                 //                         contentPadding:
//                 //                             EdgeInsets.only(top: 20, left: 15),
//                 //                       ),
//                 //                     ),
//                 //                     SizedBox(
//                 //                       height: 38.h,
//                 //                     ),
//                 //                     Padding(
//                 //                       padding: EdgeInsets.only(left: 18.0.w),
//                 //                       child: Row(
//                 //                         crossAxisAlignment:
//                 //                             CrossAxisAlignment.start,
//                 //                         children: [
//                 //                           SeconderyCheckBox(
//                 //                             // value: watch.isVerifyChecked,
//                 //                             onChanged: (value) {
//                 //                               // read.onVerifyChecked(value);
//                 //                             },
//                 //                           ),
//                 //                           Flexible(
//                 //                             child: Text(
//                 //                               " I confirm that I wish refund my orders",
//                 //                               style: TextStyle(
//                 //                                   color: Colors.black,
//                 //                                   // letterSpacing: .5,
//                 //                                   fontSize: 16.sp,
//                 //                                   fontWeight: FontWeight.w500),
//                 //                             ),
//                 //                           ),
//                 //                         ],
//                 //                       ),
//                 //                     ),
//                 //                     SizedBox(
//                 //                       height: 30.h,
//                 //                     ),
//                 //                     Container(
//                 //                       padding: EdgeInsets.only(left: 18.0.w),
//                 //                       child: PrimaryButton(
//                 //                         // borderColor: Colors.black,
//                 //                         width: 250.w,
//                 //                         height: 57.w,

//                 //                         borderRadius: 30,

//                 //                         color: Color(0xffF3771D),
//                 //                         // color: kDefaultActiveColor,
//                 //                         onTap: () {
//                 //                           Navigator.pop(context);

//                 //                           // Navigator.push(
//                 //                           //   context,
//                 //                           //   MaterialPageRoute(builder: (context) => SignUpView()),
//                 //                           // );
//                 //                         },
//                 //                         child: Text(
//                 //                           "Submit Refund Request",
//                 //                           style: TextStyle(
//                 //                               color: Colors.white,
//                 //                               // letterSpacing: .5,
//                 //                               fontSize: 16.sp,
//                 //                               fontWeight: FontWeight.w600),
//                 //                         ),
//                 //                       ),
//                 //                     ),
//                 //                     // Row(
//                 //                     //   children: [
//                 //                     //     SeconderyCheckBox(
//                 //                     //       // value: watch.isVerifyChecked,
//                 //                     //       onChanged: (value) {
//                 //                     //         // read.onVerifyChecked(value);
//                 //                     //       },
//                 //                     //     ),
//                 //                     //   ],
//                 //                     // ),
//                 //                   ],
//                 //                 ),
//                 //               ),
//                 //             ));
//                 //     // Navigator.push(
//                 //     //   context,
//                 //     //   MaterialPageRoute(builder: (context) => SignUpView()),
//                 //     // );
//                 //   },
//                 //   child: Text(
//                 //     "Start a refund",
//                 //     style: TextStyle(
//                 //         color: Colors.white,
//                 //         // letterSpacing: .5,
//                 //         fontSize: 16.sp,
//                 //         fontWeight: FontWeight.w600),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 11.w,
//                 // ),

//                 SizedBox(
//                   height: 11.h,
//                 ),
//                 // PrimaryButton(
//                 //   // borderRadius: BorderRadius.circular(),
//                 //   borderRadius: 30,
//                 //   // width: ScreenUtil().screenWidth,
//                 //   color: Color(0xff4CDB06),
//                 //   onTap: () {
//                 //     showStepOneDialog(
//                 //         id: watch.orderFoodDetails?.orderId.toString());
//                 //     // showDialog(
//                 //     //     context: context,
//                 //     //     builder: (BuildContext context) => AlertDialog(
//                 //     //           shape: RoundedRectangleBorder(
//                 //     //               borderRadius:
//                 //     //                   BorderRadius.all(Radius.circular(15.0))),

//                 //     //           // insetPadding:
//                 //     //           //    EdgeInsets.all(0),
//                 //     //           contentPadding: EdgeInsets.only(top: 0.0),

//                 //     //           content: Container(
//                 //     //             width: ScreenUtil().screenWidth,
//                 //     //             height: 450.h,
//                 //     //             // padding:
//                 //     //             //     EdgeInsets.only(bottom: 10.w),
//                 //     //             child: Column(
//                 //     //               crossAxisAlignment: CrossAxisAlignment.center,
//                 //     //               children: [
//                 //     //                 Stack(
//                 //     //                   children: [
//                 //     //                     Container(
//                 //     //                       decoration: BoxDecoration(
//                 //     //                           borderRadius: BorderRadius.all(
//                 //     //                               Radius.circular(15.0))),
//                 //     //                       child: ClipRRect(
//                 //     //                         borderRadius: BorderRadius.circular(
//                 //     //                             15), // Image border
//                 //     //                         child: SizedBox.fromSize(
//                 //     //                           // size: Size.fromRadius(
//                 //     //                           //     10), // Image radius
//                 //     //                           child: Image(
//                 //     //                               image: AssetImage(
//                 //     //                                   "assets/images/green_pop_up.png")),
//                 //     //                         ),
//                 //     //                       ),

//                 //     //                       // Image(
//                 //     //                       //     image: AssetImage(
//                 //     //                       //         "assets/images/pop__new_.png")),
//                 //     //                     ),
//                 //     //                     Positioned(
//                 //     //                         top: 15,
//                 //     //                         right: 15,
//                 //     //                         // left: 0,
//                 //     //                         child: GestureDetector(
//                 //     //                           onTap: () {
//                 //     //                             Navigator.pop(context);
//                 //     //                           },
//                 //     //                           child: SvgPicture.asset(
//                 //     //                               "assets/icons/red_close.svg"),
//                 //     //                         )),
//                 //     //                     Positioned(
//                 //     //                         top: 25,
//                 //     //                         right: 135,
//                 //     //                         // left: 0,
//                 //     //                         child: SvgPicture.asset(
//                 //     //                             "assets/icons/ic_round-food-bank.svg")),
//                 //     //                     Positioned(
//                 //     //                       top: 80.w,
//                 //     //                       right: 80.w,
//                 //     //                       // left: 0,
//                 //     //                       child: Text(
//                 //     //                         "Subcription",
//                 //     //                         style: TextStyle(
//                 //     //                             color: Colors.black,
//                 //     //                             // letterSpacing: .5,
//                 //     //                             fontSize: 25.sp,
//                 //     //                             fontWeight: FontWeight.w700),
//                 //     //                       ),
//                 //     //                     )
//                 //     //                   ],
//                 //     //                 ),
//                 //     //                 SizedBox(
//                 //     //                   height: 38.h,
//                 //     //                 ),
//                 //     //                 Container(
//                 //     //                   child: Text(
//                 //     //                     "Renew Subcription",
//                 //     //                     style: TextStyle(
//                 //     //                         color: Colors.black,
//                 //     //                         // letterSpacing: .5,
//                 //     //                         fontSize: 17.sp,
//                 //     //                         fontWeight: FontWeight.w600),
//                 //     //                   ),
//                 //     //                 ),
//                 //     //                 SizedBox(
//                 //     //                   height: 10.h,
//                 //     //                 ),
//                 //     //                 Padding(
//                 //     //                   padding: EdgeInsets.only(
//                 //     //                       left: 20.0.w, right: 20.w),
//                 //     //                   child: SDropDownField(
//                 //     //                     // titleHeader: "*Patient Country",
//                 //     //                     onChanged: (value) {
//                 //     //                       // read.onSelectAccountType(value);
//                 //     //                     },
//                 //     //                     hint: "Your City",
//                 //     //                     items: [
//                 //     //                       DropdownMenuItem(
//                 //     //                         value: "current",
//                 //     //                         child: Text(
//                 //     //                           "Current",
//                 //     //                           style: TextStyle(
//                 //     //                             fontSize: 14.sp,
//                 //     //                           ),
//                 //     //                         ),
//                 //     //                       ),
//                 //     //                       DropdownMenuItem(
//                 //     //                         value: "saving",
//                 //     //                         child: Text(
//                 //     //                           "Saving",
//                 //     //                           style: TextStyle(
//                 //     //                             fontSize: 14.sp,
//                 //     //                           ),
//                 //     //                         ),
//                 //     //                       )
//                 //     //                     ],
//                 //     //                   ),
//                 //     //                 ),
//                 //     //                 SizedBox(
//                 //     //                   height: 20.h,
//                 //     //                 ),
//                 //     //                 Padding(
//                 //     //                   padding: EdgeInsets.only(
//                 //     //                       left: 20.0.w, right: 20.w),
//                 //     //                   child: SDropDownField(
//                 //     //                     // titleHeader: "*Patient Country",
//                 //     //                     onChanged: (value) {
//                 //     //                       // read.onSelectAccountType(value);
//                 //     //                     },
//                 //     //                     hint: "Your City",
//                 //     //                     items: [
//                 //     //                       DropdownMenuItem(
//                 //     //                         value: "current",
//                 //     //                         child: Text(
//                 //     //                           "Current",
//                 //     //                           style: TextStyle(
//                 //     //                             fontSize: 14.sp,
//                 //     //                           ),
//                 //     //                         ),
//                 //     //                       ),
//                 //     //                       DropdownMenuItem(
//                 //     //                         value: "saving",
//                 //     //                         child: Text(
//                 //     //                           "Saving",
//                 //     //                           style: TextStyle(
//                 //     //                             fontSize: 14.sp,
//                 //     //                           ),
//                 //     //                         ),
//                 //     //                       )
//                 //     //                     ],
//                 //     //                   ),
//                 //     //                 ),
//                 //     //                 SizedBox(
//                 //     //                   height: 20.h,
//                 //     //                 ),
//                 //     //                 Padding(
//                 //     //                   padding: EdgeInsets.only(
//                 //     //                       left: 20.0.w, right: 20.w),
//                 //     //                   child: SDropDownField(
//                 //     //                     // titleHeader: "*Patient Country",
//                 //     //                     onChanged: (value) {
//                 //     //                       // read.onSelectAccountType(value);
//                 //     //                     },
//                 //     //                     hint: "Your City",
//                 //     //                     items: [
//                 //     //                       DropdownMenuItem(
//                 //     //                         value: "current",
//                 //     //                         child: Text(
//                 //     //                           "Current",
//                 //     //                           style: TextStyle(
//                 //     //                             fontSize: 14.sp,
//                 //     //                           ),
//                 //     //                         ),
//                 //     //                       ),
//                 //     //                       DropdownMenuItem(
//                 //     //                         value: "saving",
//                 //     //                         child: Text(
//                 //     //                           "Saving",
//                 //     //                           style: TextStyle(
//                 //     //                             fontSize: 14.sp,
//                 //     //                           ),
//                 //     //                         ),
//                 //     //                       )
//                 //     //                     ],
//                 //     //                   ),
//                 //     //                 ),

//                 //     //                 SizedBox(
//                 //     //                   height: 30.h,
//                 //     //                 ),
//                 //     //                 Container(
//                 //     //                   padding: EdgeInsets.only(left: 18.0.w),
//                 //     //                   child: PrimaryButton(
//                 //     //                     // borderColor: Colors.black,
//                 //     //                     width: 250.w,
//                 //     //                     height: 45.w,

//                 //     //                     borderRadius: 30,

//                 //     //                     color: Color(0xff4CDB06),
//                 //     //                     // color: kDefaultActiveColor,
//                 //     //                     onTap: () {
//                 //     //                       Navigator.pop(context);

//                 //     //                       // Navigator.push(
//                 //     //                       //   context,
//                 //     //                       //   MaterialPageRoute(builder: (context) => SignUpView()),
//                 //     //                       // );
//                 //     //                     },
//                 //     //                     child: Text(
//                 //     //                       "Step 2: Payment",
//                 //     //                       style: TextStyle(
//                 //     //                           color: Colors.black,
//                 //     //                           // letterSpacing: .5,
//                 //     //                           fontSize: 16.sp,
//                 //     //                           fontWeight: FontWeight.w600),
//                 //     //                     ),
//                 //     //                   ),
//                 //     //                 ),
//                 //     //                 // Row(
//                 //     //                 //   children: [
//                 //     //                 //     SeconderyCheckBox(
//                 //     //                 //       // value: watch.isVerifyChecked,
//                 //     //                 //       onChanged: (value) {
//                 //     //                 //         // read.onVerifyChecked(value);
//                 //     //                 //       },
//                 //     //                 //     ),
//                 //     //                 //   ],
//                 //     //                 // ),
//                 //     //               ],
//                 //     //             ),
//                 //     //           ),
//                 //     //         ));
//                 //     // Navigator.push(
//                 //     //   context,
//                 //     //   MaterialPageRoute(builder: (context) => SignUpView()),
//                 //     // );
//                 //   },
//                 //   child: Text(
//                 //     "Renew Subcription",
//                 //     style: TextStyle(
//                 //         color: Colors.white,
//                 //         // letterSpacing: .5,
//                 //         fontSize: 16.sp,
//                 //         fontWeight: FontWeight.w600),
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 100.w,
//           ),
//         ],
//       ),
//     );
//   }
// }

