import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/food/diet_plan/view/popup_widget_step_2.dart';
import 'package:md_health/Screens/order_details/controller/shop_details_controller.dart';
import 'package:md_health/Screens/order_details/view/change_address_pop_up.dart';
import 'package:md_health/Screens/order_details/view/changes_invoice_address_pop_up.dart';
import 'package:md_health/Screens/order_details/view/md_shop_view.dart';
import 'package:md_health/Screens/order_details/view/shop_order_cancel_reason_view.dart';
import 'package:md_health/Screens/order_details/view/show_shop_review_pop.dart';
import 'package:md_health/Screens/order_details/view/submit_shop_review_pop_up.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopOrderDetailsOrderView extends StatefulWidget {
  final String? shopOrderId;
  const ShopOrderDetailsOrderView({super.key, required this.shopOrderId});

  @override
  State<ShopOrderDetailsOrderView> createState() =>
      _ShopOrderDetailsOrderViewState();
}

class _ShopOrderDetailsOrderViewState extends State<ShopOrderDetailsOrderView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context
          .read<ShopListDetailsController>()
          .initState(context, widget.shopOrderId, '', '');
    });
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500), // Adjust the duration as needed
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  void showStepOneDialog({String? id}) {
    debugPrint('/////////////$id///////////////');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: PopupDialogWidgetStepTwo(
                  foodPackageId: id.toString(),
                  onTap: () {
                    // Navigator.pop(context);
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return PopupDialogWidgetStepOne(
                    //         onTapText: 'Myself',
                    //         child: Padding(
                    //           padding: EdgeInsets.symmetric(horizontal: 10.w),
                    //           child: Text(
                    //             "Who is this purchase for?",
                    //             style: TextStyle(
                    //               fontFamily: 'Campton',
                    //               color: Colors.black,
                    //               fontSize: 17.sp,
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ),
                    //         ),
                    //         onTap: () {
                    //           Navigator.pop(context);
                    //           showDialog(
                    //               context: context,
                    //               builder: (BuildContext context) {
                    //                 return PaymentDetailsViewDiet();
                    //               });
                    //         },
                    //         onTapButton2: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) =>
                    //                     const InformationFormView()),
                    //           );
                    //         },
                    //       );
                    //     });
                  }),
            );
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    final read = context.read<ShopListDetailsController>();
    final watch = context.watch<ShopListDetailsController>();
    return Builder(builder: (context) {
      return BaseScreen(
        onWillPop: () async {
          Navigator.push(
            context,
            SlidePageRoute(
              page: OrderMdShopView(
                  // packageId:MdShopView
                  //     widget.packageId,
                  ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: Duration(milliseconds: 5000),
            ),
          );

          return false;
        },
        backgroundColor: const Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(125.h),
          child: CustomAppBar(
              onBackPressed: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: OrderMdShopView(
                        // packageId:MdShopView
                        //     widget.packageId,
                        ),
                    direction:
                        SlideDirection.left, // Specify the slide direction here
                    delay: Duration(milliseconds: 5000),
                  ),
                );
              },
              // hasHiText: true,
              hasBackButton: true,
              hasMdTitle: false,
              drawerTitle: "Order No: ${watch.orderId}"
              // ${watch.foodOrderId.toString()}

              ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 25.w,
                top: 30.w,
              ),
              child: Text(
                'Products',
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 18.w, top: 17.w, bottom: 9.h, right: 18.w),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: watch.shopProductDetails?.length ?? 0,
                itemBuilder: (context, index) {
                  final element = watch.shopProductDetails?[index];
                  return Container(
                      margin: EdgeInsets.only(
                        bottom: 10.w,
                      ),
                      padding: EdgeInsets.only(
                          left: 15.w, top: 5.w, bottom: 5.w, right: 8.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              element?.imageUrl != ""
                                  ? SizedBox(
                                      height: 50.w,
                                      width: 50.w,
                                      child: Image.network(
                                        "${element?.imageUrl}",
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(),
                              //  SizedBox(
                              //     height: 50.w,
                              //     width: 50.w,
                              //     child: AppNetworkImages(
                              //       imageUrl: "${element?.imageUrl}",
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // Image(
                              //   image: AssetImage(
                              //       "assets/images/product_Square.png"),
                              //   height: 50.h,
                              //   width: 50.w,
                              // ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            '${element?.productName}',
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        // Text(
                                        //   "Price :",
                                        //   style: TextStyle(
                                        //       fontFamily: 'Campton',
                                        //       color: Colors.black,
                                        //       fontSize: 16.sp,
                                        //       fontWeight: FontWeight.w600),
                                        // )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${element?.quantity}x(Pcs)',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Price :",
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text: '${element?.amountPaid} ',
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600),

                                                /*defining default style is optional */
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '₺',
                                                    style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          // fontFamily: 'Campton',
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Text(
                                            //   '${element?.amountPaid} ₺',
                                            //   style: TextStyle(
                                            // fontFamily: 'Campton',
                                            // color: Colors.black,
                                            // fontSize: 16.sp,
                                            // fontWeight: FontWeight.w600),
                                            // ),
                                          ],
                                        )
                                      ],
                                    ),
                                    watch.orderStatus == "Delivered"
                                    ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        element?.reviewFound != "yes"
                                            ? GestureDetector(
                                                onTap: () {
                                                  print(watch.orderId);
                                                  print(element?.productId
                                                      .toString());
                                                  print(element?.productName);
                                                  print(watch.orderId);
                                                  // return;
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              15.0))),
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      top: 0.0),
                                                              content:
                                                                  SubmitShopReviewPopUp(
                                                                orderId: watch
                                                                    .orderId,
                                                                productId: element
                                                                    ?.productId
                                                                    .toString(),
                                                                productName: element
                                                                    ?.productName,
                                                              )));
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w,
                                                      top: 5.w,
                                                      bottom: 5.w,
                                                      right: 12.w),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff4CDB06),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                    child: Text(
                                                      'Rate Product',
                                                      style: TextStyle(
                                                          fontFamily: 'Campton',
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  // return;
                                                  // read.getFoodReview(context,
                                                  //     watch.orderFoodDetails?.id.toString());
                                                  read.getShopReview(
                                                      context,
                                                      watch.orderId.toString(),
                                                      element?.productId
                                                          .toString(),
                                                      element?.productName);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w,
                                                      top: 5.w,
                                                      bottom: 5.w,
                                                      right: 12.w),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff4CDB06),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                    child: Text(
                                                      'View Review',
                                                      style: TextStyle(
                                                          fontFamily: 'Campton',
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    )
                                    : Container()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status: ',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Shipping Fee:',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500),

                          /*defining default style is optional */
                          children: <TextSpan>[
                            TextSpan(
                              text: '${watch.deliveryCharge ?? ""} ',
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: '₺',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    // fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 20.w, top: 5.w, bottom: 5.w, right: 18.w),
                        decoration: BoxDecoration(
                            color: watch.orderStatus == "Pending"
                                ? Color(0xffF3771D)
                                : watch.orderStatus == "Packaging"
                                    ? Colors.yellow
                                    : watch.orderStatus == "Shipped"
                                        ? const Color.fromARGB(
                                            255, 79, 156, 219)
                                        : watch.orderStatus == "Delivered"
                                            ? Colors.green
                                            : watch.orderStatus == "Cancelled"
                                                ? Colors.red
                                                : Colors.transparent,
                            // color: watch.orderFoodDetails?.orderStatus ==
                            //         "Pending"
                            //     ? Color(0xffF3771D)
                            //     : watch.orderFoodDetails?.orderStatus ==
                            //             "Packaging"
                            //         ? Colors.yellow
                            //         : watch.orderFoodDetails?.orderStatus ==
                            //                 "Shipped"
                            //             ? const Color.fromARGB(
                            //                 255, 79, 156, 219)
                            //             : watch.orderFoodDetails?.orderStatus ==
                            //                     "Delivered"
                            //                 ? Colors.transparent
                            //                 : Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            '${watch.orderStatus ?? ""}',
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Total Price: ',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Color(0xff4CDB06),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700),

                          /*defining default style is optional */
                          children: <TextSpan>[
                            TextSpan(
                              text: '${watch.totalAmountPaid ?? ""}',
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '₺',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    //  fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 18.w, top: 23.w, right: 18.w),
              padding: EdgeInsets.only(left: 28.w, top: 28.w, right: 14.w),
              decoration: BoxDecoration(
                  color: Colors.white,
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
                  Text(
                    'Address ',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Text(
                    'Delivery Address ',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6.w,
                  ),
                  Text(
                    "${watch.address ?? ""}",

                    // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Text(
                    '${watch.city ?? ""} / ${watch.country ?? ""}',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 22.w,
                  ),
                  watch.orderStatus != "Cancelled" &&
                          watch.orderStatus != "Shipped" &&
                          watch.orderStatus != "Delivered"
                      ? PrimaryButton(
                          // width: 366.w,
                          height: 39.h,
                          // borderRadius: BorderRadius.circular(),
                          borderRadius: 30,
                          // width: ScreenUtil().screenWidth,
                          color: Color(0xff000000),
                          onTap: () {
                            print('*********${watch.orderId}');
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),

                                    // insetPadding:
                                    //    EdgeInsets.all(0),
                                    contentPadding: EdgeInsets.only(top: 0.0),
                                    content: ChnageAddressPopUpView(
                                      orderId: watch.orderId,
                                    )));
                          },
                          child: Text(
                            "Change Delivery Address",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.white,
                                // letterSpacing: .5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : Container(),
                  watch.orderStatus == "Cancelled" &&
                          watch.orderStatus == "Shipped" &&
                          watch.orderStatus == "Delivered"
                      ? SizedBox(
                          height: 64.w,
                        )
                      : SizedBox(
                          height: 30.w,
                        ),
                  Text(
                    'Invoice Address ',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    "${watch.address ?? ""}",
                    // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 22.w,
                  ),
                  Text(
                    '${watch.city ?? ""} / ${watch.country ?? ""}',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  watch.orderStatus != "Cancelled" &&
                          watch.orderStatus != "Shipped" &&
                          watch.orderStatus != "Delivered"
                      ? PrimaryButton(
                          // width: 366.w,
                          height: 39.h,
                          // borderRadius: BorderRadius.circular(),
                          borderRadius: 30,
                          // width: ScreenUtil().screenWidth,
                          color: Color(0xff000000),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),

                                    // insetPadding:
                                    //    EdgeInsets.all(0),
                                    contentPadding: EdgeInsets.only(top: 0.0),
                                    content: ChnageInvoiceAddressPopUpView(
                                      orderId: watch.orderId,
                                    )));
                          },
                          child: Text(
                            "Change Invoice Address",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.white,
                                // letterSpacing: .5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : Container(),
                  watch.orderStatus == "Cancelled" ||
                          watch.orderStatus == "Shipped" ||
                          watch.orderStatus == "Delivered"
                      ? SizedBox(
                          height: 64.w,
                        )
                      : SizedBox(
                          height: 20.w,
                        ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Info ',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String url = Uri.encodeFull(watch.invoice.toString());
                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                          // read.downloadInvoise(
                          //     context,
                          //     watch
                          //         .customerPurchasePackageList
                          //         ?.orderID);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  top: 5.w,
                                  bottom: 5.w,
                                  right: 12.w),
                              decoration: BoxDecoration(
                                  color: Color(0xff4CDB06),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(child: Icon(Icons.download)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 11.w,
                  // ),
                  Text(
                    "${watch.paymentMode}",
                    // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 6.w,
                  ),
                  watch.paymentMode == "card"
                      ? Text(
                          'Card -  Payment Completed',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        )
                      : Container(
                          child: Text(
                          'Bank Transfer -  Payment Completed',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        )),
                  SizedBox(
                    height: 20.w,
                  ),

                  watch.orderStatus != 'Delivered'
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cargo Details',
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Cargo Name  : ',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${watch.cargoCompanyName} ',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cargo Tracking Number  : ',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 120.w,
                                  child: Text(
                                    ' ${watch.cargoTrackingNumber}reeygyteiuyiughiuhuihiujhyrtuihh yhiureuy',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Crago Tracking Url  : ',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('object');
                                    // print(watch.adsdata?.adsUrl);
                                    // watch.adsdata?.adsUrl;
                                    launchUrl(Uri.parse(
                                            '${(watch.cargoTrackingUrl)}'))
                                        .onError(
                                      (error, stackTrace) {
                                        print("Url is not valid!");
                                        return false;
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 150.w,
                                    child: Text(
                                      '${watch.cargoTrackingUrl}',
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          // fontStyle: FontStyle.italic,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                  watch.orderStatus != 'Cancelled'
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cancellation Details',
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Cancellation Reason : ',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '${watch.cancellationReason}',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Cancellation Date : ',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '${watch.cancellationDate}',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Cancelled By : ',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '${watch.cancellationBy}',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                  SizedBox(
                    height: 20.w,
                  ),
// rgbrut

                  watch.orderStatus == "Pending"
                      ? Text(
                          " Order's with pending status can only be canceled",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700),
                        )
                      : Container(),
                  SizedBox(
                    height: 20.w,
                  ),
                  // Orders that have already been shipped cannot be canceled
                  watch.orderStatus == "Pending"
                      // &&
                      // watch.orderStatus != "Shipped" &&
                      // watch.orderStatus != "Delivered"
                      ? PrimaryButton(
                          width: 366.w,
                          height: 40.h,
                          // borderRadius: BorderRadius.circular(),
                          borderRadius: 30,
                          // width: ScreenUtil().screenWidth,
                          color: Color(0xffF55C5C),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),

                                    // insetPadding:
                                    //    EdgeInsets.all(0),
                                    contentPadding: EdgeInsets.only(top: 0.0),
                                    content: ShopOrderDetailsCancellpopUp(
                                      shopOrderId: watch.shopOrderId,
                                    )));
                          },
                          child: Text(
                            "Cancellation Request",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.white,
                                // letterSpacing: .5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : Container(),
                  //  PrimaryButton(
                  //     width: 366.w,
                  //     height: 40.h,
                  //     // borderRadius: BorderRadius.circular(),
                  //     borderRadius: 30,
                  //     // width: ScreenUtil().screenWidth,
                  //     color: Color(0xffF55C5C),
                  //     onTap: () {
                  //       print('dgjriuby8utyt');
                  //     },
                  //     child: Text(
                  //       "Cancellation Request",
                  //       style: TextStyle(
                  //           fontFamily: 'Campton',
                  //           color: Colors.white,
                  //           // letterSpacing: .5,
                  //           fontSize: 15.sp,
                  //           fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.w,
            ),
          ],
        ),
      );
    });
  }
}
