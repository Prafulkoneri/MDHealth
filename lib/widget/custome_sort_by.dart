import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/constants/styles/textstyle.dart';

class CustomSelectBoxFillter extends StatefulWidget {
  final List<String> list;
  final String title;
  final bool? displayButton;
  final String? displayButtonText;
  final VoidCallback tapFun;
  final VoidCallback submitActionFnction;
  const CustomSelectBoxFillter(
      {super.key,
      required this.list,
      this.displayButton,
      this.displayButtonText,
      required this.title,
      required this.tapFun,
      required this.submitActionFnction});

  @override
  State<CustomSelectBoxFillter> createState() => _CustomSelectBoxFillterState();
}

class _CustomSelectBoxFillterState extends State<CustomSelectBoxFillter> {
  final List<String> cities = [
    'Istanbul',
    'İzmir',
    'Ankara',
    'Amsterdam',
    'Sofia'
  ];

  @override
  Widget build(BuildContext context) {
    var selected = false;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              height: 400.h,
              // color: Colors.red,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
                top: 10,
                right: 25,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/Close-Square.svg',
                    color: Colors.white,
                  ),
                )),
            Container(
              height: 100.h,
              width: 300.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Container(
                height: 10.w,
                width: 10.w,
                // color: Colors.red,
                padding: EdgeInsets.fromLTRB(30.w, 20.w, 30.w, 48.w),
                child: Image.asset(
                  'assets/icons/katman_1.png',
                  height: 10.h,
                  width: 10.w,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: 300.w,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: SelectBoxText(
                          text: widget.title,
                          // text: 'Choose your treatment city',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        height: 230.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.w),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Group_2.svg',
                                      height: 22.h,
                                      width: 22.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    SelectBoxText(text: widget.list[index])
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.w, vertical: 20.w),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: kDefaultActiveColor),
                        child: GestureDetector(
                          onTap: widget.submitActionFnction,
                          child: const Center(
                            child: SelectBoxText(
                              text: 'Choose',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
