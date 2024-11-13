// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/hotel/view/hotel_review.dart';
// import 'package:md_health/Screens/hotel/view/hotel_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/base_screen.dart';

// class HotelDetails extends StatelessWidget {
//   const HotelDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> list = [
//       {"title": 'Breakfast & Dinner', "icon": 'assets/icons/Vector_5.svg'},
//       {"title": 'Sauna & Spa', "icon": 'assets/icons/map_spa.svg'},
//       {"title": 'No Smoking', "icon": 'assets/icons/Vector_6.svg'},
//       {"title": 'Wi-Fi', "icon": 'assets/icons/logos_wifi.svg'},
//       {"title": 'Fitness Center', "icon": 'assets/icons/Group_11.svg'},
//     ];

//     return BaseScreen(
//       onWillPop: () async {
//         return false;
//       },
//       appBar: HotelAppBar(),
//       backgroundColor: Colors.white,
//       content: Container(
//         margin: EdgeInsets.only(top: 20.h, right: 7.w, left: 7.w),
//         child: Card(
//           elevation: 2,
//           child: Padding(
//             padding: EdgeInsets.all(10.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(0),
//                       child: Text(
//                         'Renaissence Bosphorus Hotel',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'Campton',
//                             // letterSpacing: -1,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     Card(
//                       color: kDefaultActiveColor,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 1.5.h, horizontal: 8.w),
//                         child: Text(
//                           '4.9',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Campton',
//                               // letterSpacing: -1,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Row(
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/mdi_location.svg',
//                           height: 17.h,
//                           width: 17.w,
//                         ),
//                         SizedBox(
//                           width: 2.w,
//                         ),
//                         RichText(
//                           text: TextSpan(
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontFamily: 'Campton',
//                                   letterSpacing: -1,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w400),
//                               children: [
//                                 TextSpan(text: 'Distance to hospital '),
//                                 TextSpan(
//                                     text: '3.7 KM',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 16.sp))
//                               ]),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     Row(
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/Vector_4.svg',
//                           height: 11.25.h,
//                           width: 12.w,
//                         ),
//                         SizedBox(
//                           width: 2.w,
//                         ),
//                         RichText(
//                           text: TextSpan(
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontFamily: 'Campton',
//                                   letterSpacing: -1,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w400),
//                               children: [TextSpan(text: '4 Stars Hotel ')]),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(vertical: 15.h),
//                           child: Image.asset(
//                             'assets/images/Rectangle_233.png',
//                             height: 122.h,
//                             width: MediaQuery.of(context).size.width * 0.5,
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(left: 15),
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => HotelReview()));
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     const Text(
//                                       "Reviews",
//                                       style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: kDefaultActiveColor,
//                                         fontSize: 19,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 2.w,
//                                     ),
//                                     Text(
//                                       "(480)",
//                                       style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 2.5.h,
//                                 ),
//                                 StarRating(
//                                   numberOfStars: 5,
//                                 ),
//                                 SizedBox(
//                                   height: 2.5.h,
//                                 ),
//                                 Text(
//                                   'Excellent',
//                                   style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       "Per Night Price",
//                       style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: kDefaultActiveColor,
//                         fontSize: 11.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       "34.000,00 ₺",
//                       style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         fontSize: 19.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25.h,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Hotel Details',
//                           style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: kDefaultActiveColor,
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         Text(
//                           'Everything Included',
//                           style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: Colors.black,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: list.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return HotelincludedList(
//                               text: list[index]['title'],
//                               icon: list[index]['icon'],
//                             );
//                           },
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         Container(
//                           child: Column(
//                             children: [
//                               Text(
//                                 'Gallery',
//                                 style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: kDefaultActiveColor,
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: double.infinity,
//                                 height: 130,
//                                 child: GridView.builder(
//                                   itemCount: 10,
//                                   padding: EdgeInsets.zero,
//                                   scrollDirection: Axis.horizontal,
//                                   physics: BouncingScrollPhysics(),
//                                   shrinkWrap: true,
//                                   gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                           // maxCrossAxisExtent: 200,
//                                           crossAxisCount: 2,
//                                           crossAxisSpacing: 5,
//                                           childAspectRatio: 0.6,
//                                           mainAxisSpacing: 5),
//                                   itemBuilder: (context, index) {
//                                     return GestureDetector(
//                                       onTap: () => showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) =>
//                                               Scaffold(
//                                                 backgroundColor:
//                                                     Colors.transparent,
//                                                 body: Align(
//                                                   alignment: Alignment.center,
//                                                   child: Container(
//                                                     // color: Colors.blueAccent,
//                                                     height: 300.h,
//                                                     child: Stack(
//                                                       children: [
//                                                         Positioned(
//                                                           right: 0,
//                                                           left: 0,
//                                                           child: Container(
//                                                             // color: Colors.blue,
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     top: 40),
//                                                             child: Image.asset(
//                                                                 'assets/images/Rectangle 559.png',
//                                                                 height: 200.h,
//                                                                 width: 300
//                                                                     .w // Adjust the fit as needed
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                         Positioned(
//                                                             top: 0,
//                                                             right: 40,
//                                                             child:
//                                                                 GestureDetector(
//                                                                     onTap: () =>
//                                                                         Navigator.pop(
//                                                                             context),
//                                                                     child: SvgPicture
//                                                                         .asset(
//                                                                       'assets/icons/CloseSquare.svg',
//                                                                       height:
//                                                                           30.h,
//                                                                       width:
//                                                                           30.w,
//                                                                     )))
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )),
//                                       child: Image.asset(
//                                         'assets/images/Rectangle_556.png',
//                                         height: 50,
//                                         width: 70,
//                                         fit: BoxFit
//                                             .fill, // Adjust the fit as needed
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Text(
//                           'Overview',
//                           style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: kDefaultActiveColor,
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         Text('************ Hospital is a family owned business and Trudi Scrivener, the founder is Buckinghamshire based, Trudi has over 30 years of care experience and provides a key leadership role to her team.' +
//                             'Ashridge Home Care provide a multi award winning specialist live in care or hourly care service, depending on the needs of the client. Most people want to stay in their own home, and having a carer either living in or visiting from time to time means choosing to enjoy life on your own terms and being able to maintain your independence. Staff pride themselves on delivering quality person-centred care with compassion, choice, dignity and respect.' +
//                             'Their ethos is based purely on happy and healthy lifestyles. ********** Hospital offers care tailored to suit the individual, taking into account the things that are important to the client, like family, interests, pets or the garden. This ethos applies to both the care provided to clients and also the support given to staff.Having a live-in carer removes all the unnecessary upheaval of leaving home to go to the unfamiliar surroundings or a nursing home.')
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HotelincludedList extends StatelessWidget {
//   final String text;
//   final String icon;

//   const HotelincludedList({super.key, required this.text, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 5.h),
//       child: Row(
//         children: [
//           SvgPicture.asset(icon),
//           SizedBox(
//             width: 5.w,
//           ),
//           Text(text,
//               style: TextStyle(
//                 fontFamily: 'Campton',
//                 color: Colors.black,
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//               ))
//         ],
//       ),
//     );
//   }
// }

// class HotelAppBar extends StatelessWidget implements PreferredSizeWidget {
//   // final VoidCallback onBackTap;

//   HotelAppBar({
//     super.key,
//   });

//   @override
//   final Size preferredSize = Size.fromHeight(120.h);
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(120),
//       child: Stack(children: [
//         Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/layer_blur.png'),
//                   fit: BoxFit.cover)),
//         ),
//         Padding(
//           padding: EdgeInsets.only(top: 50.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 // color: Colors.black,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 27),
//                       child: SvgPicture.asset(
//                         'assets/icons/3_lines.svg',
//                         alignment: Alignment.topLeft,
//                       ),
//                     ),
//                     Column(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           // color: Colors.red,
//                           padding: EdgeInsets.only(bottom: 8.h),
//                           child: Image.asset(
//                             'assets/images/katman_1.png',
//                             height: 33.h,
//                             width: 43.42.w,
//                             fit: BoxFit.fitWidth,
//                           ),
//                         ),
//                         Text(
//                           'powered by',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Campton',
//                               fontSize: 14.sp,
//                               letterSpacing: -1,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         RichText(
//                             text: TextSpan(
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Campton',
//                                     fontSize: 22.sp,
//                                     letterSpacing: -1,
//                                     fontWeight: FontWeight.w400),
//                                 children: [
//                               const TextSpan(
//                                   text: 'MD',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.w700)),
//                               const TextSpan(text: 'booking')
//                             ]))
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 30),
//                       child: SvgPicture.asset(
//                         'assets/icons/box.svg',
//                         alignment: Alignment.topRight,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 10,
//           left: 0,
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => HotelView()));
//             },
//             child: Container(
//               padding: EdgeInsets.only(left: 17.w),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/icons/backicon.svg',
//                     // alignment: Alignment.topRight,
//                   ),
//                   SizedBox(
//                     width: 2.w,
//                   ),
//                   Text(
//                     "Back",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Campton',
//                         fontSize: 18.sp,
//                         letterSpacing: -1,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }

// class StarRating extends StatelessWidget {
//   final int numberOfStars;
//   final int totalStars;

//   const StarRating({
//     Key? key,
//     required this.numberOfStars,
//     this.totalStars = 5,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(
//         totalStars,
//         (index) {
//           if (index < numberOfStars) {
//             return Padding(
//               padding: EdgeInsets.only(right: 5.w),
//               child: SvgPicture.asset(
//                 'assets/icons/Vector_4.svg',
//                 color: kDefaultActiveColor,
//                 height: 15.h,
//                 width: 15.w,
//               ),
//             );
//           } else {
//             return Padding(
//               padding: EdgeInsets.only(right: 5.w),
//               child: SvgPicture.asset(
//                 'assets/icons/Vector_4.svg',
//                 color: Colors.grey, // Grey color for inactive stars
//                 height: 15.h,
//                 width: 15.w,
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
