import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeSectionText extends StatelessWidget {
  final String text;
  const HomeSectionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'CamptonThin',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500),
    );
  }
}

class MdRichTextWidget extends StatelessWidget {
  final double? fontSize;
  final String? mdTitle;

  const MdRichTextWidget({super.key, this.fontSize, this.mdTitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            fontFamily: 'Campton',
            color: Colors.white,
            fontSize: fontSize?.sp ?? 20.sp,
            fontWeight: FontWeight.w700),
        children: <TextSpan>[
          const TextSpan(
            text: 'MD',
          ),
          TextSpan(
            text: mdTitle ?? 'health',
            style: const TextStyle(
              fontFamily: 'CamptonThin',
            ),
          ),
        ],
      ),
    );
  }
}

class SelectBoxText extends StatelessWidget {
  final String text;
  final String? icon;
  final FontWeight? fontWeight;

  const SelectBoxText({
    super.key,
    this.fontWeight,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var weight = fontWeight ?? FontWeight.w400;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(icon ?? ''),
        SizedBox(width: 2.w),
        Text(
          text!,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Campton',
              fontSize: 18.sp,
              fontWeight: weight),
        ),
      ],
    );
  }
}

const kMenuBox = TextStyle(
    color: Colors.black,
    fontFamily: 'Campton',
    fontSize: 20,
    fontWeight: FontWeight.w700);
const kSelectBox = TextStyle(
    color: Colors.black,
    fontFamily: 'Campton',
    fontSize: 17,
    fontWeight: FontWeight.w400);
const kSelectBoxSearch = TextStyle(
    color: Colors.black,
    fontFamily: 'Campton',
    fontSize: 16,
    fontWeight: FontWeight.w600);
