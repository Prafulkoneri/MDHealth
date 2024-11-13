// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/address/controller/address_controller.dart';
// import 'package:md_health/Screens/address/view/add_address_pop_up.dart';
// import 'package:md_health/Screens/address/view/edit_address_view.dart';
// import 'package:md_health/Screens/food/diet_plan%20_payment/controller/diet_plan_controller.dart';
// import 'package:md_health/Screens/profile/controller/profile_controller.dart';
// import 'package:md_health/Screens/reports/view/view/report_list_view.dart';
// import 'package:md_health/Screens/search/view/search_details_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/check_box.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:provider/provider.dart';

// class ShopAddressView extends StatefulWidget {
//   // final String? screenName;
//   final String? foodPackageId;
//   final String? subscriptionStartDate;
//   final String? subscriptionType;
//   final String? type;
//   final String? patientId;
//   final String? salePrice;
//   final String? selectedMeals;
//   final String? screenName;
//   final String? orderId;
//   const ShopAddressView(
//       {super.key,
//       this.screenName,
//       this.foodPackageId,
//       this.subscriptionStartDate,
//       this.subscriptionType,
//       this.type,
//       this.patientId,
//       this.salePrice,
//       this.selectedMeals,
//       this.orderId});

//   @override
//   State<ShopAddressView> createState() => _ShopAddressViewState();
// }

// class _ShopAddressViewState extends State<ShopAddressView> {
//   @override
//   void initState() {
//     print("object");
//     print(widget.screenName);
//     print("object");

//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<DietPlanPaymertController>().initState(
//             context,
//             widget.foodPackageId,
//             widget.subscriptionStartDate,
//             widget.subscriptionType,
//             widget.type,
//             widget.patientId,
//             widget.salePrice,
//           );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<DietPlanPaymertController>();
//     final watch = context.watch<DietPlanPaymertController>();

//     return RefreshIndicator(
//       onRefresh: () async {
//         await read.getAddresslist(context);
//       },
//       child: BaseScreen(
//         onWillPop: () async {
//           if (widget.screenName == "foodPayment") {
//             print('girojgiojytiohiot');

//             Navigator.pushReplacement(
//               context,
//               SlidePageRoute(
//                 page: EditAddressView(

//                     // packageId: watch.packageId,
//                     ),
//                 direction:
//                     SlideDirection.left, // Specify the slide direction here
//                 delay: Duration(milliseconds: 5000),
//               ),
//               // MaterialPageRoute(
//               //     builder: (context) => InformationFormView
//               //             // SearchDetailsView
//               //             (
//               //           packageId: watch.packageId,
//               //           screenName: "infotmation",
//               //           // packageId: watch.packageId,
//               //         ))
//             );
//           } else {
//             print('435894538943589745879');
//             // Navigator.pushReplacement(
//             //   context,
//             //   SlidePageRoute(
//             //     page: SearchDetailsView(
//             //         // packageId: widget.packageId,

//             //         // packageId: watch.packageId,
//             //         ),
//             //     direction:
//             //         SlideDirection.left, // Specify the slide direction here
//             //     delay: Duration(milliseconds: 5000),
//             //   ),
//             //   // MaterialPageRoute(
//             //   //     builder: (context) => SearchDetailsView(
//             //   //           packageId: watch.packageId,
//             //   //         ))
//             // );
//             return true;
//           }

//           // Navigator.pop(context);

