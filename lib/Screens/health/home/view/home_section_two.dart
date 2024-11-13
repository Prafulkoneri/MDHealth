import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/person_information/controller/person_information_form_controller.dart';
import 'package:md_health/Screens/person_information/view/person_information_form_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/Screens/health/home/view/earning_image_percentage.dart';
import 'package:md_health/Screens/health/home/view/find_your_package.dart';
import 'package:md_health/widget/earn_as_you_spend.dart';

class HomeScreenSectionTwo extends StatefulWidget {
  const HomeScreenSectionTwo({super.key});

  @override
  State<HomeScreenSectionTwo> createState() => _HomeScreenSectionTwoState();
}

class _HomeScreenSectionTwoState extends State<HomeScreenSectionTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(left: 22.w, top: 10.w, right: 22.w),
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                SlidePageRoute(
                  page: PersonInformationFormView(

                      // packageId: watch.packageId,
                      ),
                  direction:
                      SlideDirection.right, // Specify the slide direction here
                  delay: Duration(milliseconds: 5000),
                ),
                // MaterialPageRoute(
                //     builder: (context) => PersonInformationFormView())
              );
            },
            child: Image(
              image: AssetImage(
                "assets/images/teatment-package.png",
              ),
              width: 400.w,
              height: 150.h,
            ),
          ),
          EarnAsYouSpend(),
          EarningImagePercentage(),
          FindYourPackage(),
        ],
      ),
    );
  }
}
