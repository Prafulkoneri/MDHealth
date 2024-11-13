import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/order/view/order_view.dart';
import 'package:md_health/Screens/order_details/controller/order_list_controller.dart';
import 'package:md_health/Screens/order_details/view/order_detail_view.dart';
import 'package:md_health/Screens/purches_items/view/purches_item_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';

import '../../../widget/loader.dart';

class MdFoodView extends StatefulWidget {
  final String? screenName;
  const MdFoodView({super.key, this.screenName});

  @override
  State<MdFoodView> createState() => _MdFoodViewState();
}

class _MdFoodViewState extends State<MdFoodView> {
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
    final read = context.read<OrderListViewController>();
    final watch = context.watch<OrderListViewController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.push(
          context,
          SlidePageRoute(
            page: OrderView(),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.w),
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
          drawerTitle: "Orders - MDfood",
        ),
      ),
      content: Container(
        padding:
            EdgeInsets.only(left: 20.w, top: 48.w, bottom: 10.h, right: 18.w),
        child: watch.isLoading
            ? Column(
                children: [
                  SizedBox(height: 150.h),
                  const Loader(),
                ],
              )
            : watch.orderList?.isNotEmpty != true
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
                    itemCount: watch.orderList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final element = watch.orderList?[index];
                      return GestureDetector(
                        onTap: () {
                          print(element?.orderId.toString());
                          print(element?.packageFor);
                          // return;
                          Navigator.push(
                            context,
                            SlidePageRoute(
                              page: FoodOrderDetailsOrderView(
                                foodOrderID: element?.id.toString(),
                                packageFor: element?.packageFor,

                                // packageId:MdShopView
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
                              left: 15.w,
                              right: 12.w,
                              top: 24.w,
                              bottom: 12.w,
                            ),
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // showModalBottomSheet(
                                        //   backgroundColor: Colors.white,
                                        //   isScrollControlled: true,
                                        //   shape: const RoundedRectangleBorder(
                                        //       borderRadius: BorderRadius.only(
                                        //           topLeft: Radius.circular(30),
                                        //           topRight: Radius.circular(30))),
                                        //   context: context,
                                        //   builder: (context) {
                                        //     return const AddItemsBottomSheetView();
                                        //   },
                                        // );
                                      },
                                      child: element?.companyLogoImagePath == ""
                                          ? SizedBox(
                                              height: 50.w,
                                              width: 50.w,
                                              child: Image.asset(
                                                "assets/images/defaultimage.png",
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : SizedBox(
                                              height: 50.w,
                                              width: 50.w,
                                              child: AppNetworkImages(
                                                imageUrl:
                                                    "${element?.companyLogoImagePath}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      //  Image(
                                      //   image: NetworkImage(
                                      //       "${element?.companyLogoImagePath}"
                                      //       // "assets/images/product_Square.png"
                                      //       ),
                                      //   height: 52.h,
                                      //   width: 52.w,
                                      // ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order No: ${element?.orderId}',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${element?.packageName} ',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '- ${element?.packageDays} Days',
                                              style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Subscription:",
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              // // color: ,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.white10,
                                                  blurRadius: 5.0,
                                                ),
                                              ],
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                height: 20.w,
                                                child: Card(
                                                  color:
                                                      element?.subscriptionType ==
                                                              "Daily"
                                                          ? Color(0xff4CDB06)
                                                          : Colors.white,
                                                  elevation: 10,
                                                  child: Row(
                                                    children: [
                                                      // SizedBox(
                                                      //   width: 5.w,
                                                      // ),
                                                      Container(
                                                        height: 20,
                                                        width: 15.w,
                                                        color:
                                                            Color(0xff4CDB06),
                                                        child: Text(
                                                          "${element?.useDays}",
                                                          // "${element. ?? 0}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Campton',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                          textAlign:
                                                              TextAlign.end,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Container(
                                                        width: 40.w,
                                                        child: Text(
                                                          "Days",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Campton',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Remaining Days: ${element?.remainingDays} Days",
                                        style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
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
                                        text:
                                            '${element?.foodPackageTotalPrice}',
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
  }
}
