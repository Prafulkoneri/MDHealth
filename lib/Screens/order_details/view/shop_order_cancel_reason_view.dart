import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/order_details/controller/shop_details_controller.dart';
import 'package:md_health/Screens/order_details/view/md_food_view.dart';
import 'package:md_health/Screens/order_details/view/md_shop_view.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/Screens/packages/view/packages_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class ShopOrderDetailsCancellpopUp extends StatefulWidget {
  final String? shopOrderId;
  // final String? packageId;
  // final String? cancelId;

  const ShopOrderDetailsCancellpopUp({
    super.key,
    this.shopOrderId,
    // this.purchaseId,
    // this.packageId,
    // this.cancelId,
  });

  @override
  State<ShopOrderDetailsCancellpopUp> createState() =>
      _ShopOrderDetailsCancellpopUpState();
}

class _ShopOrderDetailsCancellpopUpState
    extends State<ShopOrderDetailsCancellpopUp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     context
  //         .read<ShopListDetailsController>()
  //         .initState(context, widget.shopOrderId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ShopListDetailsController>();
    final watch = context.watch<ShopListDetailsController>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 450.h,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0.0))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Image border
                        child: SizedBox.fromSize(
                          child: Image(
                              image: AssetImage("assets/images/pop__new_.png")),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        // left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset("assets/icons/red_close.svg"),
                        )),
                    Positioned(
                        top: 25,
                        right: 0,
                        left: 0,
                        child: SvgPicture.asset("assets/icons/sad.svg")),
                    Positioned(
                      top: 80,
                      right: 72.w,
                      // left: 0,
                      child: Center(
                        child: Text(
                          "Request Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              // letterSpacing: .5,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 38.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 18.0.w),
                  child: Text(
                    "Cancellation Detail",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w, right: 10.w),
                  child: PrimaryInformationTextFormFieldreq(
                    borderRadius: 20.w,
                    controller: watch.reasonController,
                    maxLines: 100,
                    height: 100.w,
                    maxLength: 300,
                    hintText:
                        "Please write your treatment cancellation request in detail",
                    contentPadding: EdgeInsets.only(top: 20, left: 15),
                  ),
                ),
                SizedBox(
                  height: 38.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          read.onChecked();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5.w, bottom: 2.5.w),
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            color: watch.isChecked
                                ? kDefaultActiveColor
                                : const Color(0xffD9D9D9),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          " I confirm that I wish cancel my\n reservation",
                          style: TextStyle(
                              color: Colors.black,
                              // letterSpacing: .5,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: PrimaryButton(
                    width: 270.w,
                    height: 50.w,
                    borderRadius: 30,
                    color: Color(0xffF55C5C),
                    onTap: () async {
                      if (watch.isChecked &&
                          watch.reasonController.text.isNotEmpty) {
                        print(watch.reasonController);
                        // return;
                        print("object");
                        await read.deletedShopProduct(
                          context,
                          watch.orderId.toString(),
                        );
                        Navigator.push(
                          context,
                          SlidePageRoute(
                            page: OrderMdShopView(
                                // foodOrderID: element?.id.toString(),
                                // packageId:MdShopView
                                //     widget.packageId,
                                ),
                            direction: SlideDirection
                                .right, // Specify the slide direction here
                            delay: Duration(milliseconds: 5000),
                          ),
                        );
                        read.clearCancellationPopup();
                        Navigator.pop(context);
                      } else {
                        Utils.showPrimarySnackbar(
                            context, 'Please check the box and enter a reason',
                            type: SnackType.error);
                      }
                    },
                    child: Text(
                      "Submit Cancel Request",
                      style: TextStyle(
                          color: Colors.white,
                          // letterSpacing: .5,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String message, {SnackType type = SnackType.info}) {
    Utils.showPrimarySnackbar(
        _scaffoldKey.currentState as BuildContext, message,
        type: type);
  }
}
