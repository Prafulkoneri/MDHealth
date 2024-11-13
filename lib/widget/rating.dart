import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef RatingChangeCallback = void Function(double rating);

class NewStarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color? color;

  const NewStarRating(
      {super.key,
      this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      this.color});

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if (index >= rating) {
      icon = Padding(
        padding: EdgeInsets.only(right: 9.77.w, top: 5.w),
        child: SvgPicture.asset(
          "assets/icons/order_rating.svg",
          height: 20.w,
        ),
      );
    } else {
      icon = Padding(
        padding: EdgeInsets.only(right: 9.77.w, top: 5.w),
        child: SvgPicture.asset(
          "assets/icons/order_rating.svg",
          color: Color(0xff4CDB06),
          height: 20.w,
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
