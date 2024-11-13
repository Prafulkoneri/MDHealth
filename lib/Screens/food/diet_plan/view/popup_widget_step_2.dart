import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/food/diet_other/view/diet_form_view.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/view/payment_view_diet.dart';
import 'package:md_health/Screens/food/diet_plan/controller/dient_view_controller.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_view.dart';
import 'package:md_health/Screens/food/diet_plan/view/pop_up_type_step1.dart';
import 'package:md_health/Screens/food/diet_plan/view/popup_widget_step_1.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:md_health/diet_plan%20_payment/view/payment_view_diet.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class PopupDialogWidgetStepTwo extends StatefulWidget {
  final void Function()? onTap;
  // final String id;
  final String? food;
  final String? calories;
  final String? subscriptionType;
  final String? foodPackageId;

  const PopupDialogWidgetStepTwo({
    super.key,
    required this.onTap,
    required this.foodPackageId,
    this.food,
    this.calories,
    this.subscriptionType,
  });

  @override
  State<PopupDialogWidgetStepTwo> createState() =>
      _PopupDialogWidgetStepTwoState();
}

class _PopupDialogWidgetStepTwoState extends State<PopupDialogWidgetStepTwo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<String> list = ['Last Added', 'Price', 'Reviews'];
  bool isSelected = false;

  bool ifBreakfastSelected = false;

  bool ifLunchSelected = false;

  bool ifDinnerSelected = false;

  @override
  void initState() {
    // super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<DietPlanviewController>()
          .initState(context, "", "", "", widget.foodPackageId, '', '', '', '');
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showSubscriptionDialog(BuildContext context) {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final watch = context.watch<DietPlanviewController>();
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: CustomSelectBoxtypePopuP(
                // Use the dialogContext to watch the DietPlanviewController
                list: watch.whoPurhasedata!.subscriptionType!
                    .map((item) => item)
                    .toList(),
                title: const SelectBoxText(
                  text: 'Subscription Type',
                  fontWeight: FontWeight.w700,
                  icon: 'assets/icons/Calendar.svg',
                ),
                tapFun: () {
                  debugPrint('/////////////////////////helooo//////');
                },
                button: true,
                submitActionFnction: () {
                  Navigator.pop(dialogContext); // Use dialogContext here
                  // _animationController.reverse();
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<DietPlanviewController>();
    final watch = context.watch<DietPlanviewController>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
            height: ScreenUtil().screenHeight,
            // padding: EdgeInsets.only(top: 25.w),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 1,
                  left: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    padding:
                        EdgeInsets.only(bottom: 20.w, right: 10.w, left: 10.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 75.h,
                        ),
                        Text(
                          'Who is this purchase for?',
                          style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0.w, top: 17.w, right: 5.0.w),
                            child: DietDropdown(
                              value: "${watch.whoPurhasedata?.foodType ?? ""}",
                              title: 'Food Type',
                              // onTap: () {
                              //   _showFoodDialog();
                              // },
                            )),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.0.w, top: 17.w, right: 5.0.w),
                          child: DietDropdown(
                            value: watch.selectedTextIndextype == -1
                                ? 'Subscription'
                                : "${watch.whoPurhasedata?.subscriptionType?[watch.selectedTextIndextype] ?? ""}",
                            title: 'Subscription Type',
                            onTap: () {
                              _showSubscriptionDialog(context);
                            },
                            titleSvg: 'assets/icons/Calendar.svg',
                          ),
                        ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0.w,
                                bottom: 10.w,
                                top: 17.w,
                                right: 5.0.w),
                            child: DietDropdown(
                              value: "${watch.whoPurhasedata?.calories ?? ""}",
                              title: 'Max Calories',
                              onTap: () {
                                // _showCaloriesDialog();
                              },
                              // titleSvg: 'assets/icons/Group_18.svg',
                            )),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.0.w, bottom: 10.w, right: 5.0.w),
                          child: NewCalender(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Campton',
                                fontSize: 16.sp),
                            width: 2,
                            borderColor: black,
                            hintText: "Date",
                            controller: watch.BirthDateController,
                            readOnly: true,
                            onTap: () async {
                              var datePicked =
                                  await DatePicker.showSimpleDatePicker(
                                context,
                                initialDate: DateTime
                                    .now(), // Set the initial date to the current date
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2090),
                                dateFormat: "dd-MM-yyyy",
                                locale: DateTimePickerLocale.en_us,
                                looping: true,
                              );
                              if (datePicked != null) {
                                String date =
                                    DateFormat('dd-MM-yyyy').format(datePicked);
                                read.onToDateSelected(date);
                              }
                            },
                            suffix: GestureDetector(
                              onTap: () async {
                                var datePicked =
                                    await DatePicker.showSimpleDatePicker(
                                  context,
                                  initialDate: DateTime
                                      .now(), // Set the initial date to the current date
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2090),
                                  dateFormat: "dd-MM-yyyy",
                                  locale: DateTimePickerLocale.en_us,
                                  looping: true,
                                );
                                if (datePicked != null) {
                                  String date = DateFormat('dd-MM-yyyy')
                                      .format(datePicked);
                                  read.onToDateSelected(date);
                                }
                              },
                              child: const Icon(Icons.calendar_today_outlined,
                                  color: Colors.green),
                            ),
                            // hintFontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(bottom: 10.w, left: 30.w),
                          child: Text(
                            'Meals',
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: const Color(0xff8B8B8B),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        // ListView.builder(
                        //   padding: EdgeInsets.zero,
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: watch.mealTypeswho?.length ?? 0,
                        //   itemBuilder: (context, index) {
                        //     final element = watch.mealTypeswho?[index];
                        //     // Initialize selectAddonServicesList if it's null or not initialized properly
                        //     if (watch.selectAddonServicesList.length !=
                        //         watch.mealTypeswho?.length) {
                        //       watch.selectAddonServicesList = List.filled(
                        //         watch.mealTypeswho!.length,
                        //         false,
                        //       );
                        //     }
                        //     return Container(
                        //       margin: EdgeInsets.only(
                        //         left: 18,
                        //         right: 18.w,
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Expanded(
                        //             child: Padding(
                        //               padding: EdgeInsets.only(bottom: 10.w),
                        //               child: Text(
                        //                 "${element?.mealType}",
                        //                 style: TextStyle(
                        //                   fontFamily: 'Campton',
                        //                   fontSize: 18.sp,
                        //                   fontWeight: FontWeight.w700,
                        //                   letterSpacing: -1,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           PrimaryCheckBox(
                        //             color: Colors.red,
                        //             size: 22.w,
                        //             onChanged: (value) {
                        //               final mealType = element?.mealType ?? '';
                        //               read.onAddOnServicesSelected(
                        //                   context, index, mealType);
                        //             },
                        //             value: watch.selectAddonServicesList[index],
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // ),

                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: watch.mealTypeswho?.length ?? 0,
                          itemBuilder: (context, index) {
                            final element = watch.mealTypeswho?[index];

                            // Initialize selectAddonServicesList if it's null or not initialized properly
                            if (watch.selectAddonServicesList.length !=
                                watch.mealTypeswho?.length) {
                              watch.selectAddonServicesList = List.filled(
                                watch.mealTypeswho!.length,
                                false,
                              );
                            }

                            return Container(
                              margin: EdgeInsets.only(left: 18, right: 18.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 10.w),
                                      child: Text(
                                        "${element?.mealType}",
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  PrimaryCheckBox(
                                    color: Colors.red,
                                    size: 22.w,
                                    onChanged: (value) {
                                      final mealType = element?.mealType ?? '';
                                      read.onAddOnServicesSelected(
                                          context, index, mealType);
                                    },
                                    value: watch.selectAddonServicesList[index],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 15.w, bottom: 10.w),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 16.sp,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Price: ',
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: kDefaultActiveColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: "${watch.newSalePrice} ",
                                ),
                                TextSpan(
                                  text: "₺ ",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        // fontSize: 20.sp,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (watch.BirthDateController.text.isEmpty) {
                              Utils.showPrimarySnackbar(
                                context,
                                "Please Fill Subscription Start Date",
                                type: SnackType.error,
                              );
                            } else if (watch.selectedTextIndextype == -1) {
                              Utils.showPrimarySnackbar(
                                context,
                                "Please select Subscription Type",
                                type: SnackType.error,
                              );
                            } else if (watch.selectAddonServicesList
                                .every((element) => !element)) {
                              Utils.showPrimarySnackbar(context,
                                  'Please select at least one Meal type',
                                  type: SnackType.error);
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return PopupDialogWidgetStepOne(
                                    onTapText: 'Myself',
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Text(
                                        "Who is this purchase for?",
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      print("object");
                                      print(watch
                                          .whoPurhasedata?.subscriptionType);
                                      print(watch.BirthDateController.text);
                                      print(watch.foodpackageId);
                                      print(watch.selectAddonServicesList);
                                      print(
                                          "y5u6t6j  ${watch.whoPurhasedata?.subscriptionType?[watch.selectedTextIndextype]}  y5u6t6j");

                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return PaymentDetailsViewDiet(
                                            salePrice: watch.newSalePrice ?? '',
                                            type: "MySelf",
                                            subscriptionType: watch
                                                        .whoPurhasedata
                                                        ?.subscriptionType?[
                                                    watch
                                                        .selectedTextIndextype] ??
                                                '',
                                            subscriptionStartDate: watch
                                                    .BirthDateController.text ??
                                                '',
                                            foodPackageId:
                                                watch.foodpackageId ?? '',
                                          );
                                        },
                                      );
                                    },
                                    onTapButton2: () {
                                      print(watch.foodpackageId);
                                      print(
                                          "type${watch.whoPurhasedata?.subscriptionType}type");
                                      print(
                                          "date ${watch.BirthDateController.text}date");

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DietOtherInformationView(
                                            foodpackageId: watch.foodpackageId,
                                            birthDateController:
                                                watch.BirthDateController.text,
                                            subscriptionType: watch
                                                    .whoPurhasedata
                                                    ?.subscriptionType?[
                                                watch.selectedTextIndextype],
                                            type: "gift",
                                            salePrices: watch.newSalePrice,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            width: 300.w,
                            height: 41.h,
                            decoration: BoxDecoration(
                              color: kDefaultActiveColor,
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Center(
                              child: Text(
                                "Who is this meal for?",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // child: ,
                  ),
                ),
                Positioned(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    margin: EdgeInsets.symmetric(horizontal: 11.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        // size: Size.fromRadius(
                        //     10), // Image radius
                        child: const Image(
                            image:
                                AssetImage("assets/images/green_pop_up.png")),
                      ),
                    ),
                    // child: Image.asset(
                    //   'assets/images/green_pop_up.png',
                    //   color: kDefaultActiveColor,
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 1,
                  left: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pop_up.svg',
                        height: 60.h,
                        width: 60.w,
                        // alignment: Alignment.topRight,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0.w),
                        child: const Text(
                          "Step 1",
                          style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: -20,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 260.0, bottom: 110, top: 4),
                        child: SvgPicture.asset(
                          'assets/icons/CloseSquare.svg',
                        ),
                      ),
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
}
