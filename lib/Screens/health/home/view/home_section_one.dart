import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/home/controller/home_controller.dart';
import 'package:md_health/Screens/health/home/view/custome_select_treatemnet_box.dart';
import 'package:md_health/Screens/health/search/controller/search_view_controller.dart';
import 'package:md_health/Screens/health/search/view/search_view.dart';
import 'package:md_health/Screens/health/home/view/custom_select_box.dart';
import 'package:md_health/constants/styles/textstyle.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:provider/provider.dart';

class HomeScreenSectionOne extends StatefulWidget {
  const HomeScreenSectionOne({super.key});

  @override
  State<HomeScreenSectionOne> createState() => _HomeScreenSectionOneState();
}

class _HomeScreenSectionOneState extends State<HomeScreenSectionOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
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

/////////////////Last//////////////////
  void _showDialog() {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final watch = context.watch<HomeViewController>();
        final read = context.read<HomeViewController>();
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: CustomSelectBox(
                list: watch.newCityList!.map((item) => item.cityName).toList(),
                title: const SelectBoxText(
                  text: 'Choose your treatment city',
                  fontWeight: FontWeight.w700,
                ),
                tapFun: () {
                  debugPrint('/////////////////////////helooo//////');
                },
                button: true,
                submitActionFnction: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
      },
    );
  }

  //////////////////////////////////
  void _showDialog1() {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final watch = context.watch<HomeViewController>();
        final read = context.read<HomeViewController>();
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: CustomSelectBoxTreatment(
                list: watch.treatmentList!
                    .map((item) => item.treatmentName)
                    .toList(),
                title: const SelectBoxText(
                  text: 'Choose your treatment',
                  fontWeight: FontWeight.w700,
                ),
                tapFun: () {
                  read.NewCitiestratment(context, watch.treatmentName);
                  debugPrint('///Praful////');
                },
                button: true,
                submitActionFnction: () {
                  Navigator.pop(context);
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
    final watch = context.watch<HomeViewController>();
    final read = context.read<HomeViewController>();
    final readS = context.read<SearchViewController>();

    return Column(
      children: [
        Center(
          child: Text(
            "PLAN YOUR TREATMENT",
            style: TextStyle(
                fontFamily: 'Campton',
                color: const Color(0xff4CDB06),
                fontSize: 25.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          "NOW",
          style: TextStyle(
              fontFamily: 'Campton',
              color: Colors.white,
              fontSize: 72.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () {
            read.showMap(context, false);
          },
          child: const HomeSectionText(
            text: "Choose your treatment city",
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Card(
          surfaceTintColor: Colors.blue,
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              debugPrint('/////////////');
              if (watch.newCityList != null) {
                _showDialog1();
              } else {
                //show alert
                //no internet
              }
            },
            child: Container(
              color: Colors.transparent,
              height: 45.h,
              width: MediaQuery.of(context).size.width * 0.82,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeSectionText(
                      // text: 'istanbul',
                      text: watch.selectedTextIndex1 != -1
                          ? watch.selectedText1
                          : "Treatment"),
                  SvgPicture.asset(
                    'assets/icons/iconamoon_arrow-up-2.svg',
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Card(
          surfaceTintColor: Colors.blue,
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              debugPrint('/////////////');
              if (watch.newCityList != null) {
                _showDialog();
              } else {}
            },
            child: Container(
              color: Colors.transparent,
              height: 45.h,
              width: MediaQuery.of(context).size.width * 0.82,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeSectionText(
                    text: watch.selectedTextIndex != -1
                        ? watch.selectedText
                        : 'City',
                  ),
                  SvgPicture.asset(
                    'assets/icons/iconamoon_arrow-up-2.svg',
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45.h,
              width: MediaQuery.of(context).size.width * 0.82,
              child: TextField(
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'CamptonThin',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
                onChanged: (value) {},
                controller: watch.searchController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hintText: 'Search by Treatment Name',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'CamptonThin',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        PrimaryButton(
          color: const Color(0xff4CDB06),
          onTap: () {
            if (watch.selectedText1 == "") {
              Utils.showPrimarySnackbar(context, 'Please select treatment type',
                  type: SnackType.error);
              return;
            }
            print('*****************');
            print(watch.selectedText1);
            print('*****************');
            print(watch.selectedText);
            print('object');
            print(watch.searchController.text);
            print('object');
            // return;
            Navigator.push(
              context,
              SlidePageRoute(
                page: SearchView(
                  services: '',
                  rating: '',
                  prices: '',
                  treatmentName: watch.selectedText1,
                  // refresh: false,
                  cityName: watch.selectedText,
                  searchtreatment: watch.searchController.text,
                  platformType: "android",
                ),
                direction:
                    SlideDirection.right, // Specify the slide direction here
                // delay: Duration(milliseconds: 8000),
              ),
            );
          },
          height: 50,
          width: MediaQuery.of(context).size.width * 0.82,
          borderRadius: 30,
          child: Text(
            'Search',
            style: TextStyle(
              fontFamily: 'Campton',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        )
      ],
    );
  }
}

Widget _circle() {
  return Container(
    height: 150,
    width: 150,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xff4CDB06),
    ),
  );
}
