// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:md_health/constants/styles/colors.dart';

// typedef RatingChangeCallback = void Function(double rating);

// class NewRCRating extends StatelessWidget {
//   final int starCount;
//   final double rating;
//   final RatingChangeCallback onRatingChanged;
//   final Color? color;

//   const NewRCRating(
//       {super.key,
//       this.starCount = 5,
//       this.rating = .0,
//       required this.onRatingChanged,
//       this.color});

//   Widget buildStar(BuildContext context, int index) {
//     Widget icon;
//     if (index >= rating) {
//       icon = Padding(
//         padding: EdgeInsets.only(right: 9.77.w),
//         child: SvgPicture.asset("assets/icons/order_rating.svg"),
//       );
//     }
//     // else if (index > rating - 1 && index < rating) {
//     //   icon = new Icon(
//     //     Icons.star_half,
//     //     color: color ?? Theme.of(context).primaryColor,
//     //   );
//     // }
//     else {
//       icon = Padding(
//         padding: EdgeInsets.only(right: 9.77.w),
//         child: SvgPicture.asset(
//           "assets/icons/order_rating.svg",
//           color: kDefaultActiveColor,
//         ),
//       );
//     }
//     return InkResponse(
//       onTap: onRatingChanged == null
//           ? null
//           : () {
//               onRatingChanged(index + 1.0);
//             },
//       child: icon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         children:
//             List.generate(starCount, (index) => buildStar(context, index)));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef RatingChangeCallback = void Function(double rating);

class NewRCRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color? color;

  const NewRCRating(
      {super.key,
      this.starCount = 10,
      this.rating = 0,
      required this.onRatingChanged,
      this.color});

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if (index >= rating) {
      icon = Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Column(
          children: [
            Text(
              (index + 1).toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      );
    } else {
      icon = Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Column(
          children: [
            Text(
              (index + 1).toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                  color: Color(0xff4CDB06),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      );
    }
    return InkResponse(
      onTap: onRatingChanged == null
          ? null
          : () {
              onRatingChanged(index + 1.0);
            },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
