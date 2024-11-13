import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/food/card_diet/view/Diet_payment_complated.dart';
import 'package:md_health/Screens/payment/view/payment_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'dart:math' as math;

class DietPaymentProcessingView extends StatefulWidget {
  String? foodPackageId;
  String? type;
  String? foodPackageTotalPrice;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  String? paymentMethod;
  String? platformtype;
  String? mdCoins;
  String? patiendId;
  DietPaymentProcessingView({
    super.key,
    required this.foodPackageId,
    required this.type,
    required this.foodPackageTotalPrice,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
    required this.paymentMethod,
    required this.platformtype,
    this.mdCoins,
    this.patiendId,
  });

  @override
  State<DietPaymentProcessingView> createState() =>
      _DietPaymentProcessingViewState();
}

class _DietPaymentProcessingViewState extends State<DietPaymentProcessingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  void initState() {
    print('************ ${widget.patiendId} ************');
    super.initState();

    // Add a delay to navigate to the next page after two seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Replace 'NextPage()' with the actual page you want to navigate to
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => DietPaymentCompletedView(),
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: PaymentView(

                // packageId: watch.packageId,
                ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
          // MaterialPageRoute(builder: (context) => PaymentView())
        );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.pushReplacement(
            context,
            SlidePageRoute(
              page: PaymentView(

                  // packageId: watch.packageId,
                  ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: Duration(milliseconds: 5000),
            ),
            // MaterialPageRoute(builder: (context) => PaymentView())
          );
        },
        hasBackButton: true,
        hasMdTitle: false,
        // drawerTitle: "Orders",
      ),
      content: Column(
        children: [
          SizedBox(
            height: 28.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PLEASE WAIT",
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: const Color(0xff4CDB06),
                    // letterSpacing: .5,
                    fontSize: 29.sp,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 66.h,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/katman_1.png',
              height: 89.h,
              width: 110.42.w,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Processing Continues...",
            style: TextStyle(
                fontFamily: 'Campton',
                color: black,
                // letterSpacing: .5,
                fontSize: 26.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}