//           return true;
//         },
//         backgroundColor: Color(0xffF5F5F5),
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(130.h),
//           child: CustomAppBar(
//             // drawerTitleColor: Colors.green,
//             drawerTitle: 'Address',
//             // hasBackButton: true,
//             hasMdTitle: false,
//             // drawerTitle: "Orders",
//           ),
//         ),
//         content: Builder(builder: (context) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 15.w,
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 10.w, right: 10.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Address Type - ',
//                           style: TextStyle(
//                               letterSpacing: -0.5,
//                               color: Color(0xff000000),
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'Campton',
//                               fontSize: 18.sp),
//                         ),
//                         Text(
//                           '( Home/Office/Other )',
//                           style: TextStyle(
//                               letterSpacing: -0.5,
//                               color: kDefaultActiveColor,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'Campton',
//                               fontSize: 14.sp),
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           SlidePageRoute(
//                             page: NewAddressView(
//                                 // packageId: widget.packageId,

//                                 // packageId: watch.packageId,
//                                 ),
//                             direction: SlideDirection
//                                 .left, // Specify the slide direction here
//                             delay: Duration(milliseconds: 5000),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         // width: 120.w,
//                         padding: EdgeInsets.only(
//                           left: 5.w,
//                           right: 5.w,
//                           top: 5.w,
//                           bottom: 5.w,
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.green,
//                             borderRadius: BorderRadius.circular(5.w)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SvgPicture.asset(
//                               'assets/icons/add.svg',
//                               height: 10.w,
//                               // color: Colors.black,
//                             ),
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             Text(
//                               'Add Address',
//                               style: TextStyle(
//                                   letterSpacing: -0.5,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500,
//                                   fontFamily: 'Campton',
//                                   fontSize: 10.sp),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10.w,
//               ),
//               Container(
//                 // height: 100,
//                 padding: EdgeInsets.all(10),
//                 child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: watch.addressListData?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     final element = watch.addressListData?[index];
//                     return Container(
//                       padding:
//                           EdgeInsets.only(bottom: 10, left: 20.w, right: 20.w),
//                       margin: EdgeInsets.only(bottom: 10.w),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5.w),
//                           color: Color.fromARGB(144, 206, 206, 206),
//                           border: Border.all(width: 0.1.w, color: Colors.grey)),
//                       // height: 100,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 10.w,
//                           ),
//                           PrimaryCheckBox(
//                             size: 40,
//                             color: Colors.red,
//                             value: watch.selectedIndex == index,
//                             onChanged: (value) {
//                               read.toggleCheckBox(index);
//                               print(watch
//                                   .selectedIndex); // Debugging line to check selected index
//                             },
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${element?.address}',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w500,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             'Address',
//                             style: TextStyle(
//                                 letterSpacing: -0.5,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w700,
//                                 fontFamily: 'Campton',
//                                 fontSize: 12.sp),
//                           ),
//                           SizedBox(
//                             height: 4.w,
//                           ),
//                           Text(
//                             '${element?.addressName}',
//                             style: TextStyle(
//                                 letterSpacing: -0.5,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w400,
//                                 fontFamily: 'Campton',
//                                 fontSize: 12.sp),
//                           ),
//                           SizedBox(
//                             height: 10.w,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Country',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                               Text(
//                                 'City',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 4.w,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '${element?.countryName}',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                               Text(
//                                 '${element?.cityName}',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10.w,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Postal Code',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                               Text(
//                                 'Phone No.',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 4.w,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '${element?.postalCode}',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                               Text(
//                                 '+91 ${element?.phoneNo}',
//                                 style: TextStyle(
//                                     letterSpacing: -0.5,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: 'Campton',
//                                     fontSize: 12.sp),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/address/controller/address_controller.dart';
import 'package:md_health/Screens/address/view/add_address_pop_up.dart';
import 'package:md_health/Screens/address/view/edit_address_view.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/controller/diet_plan_controller.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/view/add_food_address.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/view/payment_view_diet.dart';
import 'package:md_health/Screens/profile/controller/profile_controller.dart';
import 'package:md_health/Screens/reports/view/view/report_list_view.dart';
import 'package:md_health/Screens/health/search/view/search_details_view.dart';
import 'package:md_health/Screens/shop/shop_cart/controller/cart_details_controller.dart';
import 'package:md_health/Screens/shop/shop_cart/view/add_shop_address.dart';
import 'package:md_health/Screens/shop/shop_cart/view/cart_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:provider/provider.dart';

class FoodSelectAddressView extends StatefulWidget {
  // final String? addressID;
  // final String? id;
  final String? foodPackageId;
  final String? subscriptionStartDate;
  final String? subscriptionType;
  final String? type;
  final String? patientId;
  final String? salePrice;
  final String? selectedMeals;
  final String? screenName;
  final String? orderId;
  const FoodSelectAddressView({
    super.key,
    this.foodPackageId,
    this.subscriptionStartDate,
    this.subscriptionType,
    this.type,
    this.patientId,
    this.salePrice,
    this.selectedMeals,
    this.screenName,
    this.orderId,
  });

  @override
  State<FoodSelectAddressView> createState() => _FoodSelectAddressViewState();
}

class _FoodSelectAddressViewState extends State<FoodSelectAddressView> {
  @override
  void initState() {
    // print("object");
    // print(widget.addressID);
    // print("object");

    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<DietPlanPaymertController>().initState(
            context,
            widget.foodPackageId,
            widget.subscriptionStartDate,
            widget.subscriptionType,
            widget.type,
            widget.patientId,
            widget.salePrice,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<DietPlanPaymertController>();
    final watch = context.watch<DietPlanPaymertController>();

    return RefreshIndicator(
      onRefresh: () async {
        await read.getAddresslist(context);
      },
      child: BaseScreen(
        onWillPop: () async {
          // if (widget.screenName == "foodPayment") {
          //   print('girojgiojytiohiot');

          Navigator.pushReplacement(
            context,
            SlidePageRoute(
              page: PaymentDetailsViewDiet(
                salePrice: widget.salePrice,
                type: widget.type,
                subscriptionType: widget.subscriptionType,
                subscriptionStartDate: widget.subscriptionStartDate,
                foodPackageId: watch.foodpackageId,
                // packageId: watch.packageId,
              ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: const Duration(milliseconds: 5000),
            ),
            // MaterialPageRoute(
            //     builder: (context) => InformationFormView
            //             // SearchDetailsView
            //             (
            //           packageId: watch.packageId,
            //           screenName: "infotmation",
            //           // packageId: watch.packageId,
            //         ))
          );
          // } else {
          print('435894538943589745879');
          // Navigator.pushReplacement(
          //   context,
          //   SlidePageRoute(
          //     page: SearchDetailsView(
          //         // packageId: widget.packageId,

          //         // packageId: watch.packageId,
          //         ),
          //     direction:
          //         SlideDirection.left, // Specify the slide direction here
          //     delay: Duration(milliseconds: 5000),
          //   ),
          //   // MaterialPageRoute(
          //   //     builder: (context) => SearchDetailsView(
          //   //           packageId: watch.packageId,
          //   //         ))
          // );
          //   return true;
          // }

          // Navigator.pop(context);

          return true;
        },
        backgroundColor: const Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: CustomAppBar(
            hasBackButton: true,
            onBackPressed: () {
              Navigator.pushReplacement(
                context,
                SlidePageRoute(
                  page: PaymentDetailsViewDiet(
                    salePrice: widget.salePrice,
                    type: widget.type,
                    subscriptionType: widget.subscriptionType,
                    subscriptionStartDate: widget.subscriptionStartDate,
                    foodPackageId: watch.foodpackageId,
                    // packageId: watch.packageId,
                  ),
                  direction:
                      SlideDirection.left, // Specify the slide direction here
                  delay: const Duration(milliseconds: 5000),
                ),
                // MaterialPageRoute(
                //     builder: (context) => InformationFormView
                //             // SearchDetailsView
                //             (
                //           packageId: watch.packageId,
                //           screenName: "infotmation",
                //           // packageId: watch.packageId,
                //         ))
              );
            },
            // drawerTitleColor: Colors.green,
            drawerTitle: 'Address',
            // hasBackButton: true,
            hasMdTitle: false,
            // drawerTitle: "Orders",
          ),
        ),
        content: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.w,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Address Type - ',
                          style: TextStyle(
                              letterSpacing: -0.5,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Campton',
                              fontSize: 18.sp),
                        ),
                        Text(
                          '( Home/Office/Other )',
                          style: TextStyle(
                              letterSpacing: -0.5,
                              color: kDefaultActiveColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Campton',
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          SlidePageRoute(
                            page: FoodNewAddressView(
                                // packageId: widget.packageId,

                                // packageId: watch.packageId,
                                ),
                            direction: SlideDirection
                                .left, // Specify the slide direction here
                            delay: const Duration(milliseconds: 5000),
                          ),
                        );
                      },
                      child: Container(
                        // width: 120.w,
                        padding: EdgeInsets.only(
                          left: 5.w,
                          right: 5.w,
                          top: 5.w,
                          bottom: 5.w,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/add.svg',
                              height: 10.w,
                              // color: Colors.black,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Add Address',
                              style: TextStyle(
                                  letterSpacing: -0.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Campton',
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Container(
                // height: 100,
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: watch.addressListData?.length ?? 0,
                  itemBuilder: (context, index) {
                    final element = watch.addressListData?[index];
                    return Container(
                      padding:
                          EdgeInsets.only(bottom: 10, left: 20.w, right: 20.w),
                      margin: EdgeInsets.only(bottom: 10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          // color: const Color.fromARGB(144, 206, 206, 206),
                          border: Border.all(width: 0.1.w, color: Colors.grey)),
                      // height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.w,
                          ),
                          // PrimaryCheckBox(
                          //   size: 20,
                          //   color: Colors.red,
                          //   value: watch.selectAddressIndex == index,
                          //   onChanged: (value) async {
                          //     print(element?.id);
                          //     print("Checkbox toggled");
                          //     read.selectAddresBox(index, element?.id);
                          //     // read.cartDetailsView(
                          //     //     context, watch.selectAddressID);
                          //     print(watch
                          //         .selectAddressIndex); // Debugging line to check selected index
                          //     // Navigator.pop(context);
                          //     await Future.delayed(Duration(seconds: 1));
                          //     Navigator.push(
                          //       context,
                          //       SlidePageRoute(
                          //         page: ShopCartScreenView(
                          //           id: widget.id.toString(),
                          //           addressID: element?.id.toString(),
                          //         ),
                          //         direction: SlideDirection.right,
                          //         delay: Duration(milliseconds: 50000),
                          //       ),
                          //     );
                          //     print(
                          //         "Selected Address ID: ${read.selectAddressID}"); // Print t
                          //     // print(element?.id);
                          //     // print("fdsujihfdasuifehuijhfdsjhfds");
                          //     // read.toggleCheckBox(index, element?.id);
                          //     // print(watch
                          //     //     .selectedIndex); // Debugging line to check selected index
                          //   },
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  PrimaryCheckBox(
                                    size: 20,
                                    color: Colors.red,
                                    value: watch.selectAddressIndex == index,
                                    onChanged: (value) async {
                                      print(element?.id);
                                      print("Checkbox toggled");
                                      read.selectAddresBox(index, element?.id);
                                      // read.cartDetailsView(
                                      //     context, watch.selectAddressID);
                                      print(watch
                                          .selectAddressIndex); // Debugging line to check selected index
                                      // Navigator.pop(context);
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      Navigator.push(
                                        context,
                                        SlidePageRoute(
                                          page: PaymentDetailsViewDiet(
                                            salePrice: widget.salePrice,
                                            type: widget.type,
                                            subscriptionType:
                                                widget.subscriptionType,
                                            subscriptionStartDate:
                                                widget.subscriptionStartDate,
                                            foodPackageId: watch.foodpackageId,
                                            // id: widget.id.toString(),
                                            // addressID: element?.id.toString(),
                                          ),
                                          direction: SlideDirection.right,
                                          delay: Duration(milliseconds: 50000),
                                        ),
                                      );
                                      print(
                                          "Selected Address ID: ${read.selectAddressID}"); // Print t
                                      // print(element?.id);
                                      // print("fdsujihfdasuifehuijhfdsjhfds");
                                      // read.toggleCheckBox(index, element?.id);
                                      // print(watch
                                      //     .selectedIndex); // Debugging line to check selected index
                                    },
                                  ),
                                  Text(
                                    '${element?.address}',
                                    style: TextStyle(
                                        letterSpacing: -0.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Campton',
                                        fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Text(
                            'Address',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Campton',
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 4.w,
                          ),
                          Text(
                            '${element?.addressName}',
                            style: TextStyle(
                                letterSpacing: -0.5,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Campton',
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Campton',
                                    fontSize: 12.sp),
                              ),
                              Text(
                                'City',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Campton',
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${element?.countryName}',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Campton',
                                    fontSize: 12.sp),
                              ),
                              Text(
                                '${element?.cityName}',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Campton',
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Postal Code',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Campton',
                                    fontSize: 12.sp),
                              ),
                              Text(
                                'Phone No.',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Campton',
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${element?.postalCode}',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Campton',
                                    fontSize: 12.sp),
                              ),
                              Text(
                                '+91 ${element?.phoneNo}',
                                style: TextStyle(
                                    letterSpacing: -0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Campton',
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
