import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:md_health/Screens/discover/view/discover_view.dart';
// import 'package:md_health/Screens/md_shop_home_page/controller/md_shop_home_page_controller.dart';
import 'package:md_health/Screens/shop/shop_product_view/controller/s_product_view_controller.dart';
import 'package:md_health/Screens/shop/shop_product_view/view/shop_product_view.dart';
import 'package:md_health/Screens/shop/shop_vendors/controller/shop_vendor_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewAllMdShopHomePageView extends StatefulWidget {
  final String? vendorId;
  final String? pId;
  const ViewAllMdShopHomePageView(
      {super.key, required this.vendorId, required this.pId});

  @override
  State<ViewAllMdShopHomePageView> createState() =>
      _ViewAllMdShopHomePageViewState();
}

class _ViewAllMdShopHomePageViewState extends State<ViewAllMdShopHomePageView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .read<ShopVendorListCOntroller>()
          .initState(context, widget.vendorId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ShopVendorListCOntroller>();
    final watch = context.watch<ShopVendorListCOntroller>();
    final readp = context.read<ProductViewController>();

    return BaseScreen(
      onWillPop: () async {
        Navigator.push(
            context,
            SlidePageRoute(
                page: ShopProductView(
                  id: widget.pId,
                ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: Duration(milliseconds: 5000)));

        // Navigator.pushReplacement(
        //   context,
        //   SlidePageRoute(
        //     page: DiscoverView(
        //         // type: widget.type,
        //         // purchesId: watch.purchesId,
        //         // packageId: watch.packageId,
        //         ),
        //     direction: SlideDirection.left, // Specify the slide direction here
        //     delay: Duration(milliseconds: 5000),
        //   ),
        // );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppBar(
        // hasCartIcon: true,
        mdTitle: "shop",
        hasHiText: true,
        hasBackButton: true,
        onBackPressed: () {
          Navigator.push(
              context,
              SlidePageRoute(
                  page: ShopProductView(
                    id: widget.pId,
                  ),
                  direction:
                      SlideDirection.left, // Specify the slide direction here
                  delay: Duration(milliseconds: 5000)));
        },
        // hasMdTitle: true,
        // drawerTitle: "Orders",
      ),
      content: Column(
        children: [
          // Container(
          //   margin:
          //       EdgeInsets.only(top: 25.w, right: 9.w, bottom: 5.w, left: 10.w),
          //   child: GridView.builder(
          //     shrinkWrap: true,

          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: watch.productData?.length ?? 0,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         childAspectRatio: (1.0.w / 1.6.w),
          //         crossAxisSpacing: 5.0,
          //         mainAxisSpacing: 5.0),
          //     // padding: EdgeInsets.all(8.0), // padding around the grid

          //     itemBuilder: (context, index) {
          //       final element = watch.productData?[index];
          //       return GestureDetector(
          //         onTap: () async {
          //           // SharedPreferences pref =
          //           //     await SharedPreferences.getInstance();
          //           // if (pref.getString("status") == "guestLoggedIn") {
          //           //   Utils.showLogdinDialog(
          //           //       context, "Please Login to continue");
          //           //   return;
          //           // }
          //           Navigator.push(
          //             context,
          //             SlidePageRoute(
          //               page: ShopProductView(
          //                 id: element?.id.toString() ?? '',
          //               ),
          //               direction: SlideDirection.right,
          //               delay: Duration(milliseconds: 5000),
          //             ),
          //           );
          //           // Navigator.push(
          //           //   context,
          //           //   SlidePageRoute(
          //           //     page: ShopProductView(id: element?.id.toString()),
          //           //     direction: SlideDirection.right,
          //           //     delay: Duration(milliseconds: 5000),
          //           //   ),
          //           //   // MaterialPageRoute(
          //           //   //     builder: (context) => ShopProductView()),
          //           // );
          //         },
          //         child: Container(
          //           child: Card(
          //             // elevation: 5,
          //             shape: RoundedRectangleBorder(
          //                 // borderRadius: BorderRadius.circular(15.0),
          //                 ),
          //             child: Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(10),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: Colors.black.withOpacity(0.10),
          //                       // offset: Offset(2, 2),
          //                       blurRadius: 50,
          //                     ),
          //                   ]),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Container(
          //                     margin: EdgeInsets.only(
          //                         // top: 7.w,
          //                         right: 10.w,
          //                         // bottom: 5.w,
          //                         left: 18.w),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       children: [
          //                         SizedBox(
          //                           height: 10.w,
          //                         ),
          //                         // element?.productImage == ""
          //                         //     ? SizedBox(
          //                         //   child: Image.asset(
          //                         //     "assets/images/image 54.png",
          //                         //     fit: BoxFit.fill,
          //                         //     width: 107.w,
          //                         //     height: 107.h,
          //                         //   ),
          //                         // )
          //                         //     :
          //                         Row(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             SizedBox(
          //                               child: AppNetworkImages(
          //                                 imageUrl: "${element?.imagePath}",
          //                                 fit: BoxFit.fill,
          //                                 width: 107.w,
          //                                 height: 107.h,
          //                               ),
          //                             ),
          //                             element?.isVerified != "yes"
          //                                 ? Image.asset(
          //                                     'assets/images/katman_1.png',
          //                                     height: 20.h,
          //                                     width: 20.w,
          //                                     // fit: BoxFit.fitHeight,/
          //                                   )
          //                                 : Container()
          //                             // Image.asset(
          //                             //   "assets/images/image 54.png",
          //                             //   fit: BoxFit.fill,
          //                             //   width: 10.w,
          //                             //   height: 10.h,
          //                             // ),
          //                           ],
          //                         ),

          //                         SizedBox(
          //                           height: 12.w,
          //                         ),
          //                         Text(
          //                           "${element?.productName}",
          //                           // "Nivea Essentially Enriched Body Lotion and Hand Cream Variety Pack",
          //                           textAlign: TextAlign.start,
          //                           style: TextStyle(
          //                               overflow: TextOverflow.ellipsis,
          //                               fontFamily: 'Campton',
          //                               color: Colors.black,
          //                               // letterSpacing: .5,
          //                               fontSize: 14.sp,
          //                               fontWeight: FontWeight.w600),
          //                         ),
          //                         SizedBox(
          //                           height: 9.w,
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 8.w,
          //                   ),
          //                   element?.freeShipping == "yes"
          //                       ? Container(
          //                           width: ScreenUtil().screenWidth,
          //                           padding: EdgeInsets.only(
          //                               left: 18.w,
          //                               right: 21.w,
          //                               top: 5.w,
          //                               bottom: 3.w),
          //                           color: Color(0xff4CDB06),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceEvenly,
          //                             children: [
          //                               SvgPicture.asset(
          //                                 "assets/icons/box-02.svg",
          //                               ),
          //                               Text(
          //                                 "FREE SHIPPING",
          //                                 style: TextStyle(
          //                                     // letterSpacing: 0.9,
          //                                     fontFamily: 'Campton',
          //                                     color: Colors.white,
          //                                     letterSpacing: 2.5,
          //                                     fontSize: 10.sp,
          //                                     fontWeight: FontWeight.w700),
          //                               ),
          //                             ],
          //                           ),
          //                         )
          //                       : Container(),
          //                   SizedBox(
          //                     height: 8.w,
          //                   ),

          //                   /////////////////////////////////////////////////////////////
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     children: [
          //                       Container(
          //                         // padding:
          //                         //     EdgeInsets.only(left: 10.w, right: 20.w),
          //                         child: element?.featuredStatus == "approved"
          //                             ? Container(
          //                                 padding: EdgeInsets.only(
          //                                     left: 8,
          //                                     top: 4,
          //                                     right: 8.w,
          //                                     bottom: 4),
          //                                 decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         BorderRadius.circular(20),
          //                                     color: Color(0xffffc107)),
          //                                 child: Text(
          //                                   "Featured",
          //                                   // "Nivea",featured
          //                                   style: TextStyle(
          //                                       // decoration:
          //                                       // TextDecoration.underline,
          //                                       // letterSpacing: 3.5,
          //                                       color: black,
          //                                       fontSize: 10.sp,
          //                                       fontWeight: FontWeight.w700),
          //                                 ),
          //                               )
          //                             : Container(),
          //                       ),
          //                       element?.featured == "yes"
          //                           ? Image(
          //                               image: AssetImage(
          //                                 "assets/images/new_group.png",
          //                               ),
          //                               width: 45.w,
          //                               // height: 60.h,
          //                             )
          //                           : Container(),
          //                     ],
          //                   ),

          //                   // Row(
          //                   //   mainAxisAlignment: MainAxisAlignment.end,
          //                   //   children: [
          //                   //     SizedBox(
          //                   //       width: 10.w,
          //                   //     ),

          //                   //   ],
          //                   // ),

          //                   /////////////////////////////////////////////////////////////
          //                   Container(
          //                     padding: EdgeInsets.only(left: 10.w, right: 10.w),
          //                     child: Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         RichText(
          //                           text: TextSpan(
          //                             text: "${element?.productPrice}",
          //                             style: TextStyle(
          //                                 fontFamily: 'Campton',
          //                                 color: Color(0xff4CDB06),
          //                                 fontSize: 18.sp,
          //                                 fontWeight: FontWeight.w700),

          //                             /*defining default style is optional */
          //                             children: <TextSpan>[
          //                               TextSpan(
          //                                 text: '₺',
          //                                 style: GoogleFonts.inter(
          //                                   textStyle: TextStyle(
          //                                       fontFamily: 'Campton',
          //                                       color: Color(0xff4CDB06),
          //                                       fontSize: 18.sp,
          //                                       fontWeight: FontWeight.w700),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         element?.featuredStatus == "approved"
          //                             ? Container(
          //                                 padding: EdgeInsets.only(
          //                                     left: 8,
          //                                     top: 4,
          //                                     right: 8.w,
          //                                     bottom: 4),
          //                                 decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         BorderRadius.circular(20),
          //                                     color: Color(0xffffc107)),
          //                                 child: Text(
          //                                   "Featured",
          //                                   // "Nivea",featured
          //                                   style: TextStyle(
          //                                       // decoration:
          //                                       // TextDecoration.underline,
          //                                       // letterSpacing: 3.5,
          //                                       color: black,
          //                                       fontSize: 10.sp,
          //                                       fontWeight: FontWeight.w700),
          //                                 ),
          //                               )
          //                             : Container(),
          //                       ],
          //                     ),
          //                     //  Text(
          //                     // "${element?.salePrice}₺",
          //                     // style: TextStyle(
          //                     //     fontFamily: 'Campton',
          //                     //     color: Color(0xff4CDB06),
          //                     //     fontSize: 18.sp,
          //                     //     fontWeight: FontWeight.w700),
          //                     // ),
          //                   ),
          //                   SizedBox(
          //                     height: 10.h,
          //                   ),
          //                   element?.shippingFee != ''
          //                       ? Container(
          //                           padding: EdgeInsets.only(left: 10.w),
          //                           child: Text(
          //                             "Shipping Fees :${element?.shippingFee} ",
          //                             style: TextStyle(
          //                                 fontFamily: 'Campton',
          //                                 color: Color(0xffffc107),
          //                                 fontSize: 12.sp,
          //                                 fontWeight: FontWeight.w700),
          //                           ),
          //                         )
          //                       : Container()
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Container(
            margin:
                EdgeInsets.only(top: 25.w, right: 9.w, bottom: 5.w, left: 10.w),
            child: GridView.builder(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),
              itemCount: watch.productData?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (1.0.w / 1.7.w),
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0),
              // padding: EdgeInsets.all(8.0), // padding around the grid

              itemBuilder: (context, index) {
                final element = watch.productData?[index];
                return GestureDetector(
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    if (pref.getString("status") == "guestLoggedIn") {
                      Utils.showLogdinDialog(
                          context, "Please Login to continue");
                      return;
                    }
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: ShopProductView(
                          id: element?.id.toString() ?? '',
                        ),
                        direction: SlideDirection.right,
                        delay: Duration(milliseconds: 5000),
                      ),
                    );
                    // Navigator.push(
                    //   context,
                    //   SlidePageRoute(
                    //     page: ShopProductView(id: element?.id.toString()),
                    //     direction: SlideDirection.right,
                    //     delay: Duration(milliseconds: 5000),
                    //   ),
                    //   // MaterialPageRoute(
                    //   //     builder: (context) => ShopProductView()),
                    // );
                  },
                  child: Container(
                    child: Card(
                      // elevation: 5,
                      shape: RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(15.0),
                          ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                // offset: Offset(2, 2),
                                blurRadius: 50,
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  // top: 7.w,
                                  right: 10.w,
                                  // bottom: 5.w,
                                  left: 18.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  // element?.productImage == ""
                                  //     ? SizedBox(
                                  //   child: Image.asset(
                                  //     "assets/images/image 54.png",
                                  //     fit: BoxFit.fill,
                                  //     width: 107.w,
                                  //     height: 107.h,
                                  //   ),
                                  // )
                                  //     :
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      element?.featuredStatus != 'yes'
                                          ? Container(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  top: 4,
                                                  right: 8.w,
                                                  bottom: 4),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.yellow),
                                              child: Text(
                                                "Featured",
                                                // "Nivea",featured
                                                style: TextStyle(
                                                    // decoration:
                                                    // TextDecoration.underline,
                                                    // letterSpacing: 3.5,
                                                    color: black,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )
                                          : Container(),
                                      GestureDetector(
                                        onTap: () {
                                          readp.addToFavProduct(
                                              context, element?.id.toString());
                                          watch.vendorShopList(
                                              context, widget.vendorId);
                                        },
                                        child: element?.favouriteStatus == 'yes'
                                            ?
                                            // Image(
                                            //     image: const AssetImage(
                                            //         "assets/images/new_fav.png"),
                                            //     width: 38.w,
                                            //     height: 38.h,
                                            //   )
                                            Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            kDefaultActiveColor),
                                                    color: Colors.white,
                                                    shape: BoxShape.circle),
                                                height: 24.w,
                                                width: 24.w,
                                                child: Container(
                                                    height: 5.w,
                                                    width: 5.w,
                                                    child: Icon(
                                                      size: 17,
                                                      Icons.favorite,
                                                      color:
                                                          kDefaultActiveColor,
                                                    )),
                                              )
                                            : Image(
                                                image: const AssetImage(
                                                    "assets/images/new_remove_fav.png"),
                                                width: 38.w,
                                                height: 38.h,
                                              ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AppNetworkImages(
                                          imageUrl: "${element?.imagePath}",
                                          fit: BoxFit.fill,
                                          width: 107.w,
                                          height: 107.h,
                                        ),
                                      ),
                                      // element?.status == "active"
                                      //     ? Image.asset(
                                      //         'assets/images/katman_1.png',
                                      //         height: 20.h,
                                      //         width: 20.w,
                                      //         // fit: BoxFit.fitHeight,/
                                      //       )
                                      //     : Container()
                                    ],
                                  ),

                                  SizedBox(
                                    height: 12.w,
                                  ),
                                  Text(
                                    "${element?.productName}",
                                    // "Nivea Essentially Enriched Body Lotion and Hand Cream Variety Pack",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        // letterSpacing: .5,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 9.w,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.w,
                            ),
                            element?.freeShipping == "yes"
                                ? Container(
                                    width: ScreenUtil().screenWidth,
                                    padding: EdgeInsets.only(
                                        left: 18.w,
                                        right: 21.w,
                                        top: 5.w,
                                        bottom: 3.w),
                                    color: Color(0xff4CDB06),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/box-02.svg",
                                        ),
                                        Text(
                                          "FREE SHIPPING",
                                          style: TextStyle(
                                              // letterSpacing: 0.9,
                                              fontFamily: 'Campton',
                                              color: Colors.white,
                                              letterSpacing: 2.5,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  )
                                : element?.shippingFee != ''
                                    ? Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.w, bottom: 6.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Shipping Fees :${element?.shippingFee} ",
                                              style: TextStyle(
                                                  // fontFamily: 'Campton',
                                                  color: Color(0xffffc107),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "₺",
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Color(0xffffc107),
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(), // add here
                            SizedBox(
                              height: 8.w,
                            ),

                            /////////////////////////////////////////////////////////////
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Container(
                            //       // padding:
                            //       //     EdgeInsets.only(left: 10.w, right: 20.w),
                            //     //   child: element?.featuredStatus == "approved"
                            //     //       ? Container(
                            //     //           padding: EdgeInsets.only(
                            //     //               left: 8,
                            //     //               top: 4,
                            //     //               right: 8.w,
                            //     //               bottom: 4),
                            //     //           decoration: BoxDecoration(
                            //     //               borderRadius:
                            //     //                   BorderRadius.circular(20),
                            //     //               color: Color(0xffffc107)),
                            //     //           child: Text(
                            //     //             "Featured",
                            //     //             // "Nivea",featured
                            //     //             style: TextStyle(
                            //     //                 // decoration:
                            //     //                 // TextDecoration.underline,
                            //     //                 // letterSpacing: 3.5,
                            //     //                 color: black,
                            //     //                 fontSize: 10.sp,
                            //     //                 fontWeight: FontWeight.w700),
                            //     //           ),
                            //     //         )
                            //     //       : Container(),
                            //     // ),
                            //     // element?.isVerified == "yes"
                            //     //     ? Image(
                            //     //         image: AssetImage(
                            //     //           "assets/images/new_group.png",
                            //     //         ),
                            //     //         width: 45.w,
                            //     //         // height: 60.h,
                            //     //       )
                            //     //     : Container(),
                            //   ],
                            // ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     SizedBox(
                            //       width: 10.w,
                            //     ),

                            //   ],
                            // ),

                            /////////////////////////////////////////////////////////////
                            Container(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    if ((double.tryParse(
                                                element?.salePrice ?? '0') ??
                                            0) <
                                        (double.tryParse(
                                                element?.productPrice ?? '0') ??
                                            0))
                                      RichText(
                                        text: TextSpan(
                                          text: "${element?.salePrice ?? ''}",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Color(0xff4CDB06),
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700),

                                          /*defining default style is optional */
                                          // children: <TextSpan>[
                                          // ],
                                        ),
                                      )
                                    else
                                      RichText(
                                        text: TextSpan(
                                          text: "${element?.productPrice}",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Color(0xff4CDB06),
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    SizedBox(width: 3.5.w),
                                    RichText(
                                      text: TextSpan(
                                        text: '₺',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Color(0xff4CDB06),
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                    //       element?.featuredStatus == "approved"
                                    //           ? Container(
                                    //               padding: EdgeInsets.only(
                                    //                   left: 8,
                                    //                   top: 4,
                                    //                   right: 8.w,
                                    //                   bottom: 4),
                                    //               decoration: BoxDecoration(
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(20),
                                    //                   color: Color(0xffffc107)),
                                    //               child: Text(
                                    //                 "Featured",
                                    //                 // "Nivea",featured
                                    //                 style: TextStyle(
                                    //                     // decoration:
                                    //                     // TextDecoration.underline,
                                    //                     // letterSpacing: 3.5,
                                    //                     color: black,
                                    //                     fontSize: 10.sp,
                                    //                     fontWeight: FontWeight.w700),
                                    //               ),
                                    //             )
                                    //           : Container(),
                                    //     ],
                                    //   ),
                                    //  Text(
                                    // "${element?.salePrice}₺",
                                    // style: TextStyle(
                                    //     fontFamily: 'Campton',
                                    //     color: Color(0xff4CDB06),
                                    //     fontSize: 18.sp,
                                    //     fontWeight: FontWeight.w700),
                                  ]),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // SizedBox(
          //   height: 80,
          // ),
        ],
      ),
    );
  }
}
