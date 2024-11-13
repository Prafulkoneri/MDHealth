import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/health/bank_transfer/view/bank_tranfer.dart';
import 'package:md_health/Screens/favourt/view/health_favt_pa_list_details.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/view/md_shop_home_page.dart';
import 'package:md_health/Screens/payment/view/payment_view.dart';
import 'package:md_health/Screens/shop/shop_cart/controller/cart_details_controller.dart';
import 'package:md_health/Screens/shop/shop_cart/view/select_address.dart';
import 'package:md_health/Screens/shop/shop_payment/view/shop_cart_payment_view.dart';
import 'package:md_health/Screens/shop/shop_payment/view/shop_wallet_payment_view.dart';
import 'package:md_health/Screens/shop/shop_payment/view/bank_trasfet_shop_view.dart';
// import 'package:md_health/Screens/shop_payment/view/shop_cart_payment_view.dart';
// import 'package:md_health/Screens/shop_payment/view/shop_wallet_payment_view.dart';
// import 'package:md_health/Screens/shop_product_view/view/shop_product_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';

class ShopCartScreenView extends StatefulWidget {
  final String? screenName;
  final String? id;
  final String? addressID;

  const ShopCartScreenView(
      {super.key, this.screenName, this.id, this.addressID});

  @override
  State<ShopCartScreenView> createState() => _ShopCartScreenViewState();
}

