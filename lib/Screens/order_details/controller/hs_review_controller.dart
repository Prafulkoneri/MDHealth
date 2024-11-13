// FoodAddReviewNewPopUpRepo foodAddReviewNewPopUpRepo =
//       FoodAddReviewNewPopUpRepo();
//   double? foodRecommanded;

//   void onTapFoodRecommanded(value) {
//     foodRecommanded = value;
//     notifyListeners();
//   }

//   FoodAddReviewNewRequestModel get foodAddReviewNewRequestModel =>
//       FoodAddReviewNewRequestModel(
//           recommendation: foodRecommanded.toString(),
//           rating: foodReview.toString(),
//           productId: productId,
//           feedback: foodFeedBackController.text,
//           orderId: orderId);
//   Future<void> foodAddReview(context, od, pId, fFeed, fR, fRc) async {
//     // showLoader(true);
//     orderId = od;
//     productId = pId;
//     foodFeedBackController.text = fFeed;
//     foodReview = fR;
//     foodRecommanded = fRc;

//     LoadingOverlay.of(context).show();

//     // type = tp;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     foodAddReviewNewPopUpRepo
//         .writeFoodReview(
//             foodAddReviewNewRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result =
//           FoodAddReviewNewResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         Navigator.pop(context);

//         showDialog(
//             context: context,
//             builder: (BuildContext context) => AlertDialog(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(15.0))),

//                   // insetPadding:
//                   //    EdgeInsets.all(0),
//                   contentPadding: EdgeInsets.only(top: 0.0),

//                   content: Container(
//                     width: ScreenUtil().screenWidth,
//                     height: 350.h,
//                     // padding:
//                     //     EdgeInsets.only(bottom: 10.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(15.0))),
//                               child: ClipRRect(
//                                 borderRadius:
//                                     BorderRadius.circular(15), // Image border
//                                 child: SizedBox.fromSize(
//                                   // size: Size.fromRadius(
//                                   //     10), // Image radius
//                                   child: Image(
//                                       image: AssetImage(
//                                           "assets/images/green_pop_up.png")),
//                                 ),
//                               ),

//                               // Image(
//                               //     image: AssetImage(
//                               //         "assets/images/pop__new_.png")),
//                             ),
//                             Positioned(
//                                 top: 15,
//                                 right: 0,
//                                 left: 0,
//                                 child: Column(
//                                   children: [
//                                     SvgPicture.asset(
//                                         "assets/icons/happy_pop_up.svg"),
//                                     // Text(
//                                     //   "Delete",
//                                     //   style: TextStyle(
//                                     //       color: Colors.white,
//                                     //       // letterSpacing: .5,
//                                     //       fontSize: 30.sp,
//                                     //       fontWeight: FontWeight.w700),
//                                     // ),
//                                     SizedBox(
//                                       height: 10.w,
//                                     ),
//                                     RichText(
//                                       text: TextSpan(
//                                         text: 'Thank',
//                                         style: TextStyle(
//                                             letterSpacing: -1,
//                                             fontFamily: 'Campton',
//                                             color: Colors.white,
//                                             fontSize: 30.sp,
//                                             fontWeight: FontWeight.w700),

//                                         /*defining default style is optional */
//                                         children: <TextSpan>[
//                                           TextSpan(
//                                             text: ' You!',
//                                             style: TextStyle(
//                                                 letterSpacing: -1,
//                                                 fontFamily: 'Campton',
//                                                 color: Colors.black,
//                                                 fontSize: 30.sp,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 )),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 38.h,
//                         ),
//                         Text(
//                           "Thank you for your review.",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.black,
//                               letterSpacing: -1,
//                               fontFamily: 'Campton',
//                               fontSize: 21.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             text: 'The reward will be credited to your\n',
//                             style: TextStyle(
//                                 letterSpacing: -1,
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w400),
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: 'MD',
//                                 style: TextStyle(
//                                     letterSpacing: -1,
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 17.sp,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               TextSpan(
//                                 text: 'Coin account as soon as possible.',
//                                 style: TextStyle(
//                                     letterSpacing: -1,
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 48.h,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(left: 22.w, right: 21.w),
//                           child: PrimaryButton(
//                             // width:
//                             //     125.w,
//                             // height:
//                             //     35.w,
//                             // borderRadius: BorderRadius.circular(),
//                             borderRadius: 25,
//                             // width: ScreenUtil().screenWidth,
//                             color: Color(0xff4CDB06),
//                             onTap: () {
//                               // Navigator.pop(this.context);
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               "Done",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   letterSpacing: -1,
//                                   fontFamily: 'Campton',
//                                   fontSize: 16.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ));
//         LoadingOverlay.of(context).hide();
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }