import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/styles/colors.dart';

class CouldntFindTreatmentBox extends StatelessWidget {

  final Widget? widgetChild;
  final Widget? TopWidgetChild;
  final String? pngImage;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? imageWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? topWidgetHeight;

  const CouldntFindTreatmentBox({
    super.key,
    this.backgroundColor,
    required this.pngImage,
    required this.widgetChild,
    required this.height,
    this.width,
    this.padding,
    this.margin,
    required this.imageHeight,
    this.imageWidth,
    this.borderRadius,
    this.TopWidgetChild,
    this.topWidgetHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.w),
      width: double.infinity,
      // color: Colors.blue,
      child: Stack(children: [
              Container(
                height: topWidgetHeight?.h ?? imageHeight?.h  ,
                width: width?.w ?? 300.w,
                // color: Colors.red,
                child: TopWidgetChild??Container(),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: width?.w ?? 300.w,
                  height: height?.h,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 15.0)),
                    color: backgroundColor ?? kDefaultActiveColor,
                  ),
                  padding:  padding ?? EdgeInsets.fromLTRB(15.w,15.h,15.w,0),
                  child: widgetChild,
                ),
              ),

        Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              pngImage!,
              height: imageHeight?.h,
              width: imageWidth?.w,
              fit: BoxFit.cover,
            ))
      ]),
    );
  }
}