class _ShopCartScreenViewState extends State<ShopCartScreenView> {
  @override
  void initState() {
    print(widget.screenName);
    final watch = Provider.of<CartDetailViewController>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .read<CartDetailViewController>()
          .initState(context, widget.id, widget.addressID);
    });
  }

  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final read = context.read<CartDetailViewController>();
    final watch = context.watch<CartDetailViewController>();
    return BaseScreen(
      onWillPop: () async {
        print('object');
        // widget.screenName == "ShopHomeOage"
        //     ? Navigator.push(
        //         context,
        //         SlidePageRoute(
        //           page: MdShopHomePageView(
        //               // refresh: true,
        //               ),
        //           direction:
        //               SlideDirection.left, // Specify the slide direction here
        //           delay: const Duration(milliseconds: 5000),
        //         ),
        //       )
        //     :
        Navigator.push(
          context,
          SlidePageRoute(
            page: MdShopHomePageView(
                // refresh: true,
                ),
            // page: ShopProductView(
            //   id: widget.id.toString(),
            // ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: const Duration(milliseconds: 5000),
          ),
        );
        return true;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppBar(
        onBackPressed: () {
          widget.screenName == "FaviListDetailoView"
              ? Navigator.push(
                  context,
                  SlidePageRoute(
                    page: MdShopHomePageView(
                        // refresh: true,
                        ),
                    direction:
                        SlideDirection.left, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                )
              : Navigator.push(
                  context,
                  SlidePageRoute(
                    page: MdShopHomePageView(
                        // id: widget.id.toString(),
                        ),
                    direction:
                        SlideDirection.left, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                );
        },
        mdTitle: "shop",
        // hasHiText: true,
        hasBackButton: true,
        hasMdTitle: true,
        // drawerTitle: "Orders",
      ),
      content: watch.isLoading
          ? Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200.h),
                const Loader(),
              ],
            )
          : Builder(builder: (context) {
              return watch.isEmptyCart
                  ? Center(
                      child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 180.h,
                          ),
                          SvgPicture.asset(
                            "assets/icons/kiran_no_data_found.svg",
                            // width: 10,
                          ),
                        ],
                      ),
                    ))
                  : Column(
                      children: [
                        SizedBox(
                          height: 27.h,
                        ),
                        Text(
                          "Payment Details",
                          style: TextStyle(
                              // letterSpacing: 3.5,
                              color: kDefaultActiveColor,
                              fontSize: 29.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            read.allCartDelete(context);
                          },
                          child: Text(
                            "Clear the Cart",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                // letterSpacing: 3.5,
                                color: Color(0xffF31D1D),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(10),
                              // border: Border.all(width: 2),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black.withOpacity(0.10),
                              //     // offset: Offset(2, 2),
                              //     blurRadius: 10,
                              //   ),
                              // ],
                              ),
                          margin: EdgeInsets.only(
                              left: 25.w, top: 37.w, right: 25.w),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: watch.cartItem?.length ?? 0,
                            itemBuilder: (context, index) {
                              final element = watch.cartItem?[index];
                              return Card(
                                elevation: 10,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 8.w,
                                      bottom: 8.w,
                                      top: 9.w,
                                      right: 16.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Vendor:',
                                              style: TextStyle(
                                                  color: kDefaultActiveColor,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w800),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' ${element?.vendor}',
                                                  style: const TextStyle(
                                                      color: black,
                                                      // Color(0xff4CDB06),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  recognizer:
                                                      new TapGestureRecognizer()
                                                        ..onTap = () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                          element?.freeShipping == "yes"
                                              ? Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/box-02.svg",
                                                      color: Color(0xff4CDB06),
                                                    ),
                                                    Text(
                                                      "Free Shipping",
                                                      style: TextStyle(
                                                          letterSpacing: 0.9,
                                                          fontFamily: 'Campton',
                                                          color:
                                                              Color(0xff4CDB06),
                                                          // letterSpacing: .5,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                )
                                              : Container()
                                        ],
                                      ),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: AppNetworkImages(
                                              imageUrl:
                                                  "${element?.productImagePath}",
                                              fit: BoxFit.fill,
                                              width: 76.w,
                                              height: 76.h,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${element?.productName}",
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 13.w,
                                                          right: 13.w,
                                                          top: 2.w,
                                                          bottom: 2.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 2,
                                                              color: Color(
                                                                  0xffE9E9E9)),
                                                          // color: Color(0xff4CDB06),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              read.cartCountDecrement(
                                                                  context,
                                                                  element?.id
                                                                      .toString());
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 3.w,
                                                                      top: 2.w,
                                                                      right:
                                                                          3.w),
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xff4CDB06),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Text(
                                                                "-",
                                                                style: TextStyle(
                                                                    fontFamily: 'Campton',
                                                                    color: Colors.black,
                                                                    // letterSpacing: .5,
                                                                    fontSize: 14.sp,
                                                                    fontWeight: FontWeight.w600),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5.h,
                                                          ),
                                                          Text(
                                                            "${element?.quantity}", // Display quantity from cartItem
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Campton',
                                                                color: Colors
                                                                    .black,
                                                                // letterSpacing: .5,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            width: 5.h,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              read.cartCountIncrease(
                                                                  context,
                                                                  element?.id);
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 3.w,
                                                                      top: 2.w,
                                                                      right:
                                                                          3.w),
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xff4CDB06),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Text(
                                                                "+",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontFamily: 'Campton',
                                                                    color: Colors.black,
                                                                    // letterSpacing: .5,
                                                                    fontSize: 14.sp,
                                                                    fontWeight: FontWeight.w600),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        print(element?.id
                                                            .toString());
                                                        // return;
                                                        read.cartOneItemDelete(
                                                            context,
                                                            element?.cartId
                                                                .toString());
                                                      },
                                                      child: Text(
                                                        "Delete Product",
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontFamily:
                                                                'Campton',
                                                            color: Color(
                                                                0xffF31D1D),
                                                            // letterSpacing: .5,
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 26.w, right: 26.w),
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  // offset: Offset(2, 2),
                                  blurRadius: 20,
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 26.w, top: 20.w, right: 26.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Products",
                                      style: TextStyle(
                                          // decoration: TextDecoration.underline,
                                          fontFamily: 'Campton',
                                          color: Color(0xff9B9B9B),
                                          // letterSpacing: .5,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // Text(
                                    //   "${watch.productPrice} ₺",
                                    // style: TextStyle(
                                    //     // decoration: TextDecoration.underline,
                                    //     fontFamily: 'Campton',
                                    //     color: black,
                                    //     // letterSpacing: .5,
                                    //     fontSize: 14.sp,
                                    //     fontWeight: FontWeight.w500),
                                    // )
                                    RichText(
                                      text: TextSpan(
                                        text: "${watch.productPrice} ",
                                        // "299,99 ₺",
                                        style: TextStyle(
                                            // decoration: TextDecoration.underline,
                                            fontFamily: 'Campton',
                                            color: black,
                                            // letterSpacing: .5,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),

                                        /*defining default style is optional */
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '₺',
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  // fontFamily: 'Campton',
                                                  color: black,
                                                  // letterSpacing: .5,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              watch.freeShipping == "no"
                                  ? Container(
                                      padding: EdgeInsets.only(
                                          left: 26.w, right: 26.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Shipping Fee",
                                            style: TextStyle(
                                                // decoration: TextDecoration.underline,
                                                fontFamily: 'Campton',
                                                color: Color(0xff9B9B9B),
                                                // letterSpacing: .5,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          // watch.
                                          RichText(
                                            // textAlign: TextAlign.start,
                                            text: TextSpan(
                                              text: "FREE",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: watch.freeShipping ==
                                                          "yes"
                                                      ? Color(0xff4CDB06)
                                                      : Colors.transparent,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700),

                                              /*defining default style is optional */
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      "   ${watch.deliveryChargesTotal} ",
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                TextSpan(
                                                    text: "₺",
                                                    style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          // fontFamily: 'Campton',
                                                          color: Colors.black,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: 12.w, top: 16.w, bottom: 15.w),
                                width: ScreenUtil().screenWidth,
                                color: Colors.black,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "invite your friends",
                                        style: TextStyle(
                                            // decoration: TextDecoration.underline,
                                            fontFamily: 'Campton',
                                            color: Colors.white,
                                            // letterSpacing: .5,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      RichText(
                                        // textAlign: TextAlign.start,
                                        text: TextSpan(
                                          text: "and",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.white,
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.w500),

                                          /*defining default style is optional */
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: " earn",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Color(0xff4CDB06),
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            TextSpan(
                                              text: " MD",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.white,
                                                  fontSize: 27.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            TextSpan(
                                              text: "coin.",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.white,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 26.w, right: 26.w),
                                child: Text(
                                  "Total Price",
                                  style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      fontFamily: 'Campton',
                                      color: Color(0xff4CDB06),
                                      // letterSpacing: .5,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 26.w, right: 26.w),
                                child: RichText(
                                  text: TextSpan(
                                    text: "${watch.cartTotalPrice}",
                                    // "299,99 ₺",
                                    style: TextStyle(
                                        // decoration: TextDecoration.underline,
                                        fontFamily: 'Campton',
                                        color: black,
                                        // letterSpacing: .5,
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w700),

                                    /*defining default style is optional */
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '₺',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              // decoration: TextDecoration.underline,
                                              // fontFamily: 'Campton',
                                              color: black,
                                              // letterSpacing: .5,
                                              fontSize: 28.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(
                                //   "${watch.cartTotalPrice} ₺",
                                //   style: TextStyle(
                                // // decoration: TextDecoration.underline,
                                // fontFamily: 'Campton',
                                // color: black,
                                // // letterSpacing: .5,
                                // fontSize: 28.sp,
                                // fontWeight: FontWeight.w700),
                                // ),
                              ),
                              SizedBox(
                                height: 12.w,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        // Container(
                        //   // margin: EdgeInsets.only(left: 62.w, right: 62.w),
                        //   child: Text(
                        //     "Read and confirm the agreement.",
                        //     style: TextStyle(
                        //         // decoration: TextDecoration.underline,
                        //         fontFamily: 'Campton',
                        //         color: Color(0xff4CDB06),
                        //         // letterSpacing: .5,
                        //         fontSize: 20.sp,
                        //         fontWeight: FontWeight.w700),
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: GestureDetector(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              shadowColor: const Color(0xffFBFBFB),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 14.w, top: 15.w, bottom: 14.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 5.w, right: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Address",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -1),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SelectAddressView()));
                                              // showStepOneDialog();SelectAddressView
                                            },
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/change.svg'),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  "Change Address",
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontFamily: 'Campton',
                                                      color: Colors.red,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: -1),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: Text(
                                        '${watch.customerList?.fullName ?? ''}',
                                        style: TextStyle(
                                            fontFamily: 'Campton',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                            color: kDefaultActiveColor),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: Text(
                                        '${watch.customerList?.address ?? ''}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          fontFamily: 'Campton',
                                          color: black,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Country  : ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.sp,
                                                fontFamily: 'Campton',
                                                color: black,
                                                letterSpacing: -1,
                                              ),
                                            ),
                                            Text(
                                              '${watch.customerList?.countryName ?? ''}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                                fontFamily: 'Campton',
                                                color: black,
                                                letterSpacing: -1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                'City  : ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'Campton',
                                                  color: black,
                                                  letterSpacing: -1,
                                                ),
                                              ),
                                              Text(
                                                '${watch.customerList?.cityName ?? ''}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'Campton',
                                                  color: black,
                                                  letterSpacing: -1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 49.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 28.w),
                          child: GestureDetector(
                            onTap: () {
                              watch.toggleApproval();
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/Ellipse 9.svg",
                                    color: watch.isApproved
                                        ? Color(0xff4CDB06)
                                        : Color(0xffE7E7E7)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        letterSpacing: -1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Colors.white),
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            read.launchTermsAndConditionURL();
                                            print('Login Text Clicked ');
                                          },
                                        children: [],
                                        text: 'Terms and Condition  ',
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15.0)),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          top: 0.0),
                                                  content: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      // Fixed header
                                                      Stack(
                                                        children: [
                                                          Positioned(
                                                            top: 15,
                                                            right: 15,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: SvgPicture
                                                                  .asset(
                                                                "assets/icons/red_close.svg",
                                                                color:
                                                                    kDefaultActiveColor,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              top: 15.0.w,
                                                              left: 15.w,
                                                              right: 60.w,
                                                              bottom: 5.w,
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Contract and Forms",
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        kDefaultActiveColor,
                                                                    fontSize:
                                                                        25.sp,
                                                                    fontFamily:
                                                                        'Campton',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 15.h),

                                                      Expanded(
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 2.w,
                                                                    right: 2.w),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // ExpansionTile(
                                                                //   title: Text(
                                                                //       "Contract and Forms",
                                                                //       style:
                                                                //           TextStyle(
                                                                //         fontSize:
                                                                //             19.sp,
                                                                //         color: black,
                                                                //         fontFamily:
                                                                //             'Campton',
                                                                //         fontWeight:
                                                                //             FontWeight
                                                                //                 .w500,
                                                                //       )),
                                                                //   children: [
                                                                //     ListTile(
                                                                //       title: HtmlWidget(
                                                                //           "${watch.data}"),
                                                                //     ),
                                                                //   ],
                                                                // ),
                                                                // ExpansionTile(
                                                                //   title: Text(
                                                                //       "Right to Withdrawl",
                                                                //       style:
                                                                //           TextStyle(
                                                                //         fontSize:
                                                                //             19.sp,
                                                                //         color: black,
                                                                //         fontFamily:
                                                                //             'Campton',
                                                                //         fontWeight:
                                                                //             FontWeight
                                                                //                 .w500,
                                                                //       )),
                                                                //   children: [
                                                                //     ListTile(
                                                                //       title: HtmlWidget(
                                                                //           "${watch.rightOfWithDrawl}"),
                                                                //     ),
                                                                //   ],
                                                                // ),
                                                                // ExpansionTile(
                                                                //   title: Text(
                                                                //       "Preliminary",
                                                                //       style:
                                                                //           TextStyle(
                                                                //         fontSize:
                                                                //             19.sp,
                                                                //         color: black,
                                                                //         fontFamily:
                                                                //             'Campton',
                                                                //         fontWeight:
                                                                //             FontWeight
                                                                //                 .w500,
                                                                //       )),
                                                                //   children: [
                                                                //     ListTile(
                                                                //       title: HtmlWidget(
                                                                //           "${watch.preliminary}"),
                                                                //     ),
                                                                //   ],
                                                                // ),

                                                                _buildExpansionTile(
                                                                  index: 0,
                                                                  title:
                                                                      "Contract and Forms",
                                                                  content: watch
                                                                          .data ??
                                                                      '',
                                                                ),
                                                                _buildExpansionTile(
                                                                  index: 1,
                                                                  title:
                                                                      "Right to Withdrawal",
                                                                  content: watch
                                                                          .rightOfWithDrawl ??
                                                                      '',
                                                                ),
                                                                _buildExpansionTile(
                                                                  index: 2,
                                                                  title:
                                                                      "Preliminary",
                                                                  content: watch
                                                                          .preliminary ??
                                                                      "",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      SizedBox(height: 38.h),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        text: '&  Contracts and forms ',
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14.w,
                        ),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   margin: EdgeInsets.only(left: 26.w, right: 26.w),
                        //   child: Container(
                        //     padding:
                        //         EdgeInsets.only(left: 22.w, top: 20.w, right: 17.w),
                        //     decoration: BoxDecoration(
                        //         color: Color(0xffFFFFFF),
                        //         // borderRadius: BorderRadius.circular(10),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.10),
                        //             // offset: Offset(2, 2),
                        //             blurRadius: 20,
                        //           ),
                        //         ]),
                        //     child: Column(
                        //       children: [
                        //         Text(
                        //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        //           style: TextStyle(
                        //               // decoration: TextDecoration.underline,
                        //               fontFamily: 'Campton',
                        //               color: black,
                        //               // letterSpacing: .5,
                        //               fontSize: 16.sp,
                        //               fontWeight: FontWeight.w400),
                        //         ),
                        //         SizedBox(
                        //           height: 23.w,
                        //         ),
                        //         SizedBox(
                        //           height: 23.w,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        Container(
                          margin: EdgeInsets.only(left: 28.w),
                          child: GestureDetector(
                            onTap: () {
                              watch.toggleApprovaluser();
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/Ellipse 9.svg",
                                    color: watch.isApproveddata
                                        ? Color(0xff4CDB06)
                                        : Color(0xffE7E7E7)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        letterSpacing: -1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Colors.white),
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            read.launchPrivacyPolicyURL();
                                            print('Login Text Clicked');
                                          },
                                        text: ' User Data Consent.',
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          height: 58.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 26.w, right: 26.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Pay Via',
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  fontSize: 19,
                                  color: kDefaultActiveColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 26.w, right: 26.w),
                          child: GestureDetector(
                            onTap: () {
                              if (watch.isApproved && watch.isApproveddata) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShopCartPaymentView(
                                      purchaseType: 'card',
                                      productPrices: watch.productPrice,
                                      shippingfees: watch.deliveryChargesTotal,
                                      productName: watch.productName,
                                      totalPrice: watch.cartTotalPrice,
                                    ),
                                  ),
                                );
                              } else {
                                // Handle the case when approval is not granted, perhaps show a message to the user
                                Utils.showPrimarySnackbar(
                                    context, 'Approved is required to proceed',
                                    type: SnackType.error);
                              }

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ShopCartPaymentView(
                              //               shippingfees: watch.deliveryChargesTotal,
                              //               productName: watch.productName,
                              //               // productName: "${element?.productImagePath}",
                              //               totalPrice: watch.cartTotalPrice,
                              //             )));
                            },
                            child: SvgPicture.asset(
                              'assets/icons/Group_9.svg',
                              height: 92.h,
                              width: 394.w,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 26.w, right: 26.w),
                          child: GestureDetector(
                            onTap: () {
                              print(watch.productName);
                              print(watch.deliveryChargesTotal);
                              print(watch.cartTotalPrice);
                              // return;
                              if (watch.isApproved && watch.isApproveddata) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            shopBankCompletedView(
                                              purchaseType: "bank",
                                              productPrices: watch.productPrice,

                                              shippingfees:
                                                  watch.deliveryChargesTotal,
                                              productName: watch.productName,
                                              // productName: "${element?.productImagePath}",
                                              totalPrice: watch.cartTotalPrice,
                                              // productName: "${element?.productImagePath}",
                                              // totalPrice: watch.cartTotalPrice,
                                            )));
                              } else {
                                // Handle the case when approval is not granted, perhaps show a message to the user
                                Utils.showPrimarySnackbar(
                                    context, 'Approved is required to proceed',
                                    type: SnackType.error);
                              }
                            },
                            child: SvgPicture.asset(
                              'assets/icons/Group_7.svg',
                              height: 92.h,
                              width: 394.w,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 26.w, right: 26.w),
                          child: GestureDetector(
                            onTap: () {
                              if (watch.isApproved && watch.isApproveddata) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShopMyWalletScreenViewPayView(
                                              purchaseType: "md_coin",

                                              productPrices: watch.productPrice,

                                              shippingfees:
                                                  watch.deliveryChargesTotal,
                                              productName: watch.productName,
                                              // productName: "${element?.productImagePath}",
                                              totalPrice: watch.cartTotalPrice,
                                              // productName: "${element?.productImagePath}",
                                              // totalPrice: watch.cartTotalPrice,
                                            )));
                              } else {
                                // Handle the case when approval is not granted, perhaps show a message to the user
                                Utils.showPrimarySnackbar(
                                    context, 'Approved is required to proceed',
                                    type: SnackType.error);
                              }
                            },
                            child: SvgPicture.asset(
                              'assets/icons/Group_8.svg',
                              height: 92.h,
                              width: 394.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                      ],
                    );
            }),
    );
  }

  Widget _buildExpansionTile(
      {required int index, required String title, required String content}) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 19.sp,
          color: Colors.black, // Replace with your color variable
          fontFamily: 'Campton',
          fontWeight: FontWeight.w500,
        ),
      ),
      initiallyExpanded: _expandedIndex == index,
      onExpansionChanged: (bool expanded) {
        setState(() {
          _expandedIndex = expanded ? index : -1;
        });
      },
      children: [
        ListTile(
          title: HtmlWidget(content),
        ),
      ],
    );
  }
}
