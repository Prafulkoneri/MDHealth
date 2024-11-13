import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/food/diet_plan/view/popup_widget_step_2.dart';
import 'package:md_health/Screens/order_details/controller/order_details_food_controller.dart';
import 'package:md_health/Screens/order_details/view/food_add_review_pop_up.dart';
import 'package:md_health/Screens/order_details/view/md_food_view.dart';
import 'package:md_health/Screens/order_details/view/renew_food_pop_up.dart';
import 'package:md_health/Screens/order_details/view/show_food_review_pop_up.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodOrderDetailsOrderView extends StatefulWidget {
  final String? foodOrderID;
  final String? packageFor;
  const FoodOrderDetailsOrderView(
      {super.key, required this.foodOrderID, this.packageFor});

  @override
  State<FoodOrderDetailsOrderView> createState() =>
      _FoodOrderDetailsOrderViewState();
}

class _FoodOrderDetailsOrderViewState extends State<FoodOrderDetailsOrderView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context.read<OrderListFoodViewController>().initState(
            context,
            widget.foodOrderID,
          );
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

  void showStepOneDialog({String? id, String? orderId, String? type}) {
    debugPrint('/////////////$id///////////////');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      barrierDismissible: true, // Allow closing the dialog by tapping outside

      builder: (BuildContext context) {
        return Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                    0, MediaQuery.of(context).size.height * _animation.value),
                child: Container(
                  padding: EdgeInsets.only(top: 30.w, left: 10.w, right: 10.w),
                  child: RenewPopupDialogWidgetStepTwo(
                      type: type.toString(),
                      id: orderId.toString(),
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
                ),
              );
            },
          ),
        );
      },
    );
  }
  ////////////////////////REnew/////////////////////////////////

  // void showStepOneDialognew({
  //   String? initialPrice,
  //   String? id,
  //   String? purchaseFor,
  //   String? foodType,
  //   List<String>? mealType,
  //   String? status,
  //   String? maxcalories,
  //   String? subType,
  // }) {
  //   debugPrint('/////////////$id///////////////');
  //   _animationController.reset();
  //   _animationController.forward();
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AnimatedBuilder(
  //         animation: _animation,
  //         builder: (context, child) {
  //           return Transform.translate(
  //             offset: Offset(
  //                 0, MediaQuery.of(context).size.height * _animation.value),
  //             child: PopupDialogWidgetStepTwoReNew(
  //                 initialPrice: initialPrice,
  //                 // declare meal type
  //                 // declare status there
  //                 mealType: mealType,
  //                 status: status,
  //                 foodPackageId: id.toString(),
  //                 foodOrderID: widget.foodOrderID,
  //                 packageFor: widget.packageFor,
  //                 food: foodType,
  //                 calories: maxcalories,
  //                 subscriptionType: subType,
  //                 onTap: () {
  //                   // Navigator.pop(context);
  //                   // showDialog(
  //                   //     context: context,
  //                   //     builder: (BuildContext context) {
  //                   //       return PopupDialogWidgetStepOne(
  //                   //         onTapText: 'Myself',
  //                   //         child: Padding(
  //                   //           padding: EdgeInsets.symmetric(horizontal: 10.w),
  //                   //           child: Text(
  //                   //             "Who is this purchase for?",
  //                   //             style: TextStyle(
  //                   //               fontFamily: 'Campton',
  //                   //               color: Colors.black,
  //                   //               fontSize: 17.sp,
  //                   //               fontWeight: FontWeight.w600,
  //                   //             ),
  //                   //           ),
  //                   //         ),
  //                   //         onTap: () {
  //                   //           Navigator.pop(context);
  //                   //           showDialog(
  //                   //               context: context,
  //                   //               builder: (BuildContext context) {
  //                   //                 return PaymentDetailsViewDiet();
  //                   //               });
  //                   //         },
  //                   //         onTapButton2: () {
  //                   //           Navigator.push(
  //                   //             context,
  //                   //             MaterialPageRoute(
  //                   //                 builder: (context) =>
  //                   //                     const InformationFormView()),
  //                   //           );
  //                   //         },
  //                   //       );
  //                   //     });
  //                 }),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  Widget build(BuildContext context) {
    final read = context.read<OrderListFoodViewController>();
    final watch = context.watch<OrderListFoodViewController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.push(
          context,
          SlidePageRoute(
            page: MdFoodView(
                // packageId:MdShopView
                //     widget.packageId,
                ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );

        return true;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: CustomAppBar(
          onBackPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: MdFoodView(
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
          drawerTitle: "Order No : ${watch.foodOrderId.toString()}",
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
          //  padding: EdgeInsets.only(
          //       left: 18.w, top: 17.w, bottom: 9.h, right: 18.w),
          Container(
              margin: EdgeInsets.only(
                  left: 18.w, top: 17.w, bottom: 9.h, right: 18.w),
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
                      watch.orderFoodDetails?.companyLogoImagePath == ""
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
                                    "${watch.orderFoodDetails?.companyLogoImagePath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  watch.orderFoodDetails?.packageName ?? "",
                                  // 'Product Name',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Price :",
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subcription',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${watch.orderFoodDetails?.foodPackageTotalPrice ?? ""} ',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),

                                    /*defining default style is optional */
                                    children: <TextSpan>[
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
                            ),
                            GestureDetector(
                              onTap: () {
                                print("object");
                                read.toggleMenuDetails();
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Menu Details ',
                                    style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  watch.showMenuDetails == true
                                      ? Icon(Icons.arrow_drop_up)
                                      : Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          watch.showMenuDetails == true
              ? Container(
                  margin:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.w),
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      border: Border.all(color: Colors.grey)),
                  height: 100.h, // Set a fixed height for the container
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: watch.menuList?.length ??
                        0, // Number of items in the outer ListView
                    itemBuilder: (context, index) {
                      final element = watch.menuList?[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${element?.category} - ",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Menu",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 90.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50
                                        .h, // Set a fixed height for the inner ListView
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics: NeverScrollableScrollPhysics(),

                                      itemCount: watch.mealType?.length ??
                                          0, // Number of items in the inner ListView
                                      itemBuilder: (context, index) {
                                        final element = watch.mealType?[index];
                                        return Text(
                                          '${element?.meal}',
                                          style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: Colors.green,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50
                                        .h, // Set a fixed height for the inner ListView
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,

                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: watch.mealName
                                          ?.length, // Number of items in the inner ListView
                                      itemBuilder: (context, index) {
                                        final element = watch.mealName?[index];
                                        return Text(
                                          '${element}',
                                          style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : Container(),
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
                  ],
                ),

// If not showing menu details, return an empty container

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
                        borderRadius: BorderRadius.circular(3.w),
                        color: watch.orderFoodDetails?.orderStatus == "Pending"
                            ? Color(0xffF3771D)
                            : watch.orderFoodDetails?.orderStatus ==
                                    "in_progress"
                                ? Colors.yellow
                                : watch.orderFoodDetails?.orderStatus ==
                                        "Completed"
                                    ? Colors.green
                                    : watch.orderFoodDetails?.orderStatus ==
                                            "Cancelled"
                                        ? Colors.red
                                        : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          watch.orderFoodDetails?.orderStatus ?? "",
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
                            text:
                                '${watch.orderFoodDetails?.foodPackageTotalPrice ?? ""} ',
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
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    watch.orderFoodDetails?.orderStatus == "completed"
                        ? Container()
                        : Container(
                            child: watch.orderFoodDetails?.reviewFound != "yes"
                                ? GestureDetector(
                                    onTap: () {
                                      print(watch.orderFoodDetails?.packageName
                                          .toString());
                                      print(watch.orderFoodDetails?.id
                                          .toString());
                                      print(watch
                                          .orderFoodDetails?.foodPackageIdnew
                                          .toString());
                                      // return;
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15.0))),
                                              contentPadding:
                                                  EdgeInsets.only(top: 0.0),
                                              content: FoodReviewPopUp(
                                                  packageName: watch
                                                      .orderFoodDetails
                                                      ?.packageName,
                                                  orderId: watch
                                                      .orderFoodDetails
                                                      ?.foodPackageIdnew
                                                      .toString(),
                                                  packageId: watch
                                                      .orderFoodDetails?.id
                                                      .toString())));
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
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          'Add Reviews',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      print(watch.orderFoodDetails?.packageName
                                          .toString());
                                      print(watch.orderFoodDetails?.id
                                          .toString());
                                      print(watch
                                          .orderFoodDetails?.foodPackageIdnew
                                          .toString());
                                      // return;
                                      read.getFoodReview(
                                          context,
                                          watch.orderFoodDetails?.id
                                              .toString());
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15.0))),
                                              contentPadding:
                                                  EdgeInsets.only(top: 0.0),
                                              content: ShowFoodReviewPopUp(
                                                packageName: watch
                                                    .orderFoodDetails
                                                    ?.packageName,
                                                orderId: watch
                                                    .orderFoodDetails?.id
                                                    .toString(),
                                                // packageId: watch
                                                //     .orderFoodDetails?.foodPackageIdnew
                                                //     .toString()
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
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          'Submited Reviews',
                                          style: TextStyle(
                                              fontFamily: 'Campton',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                    GestureDetector(
                      onTap: () async {
                        // call functionality from 200 of below method's api call.
                        String url = Uri.encodeFull(
                            watch.orderFoodDetails!.invoicePdfPath.toString());
                        if (await canLaunch(url)) {
                          launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                        // read.fooddownloadInvoise(
                        //     context, watch.orderFoodDetails?.orderId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 10.w, top: 5.w, bottom: 5.w, right: 12.w),
                            decoration: BoxDecoration(
                                color: Color(0xff4CDB06),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(child: Icon(Icons.download)),
                          ),
                        ],
                      ),
                    )
                  ],
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
                  'Package Details ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "${watch.orderFoodDetails?.calories ?? ""}"
                  ",${watch.orderFoodDetails?.foodType ?? ""}",

                  // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Address ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8.w,
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
                  height: 2.w,
                ),
                Text(
                  watch.orderFoodDetails?.address ?? "",

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
                  '${watch.orderFoodDetails?.cityName ?? ""} / ${watch.orderFoodDetails?.countryName ?? ""}',
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
                  'Invoice Address ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Text(
                  watch.orderFoodDetails?.address ?? "",
                  // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Text(
                  '${watch.orderFoodDetails?.cityName ?? ""} / ${watch.orderFoodDetails?.countryName ?? ""}',
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
                  'Payment Info ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 11.w,
                ),
                watch.orderFoodDetails?.paymentMethod == "bank"
                    ? Text(
                        "Bank Transfer",
                        // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )
                    : Container(),
                SizedBox(
                  height: 6.w,
                ),
                watch.orderFoodDetails?.paymentMethod == "card"
                    ? Text(
                        'Card Payment',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )
                    : Container(),
                watch.orderFoodDetails?.paymentMethod == "md_coin"
                    ? Text(
                        "MD Coin",
                        // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )
                    : Container(),
                watch.orderFoodDetails?.paymentMethod == "bank"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Transaction ID : ",
                                // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "${watch.orderFoodDetails?.transactionId ?? ''}",
                                // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Bank Discription ",
                                // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "${watch.orderFoodDetails?.transactionDis ?? ''}",
                                // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
                Text(
                  "${watch.orderFoodDetails?.subscriptionStartDate}",
                  // 'via Credit / Debit Card  ( **** **** **** 9892 )',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Text(
                  'Subcription Info ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 14.w,
                ),
                Text(
                  'Subscription : ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // // color: ,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white10,
                              blurRadius: 5.0,
                            ),
                          ],
                          border: Border.all(color: Colors.white)),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 20.w,
                            child: Card(
                              elevation: 10,
                              child: Row(
                                children: [
                                  // SizedBox(
                                  //   width: 5.w,
                                  // ),
                                  Container(
                                    height: 20,
                                    width: 30.w,
                                    color: Color(0xff4CDB06),
                                    child: Text(
                                      "${watch.orderFoodDetails?.useDays ?? 0}",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    width: 80.w,
                                    child: Text(
                                      "Days",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        Text(
                          "Remaining Time :",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "${watch.orderFoodDetails?.remainingDays} Days",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                PrimaryButton(
                  // borderRadius: BorderRadius.circular(),
                  borderRadius: 30,
                  // width: ScreenUtil().screenWidth,
                  color: Color(0xff4CDB06),
                  onTap: () {
                    print(
                      watch.orderFoodDetails?.orderId.toString(),
                    );
                    print(watch.orderFoodDetails?.foodPackageIdnew.toString());
                    // return;
                    showStepOneDialog(
                        type: watch.orderFoodDetails?.type,
                        orderId: watch.orderFoodDetails?.orderId.toString(),
                        id: watch.orderFoodDetails?.foodPackageIdnew
                            .toString());
                  },
                  child: Text(
                    "Renew Subscription",
                    style: TextStyle(
                        color: Colors.white,
                        // letterSpacing: .5,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Table(
                        // border: TableBorder.all(color: Colors.black),
                        columnWidths: {
                          0: FlexColumnWidth(),
                          1: FlexColumnWidth(),
                          2: FlexColumnWidth(),
                          3: FlexColumnWidth(),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Date',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Status',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Remark',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Date & Time',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          for (var element in watch.sales ?? [])
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('${element?.date}'),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('${element?.foodStatus}'),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('${element?.remark}'),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('${element?.createDate}'),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 100.w,
                      ),
                    ],
                  ),
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
  }
}
