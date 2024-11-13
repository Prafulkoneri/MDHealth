import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/styles/colors.dart';

class EarnAsYouSpend extends StatelessWidget {
  const EarnAsYouSpend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/md_coin_3d.png',
              height: 126.sp,
              width: 126.sp,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 28.sp,
                        letterSpacing: -2,
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                          text: 'Earn ',
                          style: TextStyle(
                            color: kDefaultActiveColor,
                            fontFamily: 'Campton',
                          )),
                      TextSpan(
                        text: 'as you spend',
                      ),
                      TextSpan(
                          text: '!',
                          style: TextStyle(
                            color: kDefaultActiveColor,
                            fontFamily: 'Campton',
                          )),
                    ]),
              ),
            )
          ],
        ));
  }
}
