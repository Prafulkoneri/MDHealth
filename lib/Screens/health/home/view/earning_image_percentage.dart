import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

// import '../../../widget/image_holder.dart';

class EarningImagePercentage extends StatelessWidget {
  const EarningImagePercentage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeViewController>();
    final watch = context.watch<HomeViewController>();
    return SizedBox(
      height: 220.h,
      // width: 200,
      width: ScreenUtil().screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: watch.purchaseDetails?.length ?? 0,
        itemBuilder: (context, index) {
          final element = watch.purchaseDetails?[index];
          return Container(
            // margin: const EdgeInsets.only(right: 20),
            width: 244.w,
            // height: 220.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 166.h,
                          // color: Colors.brown,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                                height: 136.h,
                                // decoration: const BoxDecoration(
                                //   borderRadius:
                                //       BorderRadius.all(Radius.circular(10)),
                                //   color: Colors.grey,
                                // ),
                                child: Image.network("${element?.imagePath}")),
                          ),
                        ),
                        Container(
                          width: 219.w,
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.blue,
                          alignment: Alignment.topCenter,
                          child: Center(
                            child: Text(
                              '${element?.percent}%',
                              style: TextStyle(
                                  fontSize: 63.sp,
                                  fontFamily: 'Campton',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.w,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "${element?.description}",
                      maxLines: 2, // Set maxLines to limit text to two lines
                      overflow: TextOverflow
                          .ellipsis, // Handle overflow with ellipsis

                      style: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
    // SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Padding(
    //     padding: EdgeInsets.only(left: 15),
    //     child: Row(
    //       children: [
    //         ImageHolder(
    //           amount: '2',
    //           imageUrl: 'assets/images/Rectangle_6.png',
    //           description:
    //               'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    //         ),
    //         ImageHolder(
    //           amount: '4',
    //           imageUrl: 'assets/images/Rectangle_7.png',
    //           description:
    //               'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    //         ),
    //         ImageHolder(
    //           amount: '2',
    //           imageUrl: 'assets/images/Rectangle_6.png',
    //           description:
    //               'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    //         ),
    //         ImageHolder(
    //           amount: '4',
    //           imageUrl: 'assets/images/Rectangle_7.png',
    //           description:
    //               'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
