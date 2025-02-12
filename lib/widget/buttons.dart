import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final Color? textColor;
  final VoidCallback? onTap;
  final Widget? leading;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final Color? borderColor;
  final Widget? child;
  final EdgeInsets? padding;

  final TextStyle? textStyle;

  const PrimaryButton(
      {Key? key,
      this.leading,
      this.child,
      this.borderColor,
      this.width,
      this.height,
      this.fontSize,
      this.fontWeight,
      this.textColor,
      this.text,
      this.borderRadius,
      this.padding,
      required this.color,
      required this.onTap,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent, // Remove highlight color
      splashColor: Colors.transparent, // Remove splash color
      child: Container(
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? 45.w,
          padding: padding ?? EdgeInsets.zero,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius ?? 8.w),
              border: Border.all(color: borderColor ?? Colors.transparent)),
          child: leading ??
              Center(
                  child: child ??
                      Text(
                        "$text",
                        style: textStyle ??
                            TextStyle(
                                color: textColor ?? Colors.white,
                                fontWeight: fontWeight ?? FontWeight.w700,
                                fontSize: fontSize ?? 14.sp),
                      ))),
    );
  }
}
