import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/order/view/order_view.dart';
import 'package:md_health/Screens/order_details/controller/order_list_controller.dart';
import 'package:md_health/Screens/order_details/view/shop_order_details_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import '../../../widget/loader.dart';

class OrderMdShopView extends StatefulWidget {
  final String? screenName;
  const OrderMdShopView({super.key, this.screenName});

  @override
  State<OrderMdShopView> createState() => _MdShopViewState();
}

class _MdShopViewState extends State<OrderMdShopView> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context.read<OrderListViewController>().initState(
            context,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    // final read = context.read<NewMainScreenController>();
    // final watch = context.watch<NewMainScreenController>();
    final read = context.read<OrderListViewController>();
    final watch = context.watch<OrderListViewController>();
    return Builder(builder: (context) {
      return BaseScreen(
        onWillPop: () async {
          Navigator.push(
            context,
            SlidePageRoute(
              page: OrderView(),

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
              // read.setCurrentScreen(2);
              // watch.currentScreen = PurchesItemView();
              Navigator.push(
                context,
                SlidePageRoute(
                  page: OrderView(),

                  direction:
                      SlideDirection.left, // Specify the slide direction here
                  delay: Duration(milliseconds: 5000),
                ),
              );
            },
            // hasHiText: true,
            hasBackButton: true,
            hasMdTitle: false,
            drawerTitle: "Orders - MDshop",
            // drawerStyle: RichText(text: text),
            drawerStyle: RichText(
              text: TextSpan(
                text: 'Orders - ',
                style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.white,
                  letterSpacing: -1,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'MD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'shop',
                    style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.white,
                      letterSpacing: -1,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        content: Container(
          padding:
              EdgeInsets.only(left: 18.w, top: 40.w, bottom: 10.h, right: 18.w),
          child: watch.isLoading
              ? Column(
                  children: [
                    SizedBox(height: 150.h),
                    const Loader(),
                  ],
                )
              : watch.shopOrderList?.isNotEmpty != true
                  ? Container(
                      child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120.h,
                          ),
                          SvgPicture.asset(
                            "assets/icons/No-orders-found.svg",
                            // width: 10,
                          ),
                        ],
                      ),
                    ))
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: watch.shopOrderList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final element = watch.shopOrderList?[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: ShopOrderDetailsOrderView(
                                  shopOrderId: element?.orderId.toString(),
                                  // packageId:OrderMdShopView
                                  //     widget.packageId,
                                ),
                                direction: SlideDirection
                                    .right, // Specify the slide direction here
                                delay: Duration(milliseconds: 5000),
                              ),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                bottom: 20.w,
                              ),
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  top: 24.w,
                                  bottom: 12.w,
                                  right: 8.w),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      element?.productImagePath == ""
                                          ? SizedBox(
                                              height: 50.w,
                                              width: 50.w,
                                              child: Image.asset(
                                                "assets/images/product_Square.png",
                                                fit: BoxFit.fill,
                                              ),
                                            )
                                          : SizedBox(
                                              height: 50.w,
                                              width: 50.w,
                                              child: AppNetworkImages(
                                                imageUrl:
                                                    "${element?.productImagePath}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      // Image(
                                      //   image:
                                      //       AssetImage("assets/images/product_Square.png"),
                                      // height: 48.h,
                                      // width: 48.w,
                                      // ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              // mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Order No: ${element?.orderId ?? 0}',
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 20.w,
                                                      top: 5.w,
                                                      bottom: 2.w,
                                                      right: 18.w),
                                                  decoration: BoxDecoration(
                                                      color: element
                                                                  ?.orderStatus ==
                                                              "Pending"
                                                          ? Color(0xffF3771D)
                                                          : element?.orderStatus ==
                                                                  "Packaging"
                                                              ? Colors.yellow
                                                              : element?.orderStatus ==
                                                                      "Shipped"
                                                                  ? const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      79,
                                                                      156,
                                                                      219)
                                                                  : element?.orderStatus ==
                                                                          "Delivered"
                                                                      ? Colors
                                                                          .green
                                                                      : element?.orderStatus ==
                                                                              "Cancelled"
                                                                          ? Colors
                                                                              .red
                                                                          : Colors
                                                                              .transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)),
                                                  child: Text(
                                                    "${element?.orderStatus}",
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              '${element?.productNames}- ${element?.productCount} Pcs',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Total Price : ',
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Color(0xff4CDB06),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700),

                                      /*defining default style is optional */
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${element?.totalPayment} ',
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
                                                // decoration: TextDecoration.underline,
                                                // fontFamily: 'Campton',
                                                color: Colors.black,
                                                // letterSpacing: .5,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
        ),
      );
    });
  }
}
