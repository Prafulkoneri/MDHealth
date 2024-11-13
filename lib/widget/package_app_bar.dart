import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';
import 'package:md_health/Screens/notification/view/notification_view.dart';
import 'package:md_health/constants/styles/colors.dart';

class PackageAppBar extends StatelessWidget implements PreferredSizeWidget {
  PackageAppBar({
    super.key,
  });
  @override
  final Size preferredSize = Size.fromHeight(143);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/layer_blur.png'),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Container(
                // color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        final ScaffoldState? scaffoldState =
                            Scaffold.maybeOf(context);
                        scaffoldState?.openDrawer();
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 50),
                        // color: Colors.pink,
                        child: Container(
                          height: 50.h,
                          // alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: SvgPicture.asset(
                              'assets/icons/3_lines.svg',
                              alignment: Alignment.topLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            // color: Colors.red,
                            child: Image.asset(
                              'assets/images/katman_1.png',
                              height: 33.h,
                              width: 43.42.w,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Package",
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.white,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationView()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, top: 50),
                        child: SvgPicture.asset(
                          'assets/icons/box.svg',
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeView()),
                  // );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 17),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/backicon.svg',
                        alignment: Alignment.topRight,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.white,
                            // letterSpacing: 5.5,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
