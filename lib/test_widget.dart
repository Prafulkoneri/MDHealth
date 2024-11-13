import 'package:flutter/material.dart';

enum SlideDirection { left, right }

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final SlideDirection direction;
  final Duration delay;

  SlidePageRoute({
    required this.page,
    this.direction = SlideDirection.right,
    this.delay = const Duration(milliseconds: 5000),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = direction == SlideDirection.right
                ? Offset(1.0, 0.0) // Slide in from the right
                : Offset(-1.0, 0.0); // Slide in from the left

            const end = Offset.zero;
            var curveTween = CurveTween(curve: Curves.easeInOutCubicEmphasized);

            var offsetAnimation = Tween(begin: begin, end: end)
                .chain(curveTween)
                .animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

// import 'dart:developer';
// import 'dart:math' as math;
// import 'package:awesome_card/awesome_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/payment/controller/payment_controller.dart';
// import 'package:md_health/Screens/payment/view/Payment_processing_view.dart';
// import 'package:md_health/Screens/payment_details/view/payment_details_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/loader.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';
// // import 'package:flutter_credit_card/flutter_credit_card.dart';

// class PaymentView extends StatefulWidget {
//   final String? packageId;
//   final String? percetagePrise;
//   final String? percetage;
//   final String? price;
//   final List<String>? selectedNames; // Add this parameter

//   const PaymentView({
//     super.key,
//     this.packageId,
//     this.price,
//     this.percetagePrise,
//     this.percetage,
//     this.selectedNames,
//   });

//   @override
//   State<PaymentView> createState() => _PaymentViewState();
// }

// class _PaymentViewState extends State<PaymentView> {
//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       // log(widget.packageId ?? '');
//       context.read<PaymentController>().initState(
//           context,
//           widget.packageId,
//           widget.price,
//           widget.percetagePrise,
//           widget.percetage,
//           widget.selectedNames);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<PaymentController>();
//     final watch = context.watch<PaymentController>();
//     return BaseScreen(
//         backgroundColor: Colors.white,
//         appBar: CustomAppBar(
//           onBackPressed: () {
//             Navigator.push(
//               context,
//               SlidePageRoute(
//                 page: PaymentDetailsView(
//                   packageId: watch.packageId.toString(),
//                   // price: watch.salePrice,
//                 ),
//                 direction:
//                     SlideDirection.right, // Specify the slide direction here
//                 delay: Duration(milliseconds: 5000),
//               ),
//               // MaterialPageRoute(
//               //     builder: (context) => SearchDetailsView(
//               //           packageId: watch.packageId,
//               //         ))
//             );
//             // Navigator.pushReplacement(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (context) => PaymentDetailsView(
//             //               packageId: watch.packageId,
//             //             )));
//           },
//           hasBackButton: true,
//           hasMdTitle: false,
//           // drawerTitle: "Orders",
//         ),
//         content:
//             //  watch.isLoading
//             //     ? Container(
//             //         height: ScreenUtil().screenHeight, child: const Loader())
//             //     :
//             Builder(builder: (context) {
//           return SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 28.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "PAYMENT",
//                       style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: kDefaultActiveColor,
//                         fontSize: 29.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 21.h,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 10.w, right: 10.w),
//                   decoration: BoxDecoration(
//                       // color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 230, 230, 230)
//                               .withOpacity(0.60),
//                           offset: Offset(2, 2),
//                           blurRadius: 10.0,
//                         ),
//                       ]),
//                   child: Card(
//                     elevation: 2.0,
//                     color: Color.fromARGB(255, 255, 254, 254),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 18.w, top: 21.w, right: 20.w),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 5.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "${watch.purchaseDetailsDataLast?.treatmentName}",
//                                     style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Text(
//                                     "${watch.purchaseDetailsDataLast?.treatmentPrice}",
//                                     style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 child: ListView.builder(
//                                   padding: EdgeInsets.zero,
//                                   shrinkWrap: true,
//                                   itemCount: watch.otherServices?.length ?? 0,
//                                   itemBuilder: (context, index) {
//                                     final element = watch.otherServices?[index];
//                                     return Container(
//                                         child: Row(
//                                       children: [
//                                         Text(
//                                           "${element?.title}",
//                                           style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: kDefaultActiveColor,
//                                             fontSize: 19.sp,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Text(
//                                           "${element?.pricePercentage}",
//                                           style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: kDefaultActiveColor,
//                                             fontSize: 19.sp,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ],
//                                     ));
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 31.h,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xffF1F1F1),
//                             borderRadius: BorderRadius.vertical(
//                               bottom: Radius.circular(20.0),
//                             ),
//                           ),
//                           // width: 400.w,
//                           height: 61.w,
//                           child: Padding(
//                             padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Total Payment",
//                                   style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: kDefaultActiveColor,
//                                     fontSize: 19,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "${widget.percetagePrise}",
//                                       style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: black,
//                                         fontSize: 26,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     Text(
//                                       "${widget.percetage} of the amount",
//                                       style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 21.h,
//                 ),

//                 Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(left: 10.w, right: 10.w),
//                       child: CreditCard(
//                         cardNumber: watch.cardNumber,
//                         cardExpiry: watch.expiryDate,
//                         cardHolderName: watch.cardHolderName,
//                         cvv: watch.cvv,
//                         bankName: 'Axis Bank',
//                         showBackSide: watch.showBack,
//                         frontBackground: CardBackgrounds.black,
//                         backBackground: CardBackgrounds.white,
//                         showShadow: true,
//                         // mask: getCardTypeMask(cardType: CardType.americanExpress),
//                       ),

//                       // Card(
//                       //   elevation: 5.0,
//                       //   // color: Color.fromARGB(255, 7, 4, 4),
//                       //   shape: RoundedRectangleBorder(
//                       //     borderRadius: BorderRadius.circular(10.0),
//                       //   ),
//                       //   child: Column(
//                       //     children: [
//                       //       Container(
//                       //         margin: EdgeInsets.only(
//                       //             left: 19.w, right: 19.w, top: 19.w),
//                       //         padding: EdgeInsets.only(
//                       //             left: 30.w, right: 34.w, top: 33.w),
//                       //         decoration: BoxDecoration(
//                       //             color: black,
//                       //             borderRadius: BorderRadius.circular(10)),
//                       //         child: Column(
//                       //           crossAxisAlignment: CrossAxisAlignment.start,
//                       //           children: [
//                       //             Image.asset(
//                       //               "assets/images/mdd.png",
//                       //               width: 111.w,
//                       //               height: 21.h,
//                       //             ),
//                       //             SizedBox(
//                       //               height: 63.h,
//                       //             ),
//                       //             Text(
//                       //               "1234 1234 1234 1234",
//                       //               style: TextStyle(
//                       //                   color: Colors.white,
//                       //                   // letterSpacing: .5,
//                       //                   fontSize: 20.sp,
//                       //                   fontWeight: FontWeight.w500),
//                       //             ),
//                       //             Text(
//                       //               "John Smith",
//                       //               style: TextStyle(
//                       //                   color: Colors.white,
//                       //                   // letterSpacing: .5,
//                       //                   fontSize: 14.sp,
//                       //                   fontWeight: FontWeight.w500),
//                       //             ),
//                       //             Row(
//                       //               mainAxisAlignment:
//                       //                   MainAxisAlignment.spaceBetween,
//                       //               children: [
//                       //                 Text(
//                       //                   "02 / 24",
//                       //                   style: TextStyle(
//                       //                       color: Colors.white,
//                       //                       // letterSpacing: .5,
//                       //                       fontSize: 14.sp,
//                       //                       fontWeight: FontWeight.w500),
//                       //                 ),
//                       //                 Image.asset(
//                       //                   "assets/images/ri_visa-line.png",
//                       //                   width: 51.w,
//                       //                   height: 51.h,
//                       //                 ),
//                       //               ],
//                       //             ),
//                       //           ],
//                       //         ),
//                       //       ),
//                       //       Padding(
//                       //         padding: EdgeInsets.only(
//                       //             left: 20.0.w, top: 25.w, right: 20.w),
//                       //         child: PrimaryInformationTextFormField(
//                       //           controller: watch.cardNameController,
//                       //           borderColor: Colors.grey,
//                       //           // color: Colors.red,
//                       //           // width: 48.w,
//                       //           // titleHeader: "*Patient Contact Number",
//                       //           hintText: "Name",
//                       //         ),
//                       //       ),
//                       //       SizedBox(
//                       //         height: 20.h,
//                       //       ),
//                       //       Padding(
//                       //         padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                       //         child: PrimaryInformationTextFormField(
//                       //           controller: watch.cardNumberController,
//                       //           borderColor: Colors.grey,
//                       //           // color: Colors.red,
//                       //           // width: 48.w,
//                       //           // titleHeader: "*Patient Contact Number",
//                       //           hintText: "Card Number",
//                       //         ),
//                       //       ),
//                       //       SizedBox(
//                       //         height: 20.h,
//                       //       ),
//                       //       Padding(
//                       //         padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                       //         child: PrimaryInformationTextFormField(
//                       //           controller: watch.cartDateController,
//                       //           borderColor: Colors.grey,
//                       //           // color: Colors.red,
//                       //           // width: 48.w,
//                       //           // titleHeader: "*Patient Contact Number",
//                       //           hintText: "Date",
//                       //         ),
//                       //       ),
//                       //       SizedBox(
//                       //         height: 34.h,
//                       //       ),
//                       //       PrimaryButton(
//                       //         height: 40.h,
//                       //         width: 310.w,
//                       //         // borderRadius: BorderRadius.circular(),
//                       //         borderRadius: 30,
//                       //         // width: ScreenUtil().screenWidth,
//                       //         color: Color(0xff4CDB06),
//                       //         onTap: () {
//                       //           read.paymentDone(context);
//                       //           Navigator.push(
//                       //             context,
//                       //             MaterialPageRoute(
//                       //                 builder: (context) =>
//                       //                     PaymentProcessingView()),
//                       //           );
//                       //         },
//                       //         child: Text(
//                       //           "Proceed Payment",
//                       //           style: TextStyle(
//                       //               color: Colors.black,
//                       //               // letterSpacing: .5,
//                       //               fontSize: 16.sp,
//                       //               fontWeight: FontWeight.w600),
//                       //         ),
//                       //       ),
//                       //       // Container(
//                       //       //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                       //       //   child: Column(
//                       //       //     crossAxisAlignment: CrossAxisAlignment.start,
//                       //       //     children: [
//                       //       //       SizedBox(
//                       //       //         height: 30.h,
//                       //       //       ),

//                       //       //     ],
//                       //       //   ),
//                       //       // ),
//                       //       SizedBox(
//                       //         height: 31.h,
//                       //       )
//                       //     ],
//                       //   ),
//                       // ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: TextFormField(
//                             controller: watch.cardNameController,
//                             decoration:
//                                 InputDecoration(hintText: 'Card Number'),
//                             maxLength: 16,
//                             onChanged: (value) {
//                               final newCardNumber = value.trim();
//                               var newStr = '';
//                               final step = 4;

//                               for (var i = 0;
//                                   i < newCardNumber.length;
//                                   i += step) {
//                                 newStr += newCardNumber.substring(i,
//                                     math.min(i + step, newCardNumber.length));
//                                 if (i + step < newCardNumber.length)
//                                   newStr += ' ';
//                               }

//                               setState(() {
//                                 watch.cardNumber = newStr;
//                               });
//                             },
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: TextFormField(
//                             controller: watch.cardExpireDarteController,
//                             decoration:
//                                 InputDecoration(hintText: 'Card Expiry'),
//                             maxLength: 5,
//                             onChanged: (value) {
//                               var newDateValue = value.trim();
//                               final isPressingBackspace =
//                                   watch.expiryDate.length > newDateValue.length;
//                               final containsSlash = newDateValue.contains('/');

//                               if (newDateValue.length >= 2 &&
//                                   !containsSlash &&
//                                   !isPressingBackspace) {
//                                 newDateValue = newDateValue.substring(0, 2) +
//                                     '/' +
//                                     newDateValue.substring(2);
//                               }
//                               watch.updateCardExpireDate(value);
//                             },
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: TextFormField(
//                             decoration:
//                                 InputDecoration(hintText: 'Card Holder Name'),
//                             onChanged: (value) {
//                               watch.updateCardName(value);
//                             },
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 25),
//                           child: TextFormField(
//                             decoration: InputDecoration(hintText: 'CVV'),
//                             maxLength: 3,
//                             onChanged: (value) {
//                               watch.updateCVV(value);
//                             },
//                             focusNode: watch.cvvFocusNode,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),

//                 // Container(
//                 //   padding: EdgeInsets.only(left: 10.w, right: 10.w),
//                 //   child: Stack(
//                 //     children: [
//                 //       Card(
//                 // elevation: 5.0,
//                 // color: Color.fromARGB(255, 7, 4, 4),
//                 // shape: RoundedRectangleBorder(
//                 //   borderRadius: BorderRadius.circular(20.0),
//                 // ),
//                 //         child: Column(
//                 //           children: [
//                 //             SizedBox(
//                 //               height: 31.h,
//                 //             ),
//                 //             Container(
//                 //                 padding: EdgeInsets.only(left: 19.w, right: 19.w),
//                 //                 child:
//                 //                     Image.asset("assets/images/credit_card.png")),
//                 //             SizedBox(
//                 //               height: 20.h,
//                 //             ),
//                 // Padding(
//                 //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                 //   child: PrimaryInformationTextFormField(
//                 //     borderColor: kDefaultActiveColor,
//                 //     // color: Colors.red,
//                 //     // width: 48.w,
//                 //     // titleHeader: "*Patient Contact Number",
//                 //     hintText: "Name",
//                 //   ),
//                 // ),
//                 //             SizedBox(
//                 //               height: 20.h,
//                 //             ),
//                 //             Padding(
//                 //               padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                 //               child: PrimaryInformationTextFormField(
//                 //                 borderColor: kDefaultActiveColor,
//                 //                 // color: Colors.red,
//                 //                 // width: 48.w,
//                 //                 // titleHeader: "*Patient Contact Number",
//                 //                 hintText: "Card Number",
//                 //               ),
//                 //             ),
//                 //             SizedBox(
//                 //               height: 38.h,
//                 //             ),
//                 //             Container(
//                 //               padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                 //               child: Column(
//                 //                 crossAxisAlignment: CrossAxisAlignment.start,
//                 //                 children: [
//                 //                   SizedBox(
//                 //                     height: 30.h,
//                 //                   ),
//                 //                   PrimaryButton(
//                 //                     // borderRadius: BorderRadius.circular(),
//                 //                     borderRadius: 30,
//                 //                     // width: ScreenUtil().screenWidth,
//                 //                     color: Color(0xff4CDB06),
//                 //                     onTap: () {
//                 //                       Navigator.push(
//                 //                         context,
//                 //                         MaterialPageRoute(
//                 //                             builder: (context) =>
//                 //                                 PaymentProcessingView()),
//                 //                       );
//                 //                     },
//                 //                     child: Text(
//                 //                       "Proceed Payment",
//                 //                       style: TextStyle(
//                 //                           color: Colors.black,
//                 //                           // letterSpacing: .5,
//                 //                           fontSize: 16.sp,
//                 //                           fontWeight: FontWeight.w600),
//                 //                     ),
//                 //                   ),
//                 //                 ],
//                 //               ),
//                 //             ),
//                 //             SizedBox(
//                 //               height: 100.h,
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //       Positioned(
//                 //         top: 60,
//                 //         left: 30,
//                 // child: Image.asset(
//                 //   "assets/images/mdd.png",
//                 //   width: 111.w,
//                 //   height: 21.h,
//                 // ),
//                 //       ),
//                 //       Positioned(
//                 //         top: 150,
//                 //         left: 40,
//                 // child: Text(
//                 //   "1234 1234 1234 1234",
//                 //   style: TextStyle(
//                 //       color: Colors.white,
//                 //       // letterSpacing: .5,
//                 //       fontSize: 20.sp,
//                 //       fontWeight: FontWeight.w500),
//                 // ),
//                 //       ),
//                 //       Positioned(
//                 //           top: 160,
//                 //           left: 40,
//                 //           child: Row(
//                 //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //             children: [
//                 // Text(
//                 //   "02 / 24",
//                 //   style: TextStyle(
//                 //       color: Colors.white,
//                 //       // letterSpacing: .5,
//                 //       fontSize: 14.sp,
//                 //       fontWeight: FontWeight.w500),
//                 // ),
//                 // Image.asset(
//                 //   "assets/images/ri_visa-line.png",
//                 //   width: 51.w,
//                 //   height: 51.h,
//                 // ),
//                 //             ],
//                 //           )),
//                 //     ],
//                 //   ),
//                 // )
//                 SizedBox(
//                   height: 100.h,
//                 )
//               ],
//             ),
//           );
//         }));
//   }
// }
