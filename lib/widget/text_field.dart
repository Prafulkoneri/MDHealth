// // import 'package:country_code_picker/country_code_picker.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter/services.dart';
// // import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// // import 'package:md_health/constants/styles/colors.dart';

// // class PrimaryCTextFormField extends StatelessWidget {
// //   final String? titleHeader;
// //   final bool? readOnly;
// //   final double? height;
// //   final double? width;
// //   final int? maxLines;
// //   void Function(String)? onChanged;
// //   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
// //   final TextEditingController? controller;
// //   final String? hintText;
// //   final Widget? suffix;
// //   final Color? color;
// //   final bool? enableBorder;
// //   final Color? borderColor;
// //   final void Function()? onTap;
// //   final TextStyle? hintStyle;
// //   final TextStyle? textStyle;
// //   final TextInputType? textInputType;

// //   PrimaryCTextFormField(
// //       {Key? key,
// //       this.onTap,
// //       this.textStyle,
// //       this.borderColor,
// //       this.maxLines,
// //       this.height,
// //       this.width,
// //       this.hintStyle,
// //       this.color,
// //       this.enableBorder,
// //       this.suffix,
// //       this.controller,
// //       this.titleHeader,
// //       this.readOnly,
// //       this.textInputType,
// //       this.onChanged,
// //       this.lengthLimitingTextInputFormatter,
// //       this.hintText})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         titleHeader != null
// //             ? Row(
// //                 children: [
// //                   Text(
// //                     titleHeader ?? "",
// //                     style: TextStyle(
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 14.sp,
// //                         color: const Color(0xff3A3A3A)),
// //                   ),
// //                 ],
// //               )
// //             : Container(),
// //         titleHeader != null
// //             ? SizedBox(
// //                 height: 10.w,
// //               )
// //             : Container(),
// //         SizedBox(
// //           height: height ?? 48.w,
// //           width: MediaQuery.of(context).size.width,
// //           child: TextFormField(
// //             keyboardType: textInputType,
// //             style: textStyle,
// //             onTap: onTap,
// //             maxLines: maxLines ?? 1,
// //             readOnly: readOnly ?? false,
// //             onChanged: onChanged,
// //             inputFormatters: [
// //               lengthLimitingTextInputFormatter ??
// //                   LengthLimitingTextInputFormatter(1000),
// //             ],
// //             controller: controller,
// //             decoration: InputDecoration(
// //               suffixIcon: suffix,
// //               fillColor: Colors.white,
// //               filled: true,
// //               hintText: hintText,
// //               contentPadding: EdgeInsets.only(left: 10.w),
// //               hintStyle: hintStyle ??
// //                   TextStyle(
// //                       fontSize: 16.sp,
// //                       fontWeight: FontWeight.w400,
// //                       color: const Color(0xffB7B7B7)),
// //               enabledBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: borderColor ?? const Color(0xffEFEFEF),
// //                 ),
// //                 borderRadius: BorderRadius.circular(5.w),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   color: borderColor ?? const Color(0xffE0E0E0),
// //                 ),
// //                 borderRadius: BorderRadius.circular(5.w),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // ////////////////////////////////////////////////////////////
// // class PrimaryInformationTextFormField extends StatelessWidget {
// //   final String? titleHeader;
// //   final bool? readOnly;
// //   final double? height;
// //   final double? width;
// //   final int? maxLines;
// //   final EdgeInsets? contentPadding;
// //   void Function(String)? onChanged;
// //   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
// //   final TextEditingController? controller;
// //   final String? hintText;
// //   final Widget? suffix;
// //   final Color? color;
// //   final bool? enableBorder;
// //   final Color? borderColor;
// //   final void Function()? onTap;
// //   final TextStyle? hintStyle;
// //   final TextStyle? textStyle;
// //   final TextInputType? textInputType;

// //   final double? borderRadius;

// //   PrimaryInformationTextFormField(
// //       {Key? key,
// //       this.onTap,
// //       this.textStyle,
// //       this.borderColor,
// //       this.maxLines,
// //       this.height,
// //       this.width,
// //       this.hintStyle,
// //       this.color,
// //       this.enableBorder,
// //       this.suffix,
// //       this.contentPadding,
// //       this.controller,
// //       this.titleHeader,
// //       this.readOnly,
// //       this.textInputType,
// //       this.onChanged,
// //       this.lengthLimitingTextInputFormatter,
// //       this.hintText,
// //       this.borderRadius})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         titleHeader != null
// //             ? Row(
// //                 children: [
// //                   Text(
// //                     titleHeader ?? "",
// //                     style: TextStyle(
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 14.sp,
// //                         color: const Color(0xff3A3A3A)),
// //                   ),
// //                 ],
// //               )
// //             : Container(),
// //         titleHeader != null
// //             ? SizedBox(
// //                 height: 10.w,
// //               )
// //             : Container(),
// //         SizedBox(
// //           height: height ?? 48.w,
// //           width: MediaQuery.of(context).size.width,
// //           child: TextFormField(
// //             keyboardType: textInputType,
// //             style: textStyle,
// //             onTap: onTap,
// //             maxLines: maxLines ?? 1,
// //             readOnly: readOnly ?? false,
// //             onChanged: onChanged,
// //             inputFormatters: [
// //               lengthLimitingTextInputFormatter ??
// //                   LengthLimitingTextInputFormatter(1000),
// //             ],
// //             controller: controller,
// //             decoration: InputDecoration(
// //               suffixIcon: suffix,
// //               fillColor: Colors.white,
// //               filled: true,
// //               hintText: hintText,
// //               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
// //               hintStyle: hintStyle ??
// //                   TextStyle(
// //                       fontSize: 16.sp,
// //                       fontWeight: FontWeight.w400,
// //                       color: const Color(0xffB7B7B7)),
// //               enabledBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: borderColor ?? const Color(0xff989898),
// //                 ),
// //                 borderRadius: BorderRadius.circular(10.w),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   color: kDefaultActiveColor,
// //                 ),
// //                 borderRadius: BorderRadius.circular(10.w),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // ////////////////////////////////////////////////////////////
// // class PrimarySTextFormField extends StatelessWidget {
// //   final String? titleHeader;
// //   final bool? readOnly;
// //   final double? height;
// //   final double? width;
// //   final int? maxLines;
// //   void Function(String)? onChanged;
// //   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
// //   final TextEditingController? controller;
// //   final String? hintText;
// //   final Widget? suffix;
// //   final Color? color;
// //   final bool? enableBorder;
// //   final double? hintFontSize;
// //   final FontWeight? fontWeight;
// //   final EdgeInsetsGeometry? padding;
// //   final TextInputType? textInputType;
// //   final TextStyle? titleStyle;
// //   final void Function()? onTap;
// //   final TextStyle? textStyle;
// //   final bool isPasswordFeild;
// //   final bool isObscuringHeart = false;
// //   final FocusNode? focusNode;
// //   final void Function()? onEditingComplete;
// //   final TextInputAction? textInputAction;

// //   final TextCapitalization? textCapitalization;

// //   PrimarySTextFormField(
// //       {Key? key,
// //       this.color,
// //       this.onTap,
// //       this.padding,
// //       this.height,
// //       this.width,
// //       this.hintFontSize,
// //       this.maxLines,
// //       this.enableBorder,
// //       this.suffix,
// //       this.controller,
// //       this.titleHeader,
// //       this.readOnly,
// //       this.onChanged,
// //       this.lengthLimitingTextInputFormatter,
// //       this.textInputType,
// //       this.fontWeight,
// //       this.titleStyle,
// //       this.hintText,
// //       this.textStyle,
// //       this.focusNode,
// //       this.isPasswordFeild = false,
// //       this.onEditingComplete,
// //       this.textInputAction,
// //       this.textCapitalization})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             titleHeader != null
// //                 ? Text(
// //                     // textAlign: TextAlign.start,
// //                     titleHeader ?? "",
// //                     style: titleStyle ??
// //                         TextStyle(
// //                             letterSpacing: 5.5,
// //                             fontWeight: FontWeight.w500,
// //                             fontSize: 10.sp,
// //                             color: const Color(0xffFFFFFF)),
// //                   )
// //                 : Container(),
// //           ],
// //         ),
// //         titleHeader != null
// //             ? SizedBox(
// //                 height: 15.w,
// //               )
// //             : Container(),
// //         SizedBox(
// //           // height: height ?? 48.w,
// //           // width: MediaQuery.of(context).size.width ?? 48,
// //           child: TextFormField(
// //             style: textStyle ??
// //                 TextStyle(
// //                   color: Colors.white,
// //                   fontFamily: 'Campton',
// //                   fontSize: 21.sp,
// //                   fontWeight: FontWeight.w500,
// //                   // letterSpacing: isPasswordFeild ? 0 : -0.5
// //                 ),
// //             onTap: onTap,
// //             textCapitalization: textCapitalization ?? TextCapitalization.none,
// //             textInputAction: textInputAction ?? null,
// //             obscureText: isPasswordFeild ? true : false,
// //             enableSuggestions: isPasswordFeild ? false : true,
// //             autocorrect: isPasswordFeild ? false : true,
// //             obscuringCharacter: isObscuringHeart ? '❤' : '*',
// //             maxLines: maxLines ?? 1,
// //             keyboardType: textInputType,
// //             readOnly: readOnly ?? false,
// //             onChanged: onChanged,
// //             onEditingComplete: onEditingComplete ?? () {},
// //             // inputFormatters: [
// //             //   lengthLimitingTextInputFormatter ??
// //             //       LengthLimitingTextInputFormatter(1000),

// //             //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
// //             // ],
// //             focusNode: focusNode ?? null,
// //             controller: controller,
// //             decoration: InputDecoration(
// //               // border:
// //               //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
// //               // border: BorderRadius.circular(),
// //               suffixIcon: suffix,
// //               // fillColor: Colors.white,
// //               filled: true,
// //               labelStyle: TextStyle(color: Colors.white),
// //               hintText: hintText,
// //               // contentPadding: padding ??
// //               //     EdgeInsets.only(
// //               //         left: 10.w, top: maxLines != null ? 30.w : 0.w),
// //               hintStyle: TextStyle(
// //                   fontSize: hintFontSize ?? 16.sp,
// //                   fontWeight: fontWeight ?? FontWeight.w400,
// //                   color: color ?? const Color(0xffB7B7B7)),
// //               enabledBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: enableBorder ?? false
// //                       ? const Color(0xffE0E0E0)
// //                       : const Color(0xffEFEFEF),
// //                 ),
// //                 borderRadius: BorderRadius.circular(55.w),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: enableBorder ?? false
// //                       ? const Color(0xffE0E0E0)
// //                       : const Color(0xffEFEFEF),
// //                 ),
// //                 borderRadius: BorderRadius.circular(55.w),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // ////////////////////////////////////////////////
// // class PrimarySTextFormFieldChat extends StatelessWidget {
// //   final String? titleHeader;
// //   final bool? readOnly;
// //   final double? height;
// //   final double? width;
// //   final int? maxLines;
// //   void Function(String)? onChanged;
// //   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
// //   final TextEditingController? controller;
// //   final String? hintText;
// //   final Widget? suffix;
// //   final Color? color;
// //   final bool? enableBorder;
// //   final double? hintFontSize;
// //   final FontWeight? fontWeight;
// //   final EdgeInsetsGeometry? padding;
// //   final TextInputType? textInputType;
// //   final TextStyle? titleStyle;
// //   final void Function()? onTap;
// //   final TextStyle? textStyle;
// //   final bool isPasswordFeild;

// //   PrimarySTextFormFieldChat(
// //       {Key? key,
// //       this.color,
// //       this.onTap,
// //       this.padding,
// //       this.height,
// //       this.width,
// //       this.hintFontSize,
// //       this.maxLines,
// //       this.enableBorder,
// //       this.suffix,
// //       this.controller,
// //       this.titleHeader,
// //       this.readOnly,
// //       this.onChanged,
// //       this.lengthLimitingTextInputFormatter,
// //       this.textInputType,
// //       this.fontWeight,
// //       this.titleStyle,
// //       this.hintText,
// //       this.textStyle,
// //       this.isPasswordFeild = false})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             titleHeader != null
// //                 ? Text(
// //                     // textAlign: TextAlign.start,
// //                     titleHeader ?? "",
// //                     style: titleStyle ??
// //                         TextStyle(
// //                             letterSpacing: 5.5,
// //                             fontWeight: FontWeight.w500,
// //                             fontSize: 10.sp,
// //                             color: const Color(0xffFFFFFF)),
// //                   )
// //                 : Container(),
// //           ],
// //         ),
// //         titleHeader != null
// //             ? SizedBox(
// //                 height: 15.w,
// //               )
// //             : Container(),
// //         SizedBox(
// //           // height: height ?? 48.w,
// //           // width: MediaQuery.of(context).size.width ?? 48,
// //           child: TextFormField(
// //             style: textStyle ??
// //                 TextStyle(
// //                     color: Colors.white,
// //                     fontFamily: 'Campton',
// //                     fontSize: 21.sp,
// //                     fontWeight: FontWeight.w500,
// //                     letterSpacing: isPasswordFeild ? 0 : -0.5),
// //             onTap: onTap,
// //             obscureText: isPasswordFeild ? true : false,
// //             enableSuggestions: isPasswordFeild ? false : true,
// //             autocorrect: isPasswordFeild ? false : true,
// //             maxLines: maxLines ?? 1,
// //             keyboardType: textInputType,
// //             readOnly: readOnly ?? false,
// //             onChanged: onChanged,
// //             // inputFormatters: [
// //             //   lengthLimitingTextInputFormatter ??
// //             //       LengthLimitingTextInputFormatter(1000),

// //             //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
// //             // ],
// //             controller: controller,
// //             decoration: InputDecoration(
// //               fillColor: Colors.white,
// //               // border:
// //               //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
// //               // border: BorderRadius.circular(),
// //               suffixIcon: suffix,
// //               // fillColor: Colors.white,
// //               filled: true,
// //               labelStyle: TextStyle(color: Color(0xffFBFBFB)),
// //               hintText: hintText,
// //               // contentPadding: padding ??
// //               //     EdgeInsets.only(
// //               //         left: 10.w, top: maxLines != null ? 30.w : 0.w),
// //               hintStyle: TextStyle(
// //                   fontSize: hintFontSize ?? 16.sp,
// //                   fontWeight: fontWeight ?? FontWeight.w400,
// //                   color: Color(0xffB5B4B4)),
// //               enabledBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: enableBorder ?? false
// //                       ? const Color(0xffE0E0E0)
// //                       : const Color(0xffEFEFEF),
// //                 ),
// //                 borderRadius: BorderRadius.only(
// //                   topRight: Radius.circular(0.w),
// //                   topLeft: Radius.circular(
// //                       20.w), // Set the top-right corner to be non-circular
// //                   bottomRight: Radius.circular(
// //                       20.w), // Set the bottom-left corner to be non-circular
// //                   bottomLeft: Radius.circular(0.w),
// //                 ),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: enableBorder ?? false
// //                       ? const Color(0xffE0E0E0)
// //                       : const Color(0xffEFEFEF),
// //                 ),
// //                 // borderRadius: BorderRadius.circular(55.w),
// //                 borderRadius: BorderRadius.only(
// //                   topRight: Radius.circular(0.w),
// //                   topLeft: Radius.circular(
// //                       20.w), // Set the top-right corner to be non-circular
// //                   bottomRight: Radius.circular(
// //                       20.w), // Set the bottom-left corner to be non-circular
// //                   bottomLeft: Radius.circular(0.w),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // /////////////////////////////////////////////////
// // class PrimaryInformationTextFormFieldNew extends StatelessWidget {
// //   final String? titleHeader;
// //   final bool? readOnly;
// //   final double? height;
// //   final double? width;
// //   final int? maxLines;
// //   final EdgeInsets? contentPadding;
// //   void Function(String)? onChanged;
// //   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
// //   final TextEditingController? controller;
// //   final String? hintText;
// //   final Widget? suffix;
// //   final Color? color;
// //   final bool? enableBorder;
// //   final Color? borderColor;
// //   final void Function()? onTap;
// //   final TextStyle? hintStyle;
// //   final TextStyle? textStyle;
// //   final TextInputType? textInputType;

// //   PrimaryInformationTextFormFieldNew(
// //       {Key? key,
// //       this.onTap,
// //       this.textStyle,
// //       this.borderColor,
// //       this.maxLines,
// //       this.height,
// //       this.width,
// //       this.hintStyle,
// //       this.color,
// //       this.enableBorder,
// //       this.suffix,
// //       this.contentPadding,
// //       this.controller,
// //       this.titleHeader,
// //       this.readOnly,
// //       this.textInputType,
// //       this.onChanged,
// //       this.lengthLimitingTextInputFormatter,
// //       this.hintText})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         titleHeader != null
// //             ? Row(
// //                 children: [
// //                   Text(
// //                     titleHeader ?? "",
// //                     style: TextStyle(
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 14.sp,
// //                         color: const Color(0xff3A3A3A)),
// //                   ),
// //                 ],
// //               )
// //             : Container(),
// //         titleHeader != null
// //             ? SizedBox(
// //                 height: 10.w,
// //               )
// //             : Container(),
// //         SizedBox(
// //           height: height ?? 48.w,
// //           width: MediaQuery.of(context).size.width,
// //           child: TextFormField(
// //             keyboardType: textInputType,
// //             style: textStyle,
// //             onTap: onTap,
// //             maxLines: maxLines ?? 1,
// //             readOnly: readOnly ?? false,
// //             onChanged: onChanged,
// //             inputFormatters: [
// //               lengthLimitingTextInputFormatter ??
// //                   LengthLimitingTextInputFormatter(1000),
// //             ],
// //             controller: controller,
// //             decoration: InputDecoration(
// //               suffixIcon: suffix,
// //               fillColor: Colors.white,
// //               filled: true,
// //               hintText: hintText,
// //               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
// //               hintStyle: hintStyle ??
// //                   TextStyle(
// //                       fontSize: 16.sp,
// //                       fontWeight: FontWeight.w400,
// //                       color: const Color(0xffB7B7B7)),
// //               enabledBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: borderColor ?? const Color(0xff989898),
// //                 ),
// //                 borderRadius: BorderRadius.circular(20.w),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   color: borderColor ?? const Color(0xff989898),
// //                 ),
// //                 borderRadius: BorderRadius.circular(20.w),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // //////////////////////////////////////////////
// // class MobilenumberTextField extends StatelessWidget {
// //   final String? titleHeader;
// //   final bool? readOnly;
// //   final double? height;
// //   final double? width;
// //   final int? maxLines;
// //   void Function(String)? onChanged;
// //   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
// //   final TextEditingController? controller;
// //   final String? hintText;
// //   final Widget? suffix;
// //   final Color? color;
// //   final bool? enableBorder;
// //   final double? hintFontSize;
// //   final FontWeight? fontWeight;
// //   final EdgeInsetsGeometry? padding;
// //   final TextInputType? textInputType;
// //   final void Function()? onTap;
// //   final void Function()? onEditingComplete;
// //   final FocusNode? focusNode;

// //   final TextInputAction? textInputAction;

// //   MobilenumberTextField(
// //       {Key? key,
// //       this.color,
// //       this.onTap,
// //       this.padding,
// //       this.height,
// //       this.width,
// //       this.hintFontSize,
// //       this.maxLines,
// //       this.enableBorder,
// //       this.suffix,
// //       this.controller,
// //       this.titleHeader,
// //       this.readOnly,
// //       this.onChanged,
// //       this.lengthLimitingTextInputFormatter,
// //       this.textInputType,
// //       this.fontWeight,
// //       this.hintText,
// //       this.onEditingComplete,
// //       this.focusNode,
// //       this.textInputAction})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             titleHeader != null
// //                 ? Text(
// //                     // textAlign: TextAlign.start,
// //                     titleHeader ?? "",
// //                     style: TextStyle(
// //                         letterSpacing: 5.5,
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 10.sp,
// //                         color: const Color(0xffFFFFFF)),
// //                   )
// //                 : Container(),
// //           ],
// //         ),
// //         titleHeader != null
// //             ? SizedBox(
// //                 height: 15.w,
// //               )
// //             : Container(),
// //         SizedBox(
// //           height: height ?? 48.w,
// //           width: MediaQuery.of(context).size.width ?? 48,
// //           child: TextFormField(
// //             style: TextStyle(color: Colors.white),

// //             onTap: onTap,
// //             maxLines: maxLines ?? 1,
// //             keyboardType: textInputType,
// //             readOnly: readOnly ?? false,
// //             onChanged: onChanged,
// //             textInputAction: textInputAction ?? null,
// //             // inputFormatters: [
// //             //   lengthLimitingTextInputFormatter ??
// //             //       LengthLimitingTextInputFormatter(1000),

// //             //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
// //             // ],
// //             onEditingComplete: onEditingComplete ?? null,
// //             focusNode: focusNode ?? null,
// //             controller: controller,
// //             decoration: InputDecoration(
// //               border: OutlineInputBorder(
// //                   borderSide: BorderSide.none,
// //                   borderRadius: BorderRadius.circular(30.0)),

// //               //   // border:
// //               //   //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
// //               //   // border: BorderRadius.circular(),
// //               //   suffixIcon: suffix,
// //               //   // fillColor: Colors.white,
// //               //   filled: true,
// //               //   // hintText: hintText,
// //               //   contentPadding: padding ??
// //               //       EdgeInsets.only(
// //               //           left: 10.w, top: maxLines != null ? 30.w : 0.w),
// //               //   hintStyle: TextStyle(
// //               //       fontSize: hintFontSize ?? 16.sp,
// //               //       fontWeight: fontWeight ?? FontWeight.w400,
// //               //       color: color ?? const Color(0xffB7B7B7)),
// //               //   enabledBorder: OutlineInputBorder(
// //               //     borderSide: BorderSide(
// //               //       width: 1.w,
// //               //       color: enableBorder ?? false
// //               //           ? const Color(0xffE0E0E0)
// //               //           : const Color(0xffEFEFEF),
// //               //     ),
// //               //     borderRadius: BorderRadius.circular(55.w),
// //               //   ),
// //               //   focusedBorder: OutlineInputBorder(
// //               //     borderSide: BorderSide(
// //               //       width: 1.w,
// //               //       color: enableBorder ?? false
// //               //           ? const Color(0xffE0E0E0)
// //               //           : const Color(0xffEFEFEF),
// //               //     ),
// //               //     borderRadius: BorderRadius.circular(55.w),
// //               //   ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // /////////////////////////////////ddddddddddddddddd/////////////
// // class MobileNoTextFormField extends StatelessWidget {
// //   final TextEditingController? controller;
// //   final double? height;
// //   final bool? enableOrder;
// //   final void Function(CountryCode)? onCountryCodeChanged;
// //   final void Function(String)? onChanged;
// //   final String? initialSelection;
// //   final bool? readOnly;
// //   final String? titleHeader;

// //   final FocusNode? focusNode;

// //   final void Function()? onEditingComplete;

// //   final TextInputAction? textInputAction;

// //   // final String? hint

// //   const MobileNoTextFormField({
// //     Key? key,
// //     this.enableOrder,
// //     this.readOnly,
// //     this.onChanged,
// //     this.height,
// //     this.initialSelection,
// //     this.titleHeader,
// //     required this.controller,
// //     this.onCountryCodeChanged,
// //     this.focusNode,
// //     this.onEditingComplete,
// //     this.textInputAction,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     String initialCountry = 'TR';
// //     PhoneNumber number = PhoneNumber(isoCode: 'TR');
// //     return Column(
// //       mainAxisSize: MainAxisSize.max,
// //       children: [
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             titleHeader != null
// //                 ? Text(
// //                     // textAlign: TextAlign.start,
// //                     titleHeader ?? "",
// //                     style: TextStyle(
// //                         letterSpacing: 3,
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 10.sp,
// //                         color: const Color(0xffFFFFFF)),
// //                   )
// //                 : Container(),
// //           ],
// //         ),
// //         titleHeader != null
// //             ? SizedBox(
// //                 height: 15.w,
// //               )
// //             : Container(),
// //         Container(
// //           height: height ?? 50.w,
// //           decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(25.w),
// //               color: Colors.black,
// //               border: Border.all(
// //                   color: enableOrder ?? false
// //                       ? const Color(0xffE0E0E0)
// //                       : const Color(0xffEFEFEF))),
// //           child: Row(
// //             children: [
// //               Container(
// //                 decoration: const BoxDecoration(
// //                   border: Border(
// //                     right: BorderSide(
// //                       color: Color(0xff454545),
// //                       width: 1.0,
// //                     ),
// //                     // top: BorderSide(
// //                     //   color: Colors.pink,
// //                     //   width: 10.0,
// //                     // ),
// //                   ),
// //                 ),
// //                 child: CountryCodePicker(
// //                   enabled: readOnly == true ? false : true,
// //                   flagWidth: 20.w,
// //                   flagDecoration: const BoxDecoration(),
// //                   padding: EdgeInsets.zero,
// //                   onChanged: onCountryCodeChanged,
// //                   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
// //                   initialSelection: 'TR',
// //                   showFlagDialog: true,
// //                   showFlag: true,
// //                   showFlagMain: false,
// //                   favorite: const ['+90'],
// //                   textStyle: TextStyle(
// //                       fontSize: 18.sp,
// //                       fontWeight: FontWeight.w400,
// //                       color: Colors.white),
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 10.w,
// //               ),
// //               Divider(
// //                 height: 20,
// //                 thickness: 14,
// //                 color:
// //                     Colors.white, // Change the color according to your design
// //               ),

// //               // Divider(
// //               //   height: 10,
// //               //   thickness: 20,
// //               //   color: Colors.white,
// //               // ),
// //               Expanded(
// //                 child: MobilenumberTextField(
// //                   enableBorder: false,
// //                   color: Colors.white,
// //                   textInputAction: textInputAction,
// //                   // readOnly: readOnly,
// //                   focusNode: focusNode ?? null,
// //                   onEditingComplete: onEditingComplete ?? null,
// //                   controller: controller,
// //                   lengthLimitingTextInputFormatter:
// //                       LengthLimitingTextInputFormatter(10),
// //                   onChanged: onChanged,
// //                   hintText: "Mobile Number",
// //                   textInputType: TextInputType.number,

// //                   // padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 10.w),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class MobileNoController extends ChangeNotifier {
// //   String flagIcon = "";
// //   String countryCode = "+90";

// //   void onCountrySelected(code, icon) {
// //     countryCode = "+" + code;
// //     flagIcon = icon;
// //     notifyListeners();
// //   }
// // }
// // ////////////////////////////ShopConFig DropDown TextField/////////////////////

// // class PrimarySTextFormFieldShopConfig extends StatelessWidget {
// //   final String? titleHeader;
// //   final bool? readOnly;
// //   final double? height;
// //   final double? width;
// //   final int? maxLines;
// //   void Function(String)? onChanged;
// //   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
// //   final TextEditingController? controller;
// //   final String? hintText;
// //   final Widget? suffix;
// //   final Color? color;
// //   final bool? enableBorder;
// //   final double? hintFontSize;
// //   final FontWeight? fontWeight;
// //   final EdgeInsetsGeometry? padding;
// //   final TextInputType? textInputType;
// //   final void Function()? onTap;

// //   PrimarySTextFormFieldShopConfig(
// //       {Key? key,
// //       this.color,
// //       this.onTap,
// //       this.padding,
// //       this.height,
// //       this.width,
// //       this.hintFontSize,
// //       this.maxLines,
// //       this.enableBorder,
// //       this.suffix,
// //       this.controller,
// //       this.titleHeader,
// //       this.readOnly,
// //       this.onChanged,
// //       this.lengthLimitingTextInputFormatter,
// //       this.textInputType,
// //       this.fontWeight,
// //       this.hintText})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Row(
// //           children: [
// //             titleHeader != null
// //                 ? Text(
// //                     titleHeader ?? "",
// //                     style: TextStyle(
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 14.sp,
// //                         color: const Color(0xff3A3A3A)),
// //                   )
// //                 : Container(),
// //           ],
// //         ),
// //         titleHeader != null
// //             ? SizedBox(
// //                 height: 10.w,
// //               )
// //             : Container(),
// //         SizedBox(
// //           height: height ?? 48.w,
// //           width: MediaQuery.of(context).size.width,
// //           child: TextFormField(
// //             onTap: onTap,
// //             maxLines: maxLines ?? 1,
// //             keyboardType: textInputType,
// //             readOnly: readOnly ?? false,
// //             onChanged: onChanged,
// //             inputFormatters: [
// //               // lengthLimitingTextInputFormatter ??
// //               // LengthLimitingTextInputFormatter(1000),

// //               FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
// //             ],
// //             controller: controller,
// //             decoration: InputDecoration(
// //               suffixIcon: suffix,
// //               fillColor: Colors.white,
// //               filled: true,
// //               hintText: hintText,
// //               contentPadding: padding ??
// //                   EdgeInsets.only(
// //                       left: 10.w, top: maxLines != null ? 30.w : 0.w),
// //               hintStyle: TextStyle(
// //                   fontSize: hintFontSize ?? 16.sp,
// //                   fontWeight: fontWeight ?? FontWeight.w400,
// //                   color: color ?? const Color(0xffB7B7B7)),
// //               enabledBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: enableBorder ?? false
// //                       ? const Color(0xffE0E0E0)
// //                       : const Color(0xffEFEFEF),
// //                 ),
// //                 borderRadius: BorderRadius.circular(5.w),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   width: 1.w,
// //                   color: enableBorder ?? false
// //                       ? const Color(0xffE0E0E0)
// //                       : const Color(0xffEFEFEF),
// //                 ),
// //                 borderRadius: BorderRadius.circular(5.w),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // ////////////////////////// Number Formatter ///////////////////////////////////////////////

// // class CustomNumberFormatter extends TextInputFormatter {
// //   @override
// //   TextEditingValue formatEditUpdate(
// //     TextEditingValue oldValue,
// //     TextEditingValue newValue,
// //   ) {
// //     if (newValue.text.isEmpty) {
// //       return newValue.copyWith(text: '');
// //     }

// //     String newText =
// //         newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
// //     if (newText.length > 10) {
// //       newText = newText.substring(0, 10); // Limit the length to 10 characters
// //     }

// //     // Add spaces at specific intervals
// //     newText = newText
// //         .replaceAllMapped(
// //           RegExp(r".{1,3}"),
// //           (Match match) => "${match.group(0)} ",
// //         )
// //         .trim();

// //     return newValue.copyWith(
// //       text: newText,
// //       selection: TextSelection.collapsed(offset: newText.length),
// //     );
// //   }
// // }

// // /////////////////////ggggggggggggggggggggggggggggggggggg////////////////////////////////////////////////////////////////////////

// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:md_health/Screens/payment/view/payment_view.dart';
// import 'package:md_health/constants/styles/colors.dart';

// class PrimaryCTextFormField extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;

//   PrimaryCTextFormField(
//       {Key? key,
//       this.onTap,
//       this.textStyle,
//       this.borderColor,
//       this.maxLines,
//       this.height,
//       this.width,
//       this.hintStyle,
//       this.color,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.textInputType,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.hintText})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             keyboardType: textInputType,
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(1000),
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: borderColor ?? const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: borderColor ?? const Color(0xffE0E0E0),
//                 ),
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ////////////////////////////////////////////////////////////
// class PrimaryInformationTextFormField extends StatelessWidget {
//   final String? titleHeader;
//   // final FormValidator? validator;
//   final String? Function(String?)? validator;
//   final bool? obscureText; // Add this property
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   final EdgeInsets? contentPadding;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;
//   final String? label; // Add this parameter for the label text

//   final double? borderRadius;

//   PrimaryInformationTextFormField({
//     Key? key,
//     this.onTap,
//     this.label, // Add this parameter for the label text
//     this.obscureText, // Add this parameter
//     this.textStyle,
//     this.borderColor,
//     this.maxLines,
//     this.height,
//     this.width,
//     this.hintStyle,
//     this.color,
//     this.enableBorder,
//     this.suffix,
//     this.contentPadding,
//     this.controller,
//     this.titleHeader,
//     this.readOnly,
//     this.textInputType,
//     this.onChanged,
//     this.lengthLimitingTextInputFormatter,
//     this.hintText,
//     this.validator,
//     this.borderRadius,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // bool hasText = (controller?.text ?? '').isNotEmpty;
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             validator: validator, // Add the validator here
//             keyboardType: textInputType ??
//                 TextInputType.text, // Set a default value if needed
//             obscureText: obscureText ?? false, // Set a default value if needed
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(1000),
//             ],

//             controller: controller,
//             decoration: InputDecoration(
//               // labelText: hintText, // Use label text as inline label
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                       fontFamily: 'Campton',
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color:
//                       //  hasText ? Colors.green :
//                       Color(0xff989898),
//                   width: 1.w,
//                 ),
//                 borderRadius: BorderRadius.circular(20.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(20.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// //////////////////////////////////////////////////////////////////
// class PrimaryInformationTextFormFieldNumber extends StatelessWidget {
//   final String? titleHeader;
//   // final FormValidator? validator;
//   final String? Function(String?)? validator;
//   final bool? obscureText; // Add this property
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   final EdgeInsets? contentPadding;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;
//   final String? label; // Add this parameter for the label text

//   final double? borderRadius;

//   PrimaryInformationTextFormFieldNumber({
//     Key? key,
//     this.onTap,
//     this.label, // Add this parameter for the label text
//     this.obscureText, // Add this parameter
//     this.textStyle,
//     this.borderColor,
//     this.maxLines,
//     this.height,
//     this.width,
//     this.hintStyle,
//     this.color,
//     this.enableBorder,
//     this.suffix,
//     this.contentPadding,
//     this.controller,
//     this.titleHeader,
//     this.readOnly,
//     this.textInputType,
//     this.onChanged,
//     this.lengthLimitingTextInputFormatter,
//     this.hintText,
//     this.validator,
//     this.borderRadius,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // bool hasText = (controller?.text ?? '').isNotEmpty;
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             validator: validator, // Add the validator here

//             keyboardType: textInputType ??
//                 TextInputType.text, // Set a default value if needed
//             obscureText: obscureText ?? false, // Set a default value if needed
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               LengthLimitingTextInputFormatter(19), // Limit to 19 characters
//               FilteringTextInputFormatter.digitsOnly,
//               CardNumberFormatter(),
//             ],

//             controller: controller,
//             decoration: InputDecoration(
//               // labelText: hintText, // Use label text as inline label
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                       fontFamily: 'Campton',
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color:
//                       //  hasText ? Colors.green :
//                       Color(0xff989898),
//                   width: 1.w,
//                 ),
//                 borderRadius: BorderRadius.circular(20.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(20.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////
// class PrimaryInformationTextFormFieldreq extends StatelessWidget {
//   final String? titleHeader;
//   final int maxWords;
//   final ValueChanged<int>? currentLength;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   final int? maxLength;
//   final EdgeInsets? contentPadding;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;
//   final double? borderRadius;

//   PrimaryInformationTextFormFieldreq(
//       {Key? key,
//       this.onTap,
//       this.textStyle,
//       this.borderColor,
//       this.maxLines,
//       this.height,
//       this.width,
//       this.hintStyle,
//       this.color,
//       this.enableBorder,
//       this.suffix,
//       this.contentPadding,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.textInputType,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.hintText,
//       this.borderRadius,
//       this.maxLength,
//       this.maxWords = 1,
//       this.currentLength})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool hasText = (controller?.text ?? '').isNotEmpty;
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14.sp,
//                       color: const Color(0xff3A3A3A),
//                     ),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             keyboardType: textInputType,
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             maxLength: maxLength,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(300),
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                     fontFamily: 'Campton',
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w400,
//                     color: const Color(0xff979797),
//                   ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Color(0xffD6D6D6),
//                   width: 1.w,
//                 ),
//                 borderRadius: BorderRadius.circular(8.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(8.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ///////////////////////NEWADDRESSS////////////////////////////////////
// class PrimaryInformationTextFormFieldNEWADDRESS extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   final EdgeInsets? contentPadding;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;

//   final double? borderRadius;

//   PrimaryInformationTextFormFieldNEWADDRESS(
//       {Key? key,
//       this.onTap,
//       this.textStyle,
//       this.borderColor,
//       this.maxLines,
//       this.height,
//       this.width,
//       this.hintStyle,
//       this.color,
//       this.enableBorder,
//       this.suffix,
//       this.contentPadding,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.textInputType,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.hintText,
//       this.borderRadius})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool hasText = (controller?.text ?? '').isNotEmpty;

//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             keyboardType: textInputType,
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(1000),
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                       fontFamily: 'Campton',
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color:
//                       //  hasText ? Colors.green :
//                       Color(0xffD6D6D6),
//                   width: 1.w,
//                 ),
//                 borderRadius: BorderRadius.circular(15.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(15.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ////////////////////////////////////////////////////////////
// class PrimarySTextFormField extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final TextStyle? titleStyle;
//   final void Function()? onTap;
//   final TextStyle? textStyle;
//   final bool isPasswordFeild;
//   final bool isObscuringHeart = false;
//   final FocusNode? focusNode;
//   final void Function()? onEditingComplete;
//   final TextInputAction? textInputAction;

//   final TextCapitalization? textCapitalization;

//   PrimarySTextFormField(
//       {Key? key,
//       this.color,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.titleStyle,
//       this.hintText,
//       this.textStyle,
//       this.focusNode,
//       this.isPasswordFeild = false,
//       this.onEditingComplete,
//       this.textInputAction,
//       this.textCapitalization})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool hasText = (controller?.text ?? '').isNotEmpty;

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: titleStyle ??
//                         TextStyle(
//                             fontFamily: 'Campton',
//                             letterSpacing: 5.5,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10.sp,
//                             color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           // width: MediaQuery.of(context).size.width ?? 48,
//           child: TextFormField(
//             // textAlign: TextAlign.left,
//             style: textStyle ??
//                 TextStyle(
//                   decorationThickness: 0, // letterSpacing: 3,
//                   color: Colors.white,
//                   fontFamily: 'Campton',
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w400,
//                   // fontSize: 21.sp,
//                   // fontWeight: FontWeight.w500,
//                   // letterSpacing: isPasswordFeild ? 0 : -0.5
//                 ),
//             onTap: onTap,
//             textCapitalization: textCapitalization ?? TextCapitalization.none,
//             textInputAction: textInputAction ?? null,
//             obscureText: isPasswordFeild ? true : false,
//             enableSuggestions: isPasswordFeild ? false : true,
//             autocorrect: isPasswordFeild ? false : true,
//             obscuringCharacter: isObscuringHeart ? '❤' : '*',
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             // onChanged: onChanged,
//             onChanged: (text) {
//               if (onChanged != null) {
//                 onChanged!(text);
//               }
//             },

//             onEditingComplete: onEditingComplete ?? () {},
//             focusNode: focusNode ?? null,
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               // fillColor: Colors.white,
//               filled: true,
//               labelStyle: TextStyle(color: Colors.white),
//               hintText: hintText,

//               hintStyle: TextStyle(
//                   fontSize: hintFontSize ?? 16.sp,
//                   fontWeight: fontWeight ?? FontWeight.w400,
//                   color: color ?? const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: hasText ? Colors.green : Colors.white,
//                   width: 1.w,
//                 ),
//                 borderRadius: BorderRadius.circular(55.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(55.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /////////////////////////JHUrfhv76r7gyjhiy8g6/////////////////////
// class PrimarySTextFormFieldNew extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final TextStyle? titleStyle;
//   final void Function()? onTap;
//   final TextStyle? textStyle;
//   final bool isPasswordFeild;
//   final bool isObscuringHeart = false;
//   final FocusNode? focusNode;
//   final void Function()? onEditingComplete;
//   final TextInputAction? textInputAction;

//   final TextCapitalization? textCapitalization;

//   PrimarySTextFormFieldNew(
//       {Key? key,
//       this.color,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.titleStyle,
//       this.hintText,
//       this.textStyle,
//       this.focusNode,
//       this.isPasswordFeild = false,
//       this.onEditingComplete,
//       this.textInputAction,
//       this.textCapitalization})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool hasText = (controller?.text ?? '').isNotEmpty;

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: titleStyle ??
//                         TextStyle(
//                             fontFamily: 'Campton',
//                             letterSpacing: 5.5,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10.sp,
//                             color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           // width: MediaQuery.of(context).size.width ?? 48,
//           child: TextFormField(
//             // textAlign: TextAlign.left,
//             style: textStyle ??
//                 TextStyle(
//                   decorationThickness: 0, // letterSpacing: 3,
//                   color: Colors.white,
//                   fontFamily: 'Campton',
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w400,
//                   // fontSize: 21.sp,
//                   // fontWeight: FontWeight.w500,
//                   // letterSpacing: isPasswordFeild ? 0 : -0.5
//                 ),
//             onTap: onTap,
//             textCapitalization: textCapitalization ?? TextCapitalization.none,
//             textInputAction: textInputAction ?? null,
//             obscureText: isPasswordFeild ? true : false,
//             enableSuggestions: isPasswordFeild ? false : true,
//             autocorrect: isPasswordFeild ? false : true,
//             obscuringCharacter: isObscuringHeart ? '❤' : '*',
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             // onChanged: onChanged,
//             onChanged: (text) {
//               if (onChanged != null) {
//                 onChanged!(text);
//               }
//             },
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
//             ],
//             onEditingComplete: onEditingComplete ?? () {},
//             focusNode: focusNode ?? null,
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               // fillColor: Colors.white,
//               filled: true,
//               labelStyle: TextStyle(color: Colors.white),
//               hintText: hintText,

//               hintStyle: TextStyle(
//                   fontSize: hintFontSize ?? 16.sp,
//                   fontWeight: fontWeight ?? FontWeight.w400,
//                   color: color ?? const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: hasText ? Colors.green : Colors.white,
//                   width: 1.w,
//                 ),
//                 borderRadius: BorderRadius.circular(55.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(55.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ////////////////////////////////////////////////
// class PrimarySTextFormFieldChat extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final TextStyle? titleStyle;
//   final void Function()? onTap;
//   final TextStyle? textStyle;
//   final bool isPasswordFeild;

//   PrimarySTextFormFieldChat(
//       {Key? key,
//       this.color,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.titleStyle,
//       this.hintText,
//       this.textStyle,
//       this.isPasswordFeild = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: titleStyle ??
//                         TextStyle(
//                             letterSpacing: 5.5,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10.sp,
//                             color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 15.w,
//               )
//             : Container(),
//         SizedBox(
//           // height: height ?? 48.w,
//           // width: MediaQuery.of(context).size.width ?? 48,
//           child: TextFormField(
//             style: textStyle ??
//                 TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'Campton',
//                     fontSize: 21.sp,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: isPasswordFeild ? 0 : -0.5),
//             onTap: onTap,
//             obscureText: isPasswordFeild ? true : false,
//             enableSuggestions: isPasswordFeild ? false : true,
//             autocorrect: isPasswordFeild ? false : true,
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             // inputFormatters: [
//             //   lengthLimitingTextInputFormatter ??
//             //       LengthLimitingTextInputFormatter(1000),

//             //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
//             // ],
//             controller: controller,
//             decoration: InputDecoration(
//               fillColor: Colors.white,
//               // border:
//               //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
//               // border: BorderRadius.circular(),
//               suffixIcon: suffix,
//               // fillColor: Colors.white,
//               filled: true,
//               labelStyle: TextStyle(color: Color(0xffFBFBFB)),
//               hintText: hintText,
//               // contentPadding: padding ??
//               //     EdgeInsets.only(
//               //         left: 10.w, top: maxLines != null ? 30.w : 0.w),
//               hintStyle: TextStyle(
//                   fontSize: hintFontSize ?? 16.sp,
//                   fontWeight: fontWeight ?? FontWeight.w400,
//                   color: Color(0xffB5B4B4)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(0.w),
//                   topLeft: Radius.circular(
//                       20.w), // Set the top-right corner to be non-circular
//                   bottomRight: Radius.circular(
//                       20.w), // Set the bottom-left corner to be non-circular
//                   bottomLeft: Radius.circular(0.w),
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 // borderRadius: BorderRadius.circular(55.w),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(0.w),
//                   topLeft: Radius.circular(
//                       20.w), // Set the top-right corner to be non-circular
//                   bottomRight: Radius.circular(
//                       20.w), // Set the bottom-left corner to be non-circular
//                   bottomLeft: Radius.circular(0.w),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /////////////////////////////////////////////////
// class PrimaryInformationTextFormFieldNew extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   final EdgeInsets? contentPadding;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;

//   PrimaryInformationTextFormFieldNew(
//       {Key? key,
//       this.onTap,
//       this.textStyle,
//       this.borderColor,
//       this.maxLines,
//       this.height,
//       this.width,
//       this.hintStyle,
//       this.color,
//       this.enableBorder,
//       this.suffix,
//       this.contentPadding,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.textInputType,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.hintText})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15.sp,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             keyboardType: textInputType,
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(1000),
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: borderColor ?? const Color(0xff989898),
//                 ),
//                 borderRadius: BorderRadius.circular(20.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: borderColor ?? const Color(0xff989898),
//                 ),
//                 borderRadius: BorderRadius.circular(20.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// //////////////////////////////////////////////
// class MobilenumberTextField extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final void Function()? onTap;
//   final void Function()? onEditingComplete;
//   final FocusNode? focusNode;
//   final TextStyle? textStyle;

//   final TextInputAction? textInputAction;

//   MobilenumberTextField(
//       {Key? key,
//       this.color,
//       this.textStyle,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.hintText,
//       this.onEditingComplete,
//       this.focusNode,
//       this.textInputAction,
//       required TextStyle style})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         letterSpacing: 5.5,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 10.sp,
//                         color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 15.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width ?? 48,
//           child: TextFormField(
//             // style: TextStyle(color: Colors.white),
//             style: textStyle ??
//                 TextStyle(
//                   letterSpacing: 3,
//                   color: Colors.white,
//                   fontFamily: 'Campton',
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w400,
//                   // fontSize: 21.sp,
//                   // fontWeight: FontWeight.w400,
//                 ),
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             textInputAction: textInputAction ?? null,
//             // inputFormatters: [
//             //   lengthLimitingTextInputFormatter ??
//             //       LengthLimitingTextInputFormatter(1000),

//             //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
//             // ],
//             onEditingComplete: onEditingComplete ?? null,
//             focusNode: focusNode ?? null,
//             controller: controller,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(30.0)),

//               //   // border:
//               //   //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
//               //   // border: BorderRadius.circular(),
//               //   suffixIcon: suffix,
//               //   // fillColor: Colors.white,
//               //   filled: true,
//               //   // hintText: hintText,
//               //   contentPadding: padding ??
//               //       EdgeInsets.only(
//               //           left: 10.w, top: maxLines != null ? 30.w : 0.w),
//               //   hintStyle: TextStyle(
//               //       fontSize: hintFontSize ?? 16.sp,
//               //       fontWeight: fontWeight ?? FontWeight.w400,
//               //       color: color ?? const Color(0xffB7B7B7)),
//               //   enabledBorder: OutlineInputBorder(
//               //     borderSide: BorderSide(
//               //       width: 1.w,
//               //       color: enableBorder ?? false
//               //           ? const Color(0xffE0E0E0)
//               //           : const Color(0xffEFEFEF),
//               //     ),
//               //     borderRadius: BorderRadius.circular(55.w),
//               //   ),
//               //   focusedBorder: OutlineInputBorder(
//               //     borderSide: BorderSide(
//               //       width: 1.w,
//               //       color: enableBorder ?? false
//               //           ? const Color(0xffE0E0E0)
//               //           : const Color(0xffEFEFEF),
//               //     ),
//               //     borderRadius: BorderRadius.circular(55.w),
//               //   ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /////////////////////////////////ddddddddddddddddd/////////////
// class MobileNoTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final double? height;
//   final bool? enableOrder;
//   final void Function(CountryCode)? onCountryCodeChanged;
//   final void Function(String)? onChanged;
//   final String? initialSelection;
//   final bool? readOnly;
//   final String? titleHeader;
//   final TextStyle? textStyle;

//   final FocusNode? focusNode;

//   final void Function()? onEditingComplete;

//   final TextInputAction? textInputAction;

//   // final String? hint

//   const MobileNoTextFormField({
//     Key? key,
//     this.textStyle,
//     this.enableOrder,
//     this.readOnly,
//     this.onChanged,
//     this.height,
//     this.initialSelection,
//     this.titleHeader,
//     required this.controller,
//     this.onCountryCodeChanged,
//     this.focusNode,
//     this.onEditingComplete,
//     this.textInputAction,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String initialCountry = 'TR';
//     PhoneNumber number = PhoneNumber(isoCode: 'TR');
//     bool hasText = (controller?.text ?? '').isNotEmpty;

//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         letterSpacing: 3,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 10.sp,
//                         color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         Container(
//           height: height ?? 50.w,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25.w),
//             color: Colors.black,
//             border: Border.all(
//               color: hasText
//                   ? Colors.green
//                   : (enableOrder ?? false)
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//             ),
//           ),
//           child: Row(
//             children: [
//               Divider(
//                 thickness: 5,
//                 color: Colors.grey,
//               ),
//               Container(
//                 child: CountryCodePicker(
//                   enabled: readOnly == true ? false : true,
//                   flagWidth: 20.w,
//                   flagDecoration: const BoxDecoration(),
//                   padding: EdgeInsets.zero,
//                   onChanged: onCountryCodeChanged,
//                   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                   initialSelection: 'TR',
//                   showFlagDialog: true,
//                   showFlag: true,
//                   showFlagMain: false,
//                   favorite: const ['+ 90'],
//                   textStyle: TextStyle(
//                       letterSpacing: 3,
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white),
//                 ),
//               ),
//               SvgPicture.asset(
//                 "assets/icons/arrow-up-2.svg",
//                 // color: Colors.red,
//               ),
//               SizedBox(
//                 width: 5.w,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 4.0.w, bottom: 4.w),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     border: Border(
//                       right: BorderSide(
//                         color: Color(0xff454545),
//                         width: 1.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: MobilenumberTextField(
//                   style: textStyle ??
//                       TextStyle(
//                         color: Colors.white,
//                         letterSpacing: 3,
//                         fontFamily: 'Campton',
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                         // fontSize: 21.sp,
//                         // fontWeight: FontWeight.w500,
//                         // letterSpacing: isPasswordFeild ? 0 : -0.5
//                       ),
//                   fontWeight: FontWeight.w500,
//                   enableBorder: false,
//                   color: Colors.white,
//                   textInputAction: textInputAction,
//                   // readOnly: readOnly,
//                   focusNode: focusNode ?? null,
//                   onEditingComplete: onEditingComplete ?? null,
//                   controller: controller,
//                   lengthLimitingTextInputFormatter:
//                       LengthLimitingTextInputFormatter(9),
//                   // onChanged: onChanged,
//                   onChanged: (text) {
//                     if (onChanged != null) {
//                       onChanged!(text);
//                     }
//                   },

//                   hintText: "Mobile Number",
//                   textInputType: TextInputType.number,

//                   // padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 10.w),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MobileNoController extends ChangeNotifier {
//   String flagIcon = "";
//   String countryCode = "+ 90";

//   void onCountrySelected(code, icon) {
//     countryCode = "+" + code;
//     flagIcon = icon;
//     notifyListeners();
//   }
// }
// ////////////////////////////ShopConFig DropDown TextField/////////////////////

// class PrimarySTextFormFieldShopConfig extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final void Function()? onTap;

//   PrimarySTextFormFieldShopConfig(
//       {Key? key,
//       this.color,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.hintText})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             titleHeader != null
//                 ? Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               // lengthLimitingTextInputFormatter ??
//               // LengthLimitingTextInputFormatter(1000),

//               FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: padding ??
//                   EdgeInsets.only(
//                       left: 10.w, top: maxLines != null ? 30.w : 0.w),
//               hintStyle: TextStyle(
//                   fontSize: hintFontSize ?? 16.sp,
//                   fontWeight: fontWeight ?? FontWeight.w400,
//                   color: color ?? const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ////////////////////////// Number Formatter ///////////////////////////////////////////////

// class CustomNumberFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     if (newValue.text.isEmpty) {
//       return newValue.copyWith(text: '');
//     }

//     String newText =
//         newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
//     if (newText.length > 10) {
//       newText = newText.substring(0, 10); // Limit the length to 10 characters
//     }

//     // Add spaces at specific intervals
//     newText = newText
//         .replaceAllMapped(
//           RegExp(r".{1,3}"),
//           (Match match) => "${match.group(0)} ",
//         )
//         .trim();

//     return newValue.copyWith(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }
// }
///////////////////////////////2/14/2024/////////////////////
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/services.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:md_health/constants/styles/colors.dart';

// class PrimaryCTextFormField extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;

//   PrimaryCTextFormField(
//       {Key? key,
//       this.onTap,
//       this.textStyle,
//       this.borderColor,
//       this.maxLines,
//       this.height,
//       this.width,
//       this.hintStyle,
//       this.color,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.textInputType,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.hintText})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             keyboardType: textInputType,
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(1000),
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: borderColor ?? const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: borderColor ?? const Color(0xffE0E0E0),
//                 ),
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ////////////////////////////////////////////////////////////
// class PrimaryInformationTextFormField extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   final EdgeInsets? contentPadding;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;

//   final double? borderRadius;

//   PrimaryInformationTextFormField(
//       {Key? key,
//       this.onTap,
//       this.textStyle,
//       this.borderColor,
//       this.maxLines,
//       this.height,
//       this.width,
//       this.hintStyle,
//       this.color,
//       this.enableBorder,
//       this.suffix,
//       this.contentPadding,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.textInputType,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.hintText,
//       this.borderRadius})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             keyboardType: textInputType,
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(1000),
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: borderColor ?? const Color(0xff989898),
//                 ),
//                 borderRadius: BorderRadius.circular(10.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(10.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ////////////////////////////////////////////////////////////
// class PrimarySTextFormField extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final TextStyle? titleStyle;
//   final void Function()? onTap;
//   final TextStyle? textStyle;
//   final bool isPasswordFeild;
//   final bool isObscuringHeart = false;
//   final FocusNode? focusNode;
//   final void Function()? onEditingComplete;
//   final TextInputAction? textInputAction;

//   final TextCapitalization? textCapitalization;

//   PrimarySTextFormField(
//       {Key? key,
//       this.color,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.titleStyle,
//       this.hintText,
//       this.textStyle,
//       this.focusNode,
//       this.isPasswordFeild = false,
//       this.onEditingComplete,
//       this.textInputAction,
//       this.textCapitalization})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: titleStyle ??
//                         TextStyle(
//                             letterSpacing: 5.5,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10.sp,
//                             color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 15.w,
//               )
//             : Container(),
//         SizedBox(
//           // height: height ?? 48.w,
//           // width: MediaQuery.of(context).size.width ?? 48,
//           child: TextFormField(
//             style: textStyle ??
//                 TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Campton',
//                   fontSize: 21.sp,
//                   fontWeight: FontWeight.w500,
//                   // letterSpacing: isPasswordFeild ? 0 : -0.5
//                 ),
//             onTap: onTap,
//             textCapitalization: textCapitalization ?? TextCapitalization.none,
//             textInputAction: textInputAction ?? null,
//             obscureText: isPasswordFeild ? true : false,
//             enableSuggestions: isPasswordFeild ? false : true,
//             autocorrect: isPasswordFeild ? false : true,
//             obscuringCharacter: isObscuringHeart ? '❤' : '*',
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             onEditingComplete: onEditingComplete ?? () {},
//             // inputFormatters: [
//             //   lengthLimitingTextInputFormatter ??
//             //       LengthLimitingTextInputFormatter(1000),

//             //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
//             // ],
//             focusNode: focusNode ?? null,
//             controller: controller,
//             decoration: InputDecoration(
//               // border:
//               //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
//               // border: BorderRadius.circular(),
//               suffixIcon: suffix,
//               // fillColor: Colors.white,
//               filled: true,
//               labelStyle: TextStyle(color: Colors.white),
//               hintText: hintText,
//               // contentPadding: padding ??
//               //     EdgeInsets.only(
//               //         left: 10.w, top: maxLines != null ? 30.w : 0.w),
//               hintStyle: TextStyle(
//                   fontSize: hintFontSize ?? 16.sp,
//                   fontWeight: fontWeight ?? FontWeight.w400,
//                   color: color ?? const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.circular(55.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.circular(55.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ////////////////////////////////////////////////
// class PrimarySTextFormFieldChat extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final TextStyle? titleStyle;
//   final void Function()? onTap;
//   final TextStyle? textStyle;
//   final bool isPasswordFeild;

//   PrimarySTextFormFieldChat(
//       {Key? key,
//       this.color,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.titleStyle,
//       this.hintText,
//       this.textStyle,
//       this.isPasswordFeild = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: titleStyle ??
//                         TextStyle(
//                             letterSpacing: 5.5,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10.sp,
//                             color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 15.w,
//               )
//             : Container(),
//         SizedBox(
//           // height: height ?? 48.w,
//           // width: MediaQuery.of(context).size.width ?? 48,
//           child: TextFormField(
//             style: textStyle ??
//                 TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'Campton',
//                     fontSize: 21.sp,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: isPasswordFeild ? 0 : -0.5),
//             onTap: onTap,
//             obscureText: isPasswordFeild ? true : false,
//             enableSuggestions: isPasswordFeild ? false : true,
//             autocorrect: isPasswordFeild ? false : true,
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             // inputFormatters: [
//             //   lengthLimitingTextInputFormatter ??
//             //       LengthLimitingTextInputFormatter(1000),

//             //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
//             // ],
//             controller: controller,
//             decoration: InputDecoration(
//               fillColor: Colors.white,
//               // border:
//               //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
//               // border: BorderRadius.circular(),
//               suffixIcon: suffix,
//               // fillColor: Colors.white,
//               filled: true,
//               labelStyle: TextStyle(color: Color(0xffFBFBFB)),
//               hintText: hintText,
//               // contentPadding: padding ??
//               //     EdgeInsets.only(
//               //         left: 10.w, top: maxLines != null ? 30.w : 0.w),
//               hintStyle: TextStyle(
//                   fontSize: hintFontSize ?? 16.sp,
//                   fontWeight: fontWeight ?? FontWeight.w400,
//                   color: Color(0xffB5B4B4)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(0.w),
//                   topLeft: Radius.circular(
//                       20.w), // Set the top-right corner to be non-circular
//                   bottomRight: Radius.circular(
//                       20.w), // Set the bottom-left corner to be non-circular
//                   bottomLeft: Radius.circular(0.w),
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 // borderRadius: BorderRadius.circular(55.w),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(0.w),
//                   topLeft: Radius.circular(
//                       20.w), // Set the top-right corner to be non-circular
//                   bottomRight: Radius.circular(
//                       20.w), // Set the bottom-left corner to be non-circular
//                   bottomLeft: Radius.circular(0.w),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /////////////////////////////////////////////////
// class PrimaryInformationTextFormFieldNew extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   final EdgeInsets? contentPadding;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;

//   PrimaryInformationTextFormFieldNew(
//       {Key? key,
//       this.onTap,
//       this.textStyle,
//       this.borderColor,
//       this.maxLines,
//       this.height,
//       this.width,
//       this.hintStyle,
//       this.color,
//       this.enableBorder,
//       this.suffix,
//       this.contentPadding,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.textInputType,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.hintText})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             keyboardType: textInputType,
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(1000),
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: borderColor ?? const Color(0xff989898),
//                 ),
//                 borderRadius: BorderRadius.circular(20.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: borderColor ?? const Color(0xff989898),
//                 ),
//                 borderRadius: BorderRadius.circular(20.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// //////////////////////////////////////////////
// class MobilenumberTextField extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final void Function()? onTap;
//   final void Function()? onEditingComplete;
//   final FocusNode? focusNode;

//   final TextInputAction? textInputAction;

//   MobilenumberTextField(
//       {Key? key,
//       this.color,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.hintText,
//       this.onEditingComplete,
//       this.focusNode,
//       this.textInputAction})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         letterSpacing: 5.5,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 10.sp,
//                         color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 15.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width ?? 48,
//           child: TextFormField(
//             style: TextStyle(color: Colors.white),

//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             textInputAction: textInputAction ?? null,
//             // inputFormatters: [
//             //   lengthLimitingTextInputFormatter ??
//             //       LengthLimitingTextInputFormatter(1000),

//             //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
//             // ],
//             onEditingComplete: onEditingComplete ?? null,
//             focusNode: focusNode ?? null,
//             controller: controller,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(30.0)),

//               //   // border:
//               //   //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
//               //   // border: BorderRadius.circular(),
//               //   suffixIcon: suffix,
//               //   // fillColor: Colors.white,
//               //   filled: true,
//               //   // hintText: hintText,
//               //   contentPadding: padding ??
//               //       EdgeInsets.only(
//               //           left: 10.w, top: maxLines != null ? 30.w : 0.w),
//               //   hintStyle: TextStyle(
//               //       fontSize: hintFontSize ?? 16.sp,
//               //       fontWeight: fontWeight ?? FontWeight.w400,
//               //       color: color ?? const Color(0xffB7B7B7)),
//               //   enabledBorder: OutlineInputBorder(
//               //     borderSide: BorderSide(
//               //       width: 1.w,
//               //       color: enableBorder ?? false
//               //           ? const Color(0xffE0E0E0)
//               //           : const Color(0xffEFEFEF),
//               //     ),
//               //     borderRadius: BorderRadius.circular(55.w),
//               //   ),
//               //   focusedBorder: OutlineInputBorder(
//               //     borderSide: BorderSide(
//               //       width: 1.w,
//               //       color: enableBorder ?? false
//               //           ? const Color(0xffE0E0E0)
//               //           : const Color(0xffEFEFEF),
//               //     ),
//               //     borderRadius: BorderRadius.circular(55.w),
//               //   ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /////////////////////////////////ddddddddddddddddd/////////////
// class MobileNoTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final double? height;
//   final bool? enableOrder;
//   final void Function(CountryCode)? onCountryCodeChanged;
//   final void Function(String)? onChanged;
//   final String? initialSelection;
//   final bool? readOnly;
//   final String? titleHeader;

//   final FocusNode? focusNode;

//   final void Function()? onEditingComplete;

//   final TextInputAction? textInputAction;

//   // final String? hint

//   const MobileNoTextFormField({
//     Key? key,
//     this.enableOrder,
//     this.readOnly,
//     this.onChanged,
//     this.height,
//     this.initialSelection,
//     this.titleHeader,
//     required this.controller,
//     this.onCountryCodeChanged,
//     this.focusNode,
//     this.onEditingComplete,
//     this.textInputAction,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String initialCountry = 'TR';
//     PhoneNumber number = PhoneNumber(isoCode: 'TR');
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         letterSpacing: 3,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 10.sp,
//                         color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 15.w,
//               )
//             : Container(),
//         Container(
//           height: height ?? 50.w,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25.w),
//               color: Colors.black,
//               border: Border.all(
//                   color: enableOrder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF))),
//           child: Row(
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   border: Border(
//                     right: BorderSide(
//                       color: Color(0xff454545),
//                       width: 1.0,
//                     ),
//                     // top: BorderSide(
//                     //   color: Colors.pink,
//                     //   width: 10.0,
//                     // ),
//                   ),
//                 ),
//                 child: CountryCodePicker(
//                   enabled: readOnly == true ? false : true,
//                   flagWidth: 20.w,
//                   flagDecoration: const BoxDecoration(),
//                   padding: EdgeInsets.zero,
//                   onChanged: onCountryCodeChanged,
//                   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                   initialSelection: 'TR',
//                   showFlagDialog: true,
//                   showFlag: true,
//                   showFlagMain: false,
//                   favorite: const ['+90'],
//                   textStyle: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white),
//                 ),
//               ),
//               SizedBox(
//                 width: 10.w,
//               ),
//               Divider(
//                 height: 20,
//                 thickness: 14,
//                 color:
//                     Colors.white, // Change the color according to your design
//               ),

//               // Divider(
//               //   height: 10,
//               //   thickness: 20,
//               //   color: Colors.white,
//               // ),
//               Expanded(
//                 child: MobilenumberTextField(
//                   enableBorder: false,
//                   color: Colors.white,
//                   textInputAction: textInputAction,
//                   // readOnly: readOnly,
//                   focusNode: focusNode ?? null,
//                   onEditingComplete: onEditingComplete ?? null,
//                   controller: controller,
//                   lengthLimitingTextInputFormatter:
//                       LengthLimitingTextInputFormatter(10),
//                   onChanged: onChanged,
//                   hintText: "Mobile Number",
//                   textInputType: TextInputType.number,

//                   // padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 10.w),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MobileNoController extends ChangeNotifier {
//   String flagIcon = "";
//   String countryCode = "+90";

//   void onCountrySelected(code, icon) {
//     countryCode = "+" + code;
//     flagIcon = icon;
//     notifyListeners();
//   }
// }
// ////////////////////////////ShopConFig DropDown TextField/////////////////////

// class PrimarySTextFormFieldShopConfig extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final void Function()? onTap;

//   PrimarySTextFormFieldShopConfig(
//       {Key? key,
//       this.color,
//       this.onTap,
//       this.padding,
//       this.height,
//       this.width,
//       this.hintFontSize,
//       this.maxLines,
//       this.enableBorder,
//       this.suffix,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.textInputType,
//       this.fontWeight,
//       this.hintText})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             titleHeader != null
//                 ? Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                         color: const Color(0xff3A3A3A)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               // lengthLimitingTextInputFormatter ??
//               // LengthLimitingTextInputFormatter(1000),

//               FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: padding ??
//                   EdgeInsets.only(
//                       left: 10.w, top: maxLines != null ? 30.w : 0.w),
//               hintStyle: TextStyle(
//                   fontSize: hintFontSize ?? 16.sp,
//                   fontWeight: fontWeight ?? FontWeight.w400,
//                   color: color ?? const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1.w,
//                   color: enableBorder ?? false
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//                 ),
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ////////////////////////// Number Formatter ///////////////////////////////////////////////

// class CustomNumberFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     if (newValue.text.isEmpty) {
//       return newValue.copyWith(text: '');
//     }

//     String newText =
//         newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
//     if (newText.length > 10) {
//       newText = newText.substring(0, 10); // Limit the length to 10 characters
//     }

//     // Add spaces at specific intervals
//     newText = newText
//         .replaceAllMapped(
//           RegExp(r".{1,3}"),
//           (Match match) => "${match.group(0)} ",
//         )
//         .trim();

//     return newValue.copyWith(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }
// }

// /////////////////////ggggggggggggggggggggggggggggggggggg////////////////////////////////////////////////////////////////////////

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/payment/view/payment_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/format.dart';

class PrimaryCTextFormField extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;

  PrimaryCTextFormField(
      {Key? key,
      this.onTap,
      this.textStyle,
      this.borderColor,
      this.maxLines,
      this.height,
      this.width,
      this.hintStyle,
      this.color,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.textInputType,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: textInputType,
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(1000),
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: EdgeInsets.only(left: 10.w, top: 10),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: borderColor ?? const Color(0xffEFEFEF),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? const Color(0xffE0E0E0),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////
class PrimaryInformationTextFormField extends StatelessWidget {
  final String? titleHeader;
  // final FormValidator? validator;
  final String? Function(String?)? validator;
  final bool? obscureText; // Add this property
  final bool? readOnly;
  final TextCapitalization? textCapitalization;
  final double? height;
  final double? width;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final String? label; // Add this parameter for the label text
  final double? borderRadius;
  final FocusNode? focusNode; // Add this property for the FocusNode
  final bool? allowOnlyLetters;

  // final bool allowOnlyDigits; // Add this parameter
  // final bool allowCommasAndDotsAndSpaces; // Add this parameter

  PrimaryInformationTextFormField({
    Key? key,
    this.onTap,
    this.label, // Add this parameter for the label text
    this.obscureText, // Add this parameter
    this.textStyle,
    this.borderColor,
    this.maxLines,
    this.height,
    this.width,
    this.textCapitalization,
    this.hintStyle,
    this.color,
    this.enableBorder,
    this.suffix,
    this.contentPadding,
    this.controller,
    this.titleHeader,
    this.readOnly,
    this.textInputType,
    this.onChanged,
    this.lengthLimitingTextInputFormatter,
    this.hintText,
    this.validator,
    this.borderRadius,
    this.focusNode, // Add this parameter for the FocusNode
    this.allowOnlyLetters,

    // this.allowOnlyDigits = false,
    // this.allowCommasAndDotsAndSpaces = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool hasText = (controller?.text ?? '').isNotEmpty;
    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            inputFormatters: [
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(100),
              if (allowOnlyLetters ?? false)
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
              // FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
            ],
            focusNode: focusNode, // Pass the FocusNode here

            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            validator: validator, // Add the validator here
            keyboardType: textInputType ??
                TextInputType.text, // Set a default value if needed
            obscureText: obscureText ?? false, // Set a default value if needed
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,

            controller: controller,
            decoration: InputDecoration(
              // labelText: hintText, // Use label text as inline label
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding:
                  contentPadding ?? EdgeInsets.only(left: 10.w, top: 20.w),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontFamily: 'Campton',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      //  hasText ? Colors.green :
                      Colors.black,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kDefaultActiveColor,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////////////////////
class MDaitePrimaryInformationTextFormField extends StatelessWidget {
  final String? titleHeader;
  // final FormValidator? validator;
  final String? Function(String?)? validator;
  final bool? obscureText; // Add this property
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final String? label; // Add this parameter for the label text
  final double? borderRadius;
  // final bool allowOnlyDigits; // Add this parameter
  // final bool allowCommasAndDotsAndSpaces; // Add this parameter

  MDaitePrimaryInformationTextFormField({
    Key? key,
    this.onTap,
    this.label, // Add this parameter for the label text
    this.obscureText, // Add this parameter
    this.textStyle,
    this.borderColor,
    this.maxLines,
    this.height,
    this.width,
    this.hintStyle,
    this.color,
    this.enableBorder,
    this.suffix,
    this.contentPadding,
    this.controller,
    this.titleHeader,
    this.readOnly,
    this.textInputType,
    this.onChanged,
    this.lengthLimitingTextInputFormatter,
    this.hintText,
    this.validator,
    this.borderRadius,
    // this.allowOnlyDigits = false,
    // this.allowCommasAndDotsAndSpaces = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool hasText = (controller?.text ?? '').isNotEmpty;
    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            validator: validator, // Add the validator here
            keyboardType: textInputType ??
                TextInputType.text, // Set a default value if needed
            obscureText: obscureText ?? false, // Set a default value if needed
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              // if (allowOnlyDigits) FilteringTextInputFormatter.digitsOnly,
              // if (!allowCommasAndDotsAndSpaces)
              //   FilteringTextInputFormatter.deny(RegExp(r'[,./]')),
              // if (!allowOnlyDigits)
              //   FilteringTextInputFormatter.allow(
              //     RegExp(r'[a-zA-Z]'), // Allow only alphabetic characters
              //   ),
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(100),
            ],
            controller: controller,
            decoration: InputDecoration(
              // labelText: hintText, // Use label text as inline label
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding:
                  contentPadding ?? EdgeInsets.only(left: 10.w, top: 20.w),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontFamily: 'Campton',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      //  hasText ? Colors.green :
                      Color(0xff989898),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kDefaultActiveColor,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PrimaryInformationTextFormFieldNumber extends StatelessWidget {
  final String? titleHeader;
  // final FormValidator? validator;
  final String? Function(String?)? validator;
  final bool? obscureText; // Add this property
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final String? label; // Add this parameter for the label text
  final FocusNode? focusNode; // Add this property for the FocusNode

  final double? borderRadius;

  PrimaryInformationTextFormFieldNumber({
    Key? key,
    this.onTap,
    this.label, // Add this parameter for the label text
    this.obscureText, // Add this parameter
    this.textStyle,
    this.borderColor,
    this.maxLines,
    this.height,
    this.width,
    this.hintStyle,
    this.color,
    this.enableBorder,
    this.suffix,
    this.contentPadding,
    this.controller,
    this.titleHeader,
    this.readOnly,
    this.textInputType,
    this.onChanged,
    this.lengthLimitingTextInputFormatter,
    this.hintText,
    this.validator,
    this.borderRadius,
    this.focusNode, // Add this parameter for the FocusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool hasText = (controller?.text ?? '').isNotEmpty;
    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            focusNode: focusNode, // Pass the FocusNode here

            validator: validator, // Add the validator here

            keyboardType: textInputType ??
                TextInputType.text, // Set a default value if needed
            obscureText: obscureText ?? false, // Set a default value if needed
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              LengthLimitingTextInputFormatter(19), // Limit to 19 characters
              FilteringTextInputFormatter.digitsOnly,
              CardNumberFormatter(),
            ],

            controller: controller,
            decoration: InputDecoration(
              // labelText: hintText, // Use label text as inline label
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontFamily: 'Campton',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      //  hasText ? Colors.green :
                      Color(0xff989898),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kDefaultActiveColor,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///////////////////////////////////////////////////////////////
// class PrimaryInformationTextFormFieldreq extends StatelessWidget {
//   final String? titleHeader;
//   final int maxWords;
//   final ValueChanged<int>? currentLength;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   final int? maxLength;
//   final EdgeInsets? contentPadding;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   final Color? color;
//   final bool? enableBorder;
//   final Color? borderColor;
//   final void Function()? onTap;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;
//   final double? borderRadius;

//   PrimaryInformationTextFormFieldreq(
//       {Key? key,
//       this.onTap,
//       this.textStyle,
//       this.borderColor,
//       this.maxLines,
//       this.height,
//       this.width,
//       this.hintStyle,
//       this.color,
//       this.enableBorder,
//       this.suffix,
//       this.contentPadding,
//       this.controller,
//       this.titleHeader,
//       this.readOnly,
//       this.textInputType,
//       this.onChanged,
//       this.lengthLimitingTextInputFormatter,
//       this.hintText,
//       this.borderRadius,
//       this.maxLength,
//       this.maxWords = 1,
//       this.currentLength})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool hasText = (controller?.text ?? '').isNotEmpty;
//     return Column(
//       children: [
//         titleHeader != null
//             ? Row(
//                 children: [
//                   Text(
//                     titleHeader ?? "",
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14.sp,
//                       color: const Color(0xff3A3A3A),
//                     ),
//                   ),
//                 ],
//               )
//             : Container(),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           width: MediaQuery.of(context).size.width,
//           child: TextFormField(
//             keyboardType: textInputType,
//             style: textStyle,
//             onTap: onTap,
//             maxLines: maxLines ?? 1,
//             maxLength: maxLength,
//             readOnly: readOnly ?? false,
//             onChanged: onChanged,
//             inputFormatters: [
//               lengthLimitingTextInputFormatter ??
//                   LengthLimitingTextInputFormatter(300),
//             ],
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               fillColor: Colors.white,
//               filled: true,
//               hintText: hintText,
//               contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
//               hintStyle: hintStyle ??
//                   TextStyle(
//                     fontFamily: 'Campton',
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w400,
//                     color: const Color(0xff979797),
//                   ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Color(0xffD6D6D6),
//                   width: 1.w,
//                 ),
//                 borderRadius: BorderRadius.circular(8.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(8.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
class PrimaryInformationTextFormFieldreq extends StatelessWidget {
  final String? titleHeader;
  final int maxWords;
  final ValueChanged<int>? currentLength;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsets? contentPadding;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final double? borderRadius;

  PrimaryInformationTextFormFieldreq({
    Key? key,
    this.onTap,
    this.textStyle,
    this.borderColor,
    this.maxLines,
    this.height,
    this.width,
    this.hintStyle,
    this.color,
    this.enableBorder,
    this.suffix,
    this.contentPadding,
    this.controller,
    this.titleHeader,
    this.readOnly,
    this.textInputType,
    this.onChanged,
    this.hintText,
    this.borderRadius,
    this.maxLength,
    this.maxWords = 200,
    this.currentLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (titleHeader != null)
          Row(
            children: [
              Text(
                titleHeader ?? "",
                style: TextStyle(
                  fontFamily: 'Campton',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: const Color(0xff3A3A3A),
                ),
              ),
            ],
          ),
        if (titleHeader != null)
          SizedBox(
            height: 10.0,
          ),
        SizedBox(
          height: height ?? 48.0,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: textInputType,
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: (value) {
              if (onChanged != null) onChanged!(value);
              if (currentLength != null) currentLength!(_getWordCount(value));
            },
            inputFormatters: [
              WordLimitingTextInputFormatter(maxWords),
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: contentPadding ?? EdgeInsets.only(left: 10.0),
              hintStyle: hintStyle ??
                  TextStyle(
                    fontFamily: 'Campton',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff979797),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? const Color(0xffD6D6D6),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? const Color(0xff3A3A3A),
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  int _getWordCount(String text) {
    return text.trim().split(RegExp(r'\s+')).length;
  }
}

///////////////////////NEWADDRESSS////////////////////////////////////
class PrimaryInformationTextFormFieldNEWADDRESS extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;

  final double? borderRadius;

  PrimaryInformationTextFormFieldNEWADDRESS(
      {Key? key,
      this.onTap,
      this.textStyle,
      this.borderColor,
      this.maxLines,
      this.height,
      this.width,
      this.hintStyle,
      this.color,
      this.enableBorder,
      this.suffix,
      this.contentPadding,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.textInputType,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.hintText,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasText = (controller?.text ?? '').isNotEmpty;

    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: textInputType,
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(1000),
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontFamily: 'Campton',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      //  hasText ? Colors.green :
                      Color(0xffD6D6D6),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(15.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kDefaultActiveColor,
                ),
                borderRadius: BorderRadius.circular(15.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////////////
class PrimarySTextFormField extends StatefulWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  final void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextInputType? textInputType;
  final TextStyle? titleStyle;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final bool isPasswordField;
  final bool isObscuringHeart;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;

  const PrimarySTextFormField({
    Key? key,
    this.color,
    this.onTap,
    this.padding,
    this.height,
    this.width,
    this.hintFontSize,
    this.maxLines,
    this.enableBorder,
    this.suffix,
    this.controller,
    this.titleHeader,
    this.readOnly,
    this.onChanged,
    this.lengthLimitingTextInputFormatter,
    this.textInputType,
    this.fontWeight,
    this.titleStyle,
    this.hintText,
    this.textStyle,
    this.focusNode,
    this.isPasswordField = false,
    this.isObscuringHeart = false,
    this.onEditingComplete,
    this.textInputAction,
    this.textCapitalization,
    // this.isPasswordFeild
  }) : super(key: key);

  @override
  _PrimarySTextFormFieldState createState() => _PrimarySTextFormFieldState();
}

class _PrimarySTextFormFieldState extends State<PrimarySTextFormField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = !widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    bool hasText = (widget.controller?.text ?? '').isNotEmpty;
    bool isOptional = false; // Define the boolean variable

    return Column(
      children: [
        if (widget.titleHeader != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Campton',
                    letterSpacing: 5.5,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: const Color(0xffFFFFFF),
                  ),
                  children: [
                    TextSpan(
                      text: widget.titleHeader!,
                    ),
                    if (isOptional)
                      TextSpan(
                        text: ' (optional)',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                  ],
                ),
              ),
            ],
          ),
        if (widget.titleHeader != null)
          SizedBox(
            height: 10.w,
          ),
        SizedBox(
          height: widget.height ?? 48.w,
          child: TextFormField(
            style: widget.textStyle ??
                TextStyle(
                  decorationThickness: 0,
                  color: Colors.white,
                  fontFamily: 'Campton',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
            onTap: widget.onTap,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            textInputAction: widget.textInputAction,
            obscureText: widget.isPasswordField && !passwordVisible,
            enableSuggestions: !widget.isPasswordField,
            autocorrect: !widget.isPasswordField,
            obscuringCharacter: widget.isObscuringHeart ? '❤' : '*',
            maxLines: widget.maxLines ?? 1,
            keyboardType: widget.textInputType,
            readOnly: widget.readOnly ?? false,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            focusNode: widget.focusNode,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    )
                  : widget.suffix,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: widget.hintFontSize ?? 16.sp,
                fontWeight: widget.fontWeight ?? FontWeight.w400,
                color: widget.color ?? const Color(0xffB7B7B7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasText ? Colors.green : Colors.white,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(55.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kDefaultActiveColor,
                ),
                borderRadius: BorderRadius.circular(55.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class PrimarySTextFormField extends StatelessWidget {
//   final String? titleHeader;
//   final bool? readOnly;
//   final double? height;
//   final double? width;
//   final int? maxLines;
//   void Function(String)? onChanged;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? suffix;
//   // final bool isOptional; // Add isOptional parameter
//   final Color? color;
//   final bool? enableBorder;
//   final double? hintFontSize;
//   final FontWeight? fontWeight;
//   final EdgeInsetsGeometry? padding;
//   final TextInputType? textInputType;
//   final TextStyle? titleStyle;
//   final void Function()? onTap;
//   final TextStyle? textStyle;
//   final bool isPasswordFeild;
//   final bool isObscuringHeart = false;
//   final FocusNode? focusNode;
//   final void Function()? onEditingComplete;
//   final TextInputAction? textInputAction;

//   final TextCapitalization? textCapitalization;

//   PrimarySTextFormField({
//     Key? key,
//     this.color,
//     this.onTap,
//     this.padding,
//     this.height,
//     this.width,
//     this.hintFontSize,
//     this.maxLines,
//     this.enableBorder,
//     this.suffix,
//     this.controller,
//     this.titleHeader,
//     this.readOnly,
//     this.onChanged,
//     this.lengthLimitingTextInputFormatter,
//     this.textInputType,
//     this.fontWeight,
//     this.titleStyle,
//     this.hintText,
//     this.textStyle,
//     this.focusNode,
//     // required this.isOptional,
//     this.isPasswordFeild = false,
//     this.onEditingComplete,
//     this.textInputAction,
//     this.textCapitalization,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool hasText = (controller?.text ?? '').isNotEmpty;
//     bool isOptional = true; // Define the boolean variable

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                         fontFamily: 'Campton',
//                         letterSpacing: 5.5,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 10.sp,
//                         color: const Color(0xffFFFFFF),
//                       ),
//                       children: [
//                         TextSpan(
//                           text: titleHeader!,
//                         ),
//                         // if (isOptional) // Replace isOptional with your boolean variable
//                         //   TextSpan(
//                         //     text: ' (optional)',
//                         //     style: TextStyle(fontStyle: FontStyle.italic),
//                         //   ),
//                       ],
//                     ),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         SizedBox(
//           height: height ?? 48.w,
//           // width: MediaQuery.of(context).size.width ?? 48,
//           child: TextFormField(
//             // textAlign: TextAlign.left,
//             style: textStyle ??
//                 TextStyle(
//                   decorationThickness: 0, // letterSpacing: 3,
//                   color: Colors.white,
//                   fontFamily: 'Campton',
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w400,
//                   // fontSize: 21.sp,
//                   // fontWeight: FontWeight.w500,
//                   // letterSpacing: isPasswordFeild ? 0 : -0.5
//                 ),
//             onTap: onTap,
//             textCapitalization: textCapitalization ?? TextCapitalization.none,
//             textInputAction: textInputAction ?? null,
//             obscureText: isPasswordFeild ? true : false,
//             enableSuggestions: isPasswordFeild ? false : true,
//             autocorrect: isPasswordFeild ? false : true,
//             obscuringCharacter: isObscuringHeart ? '❤' : '*',
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             readOnly: readOnly ?? false,
//             // onChanged: onChanged,
//             onChanged: (text) {
//               if (onChanged != null) {
//                 onChanged!(text);
//               }
//             },

//             onEditingComplete: onEditingComplete ?? () {},
//             focusNode: focusNode ?? null,
//             controller: controller,
//             decoration: InputDecoration(
//               suffixIcon: suffix,
//               // fillColor: Colors.white,
//               filled: true,
//               labelStyle: TextStyle(color: Colors.white),
//               hintText: hintText,

//               hintStyle: TextStyle(
//                   fontSize: hintFontSize ?? 16.sp,
//                   fontWeight: fontWeight ?? FontWeight.w400,
//                   color: color ?? const Color(0xffB7B7B7)),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: hasText ? Colors.green : Colors.white,
//                   width: 1.w,
//                 ),
//                 borderRadius: BorderRadius.circular(55.w),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kDefaultActiveColor,
//                 ),
//                 borderRadius: BorderRadius.circular(55.w),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

/////////////////////////JHUrfhv76r7gyjhiy8g6/////////////////////
class PrimarySTextFormFieldNew extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextInputType? textInputType;
  final TextStyle? titleStyle;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final bool isPasswordFeild;
  final bool isObscuringHeart = false;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;

  final TextCapitalization? textCapitalization;

  PrimarySTextFormFieldNew(
      {Key? key,
      this.color,
      this.onTap,
      this.padding,
      this.height,
      this.width,
      this.hintFontSize,
      this.maxLines,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.textInputType,
      this.fontWeight,
      this.titleStyle,
      this.hintText,
      this.textStyle,
      this.focusNode,
      this.isPasswordFeild = false,
      this.onEditingComplete,
      this.textInputAction,
      this.textCapitalization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasText = (controller?.text ?? '').isNotEmpty;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleHeader != null
                ? Text(
                    // textAlign: TextAlign.start,
                    titleHeader ?? "",
                    style: titleStyle ??
                        TextStyle(
                            fontFamily: 'Campton',
                            letterSpacing: 5.5,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: const Color(0xffFFFFFF)),
                  )
                : Container(),
          ],
        ),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          // width: MediaQuery.of(context).size.width ?? 48,
          child: TextFormField(
            // textAlign: TextAlign.left,
            style: textStyle ??
                TextStyle(
                  decorationThickness: 0, // letterSpacing: 3,
                  color: Colors.white,
                  fontFamily: 'Campton',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  // fontSize: 21.sp,
                  // fontWeight: FontWeight.w500,
                  // letterSpacing: isPasswordFeild ? 0 : -0.5
                ),
            onTap: onTap,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            textInputAction: textInputAction ?? null,
            obscureText: isPasswordFeild ? true : false,
            enableSuggestions: isPasswordFeild ? false : true,
            autocorrect: isPasswordFeild ? false : true,
            obscuringCharacter: isObscuringHeart ? '❤' : '*',
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            // onChanged: onChanged,
            onChanged: (text) {
              if (onChanged != null) {
                onChanged!(text);
              }
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
            ],
            onEditingComplete: onEditingComplete ?? () {},
            focusNode: focusNode ?? null,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              // fillColor: Colors.white,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              hintText: hintText,

              hintStyle: TextStyle(
                  fontSize: hintFontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasText ? Colors.green : Colors.white,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(55.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kDefaultActiveColor,
                ),
                borderRadius: BorderRadius.circular(55.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////
class PrimarySTextFormFieldChat extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextInputType? textInputType;
  final TextStyle? titleStyle;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final bool isPasswordFeild;

  PrimarySTextFormFieldChat(
      {Key? key,
      this.color,
      this.onTap,
      this.padding,
      this.height,
      this.width,
      this.hintFontSize,
      this.maxLines,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.textInputType,
      this.fontWeight,
      this.titleStyle,
      this.hintText,
      this.textStyle,
      this.isPasswordFeild = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleHeader != null
                ? Text(
                    // textAlign: TextAlign.start,
                    titleHeader ?? "",
                    style: titleStyle ??
                        TextStyle(
                            letterSpacing: 5.5,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: const Color(0xffFFFFFF)),
                  )
                : Container(),
          ],
        ),
        titleHeader != null
            ? SizedBox(
                height: 15.w,
              )
            : Container(),
        SizedBox(
          // height: height ?? 48.w,
          // width: MediaQuery.of(context).size.width ?? 48,
          child: TextFormField(
            style: textStyle ??
                TextStyle(
                    color: Colors.white,
                    fontFamily: 'Campton',
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: isPasswordFeild ? 0 : -0.5),
            onTap: onTap,
            obscureText: isPasswordFeild ? true : false,
            enableSuggestions: isPasswordFeild ? false : true,
            autocorrect: isPasswordFeild ? false : true,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            // inputFormatters: [
            //   lengthLimitingTextInputFormatter ??
            //       LengthLimitingTextInputFormatter(1000),

            //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
            // ],
            controller: controller,
            decoration: InputDecoration(
              fillColor: Colors.white,
              // border:
              //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
              // border: BorderRadius.circular(),
              suffixIcon: suffix,
              // fillColor: Colors.white,
              filled: true,
              labelStyle: TextStyle(color: Color(0xffFBFBFB)),
              hintText: hintText,
              // contentPadding: padding ??
              //     EdgeInsets.only(
              //         left: 10.w, top: maxLines != null ? 30.w : 0.w),
              hintStyle: TextStyle(
                  fontSize: hintFontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: Color(0xffB5B4B4)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xffE0E0E0)
                      : const Color(0xffEFEFEF),
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.w),
                  topLeft: Radius.circular(
                      20.w), // Set the top-right corner to be non-circular
                  bottomRight: Radius.circular(
                      20.w), // Set the bottom-left corner to be non-circular
                  bottomLeft: Radius.circular(0.w),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xffE0E0E0)
                      : const Color(0xffEFEFEF),
                ),
                // borderRadius: BorderRadius.circular(55.w),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.w),
                  topLeft: Radius.circular(
                      20.w), // Set the top-right corner to be non-circular
                  bottomRight: Radius.circular(
                      20.w), // Set the bottom-left corner to be non-circular
                  bottomLeft: Radius.circular(0.w),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/////////////////////////////////////////////////
class PrimaryInformationTextFormFieldNew extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;

  PrimaryInformationTextFormFieldNew(
      {Key? key,
      this.onTap,
      this.textStyle,
      this.borderColor,
      this.maxLines,
      this.height,
      this.width,
      this.hintStyle,
      this.color,
      this.enableBorder,
      this.suffix,
      this.contentPadding,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.textInputType,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: textInputType,
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(1000),
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: contentPadding ?? EdgeInsets.only(left: 10.w),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: borderColor ?? const Color(0xff989898),
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? const Color(0xff989898),
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////
class MobilenumberTextField extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final TextStyle? textStyle;

  final TextInputAction? textInputAction;

  MobilenumberTextField(
      {Key? key,
      this.color,
      this.textStyle,
      this.onTap,
      this.padding,
      this.height,
      this.width,
      this.hintFontSize,
      this.maxLines,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.textInputType,
      this.fontWeight,
      this.hintText,
      this.onEditingComplete,
      this.focusNode,
      this.textInputAction,
      required TextStyle style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleHeader != null
                ? Text(
                    // textAlign: TextAlign.start,
                    titleHeader ?? "",
                    style: TextStyle(
                        letterSpacing: 5.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: const Color(0xffFFFFFF)),
                  )
                : Container(),
          ],
        ),
        titleHeader != null
            ? SizedBox(
                height: 15.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width ?? 48,
          child: TextFormField(
            // style: TextStyle(color: Colors.white),
            style: textStyle ??
                TextStyle(
                  letterSpacing: 3,
                  color: Colors.white,
                  fontFamily: 'Campton',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  // fontSize: 21.sp,
                  // fontWeight: FontWeight.w400,
                ),
            onTap: onTap,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            textInputAction: textInputAction ?? null,
            // inputFormatters: [
            //   lengthLimitingTextInputFormatter ??
            //       LengthLimitingTextInputFormatter(1000),

            //   // FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
            // ],
            onEditingComplete: onEditingComplete ?? null,
            focusNode: focusNode ?? null,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30.0)),

              //   // border:
              //   //     OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
              //   // border: BorderRadius.circular(),
              //   suffixIcon: suffix,
              //   // fillColor: Colors.white,
              //   filled: true,
              //   // hintText: hintText,
              //   contentPadding: padding ??
              //       EdgeInsets.only(
              //           left: 10.w, top: maxLines != null ? 30.w : 0.w),
              //   hintStyle: TextStyle(
              //       fontSize: hintFontSize ?? 16.sp,
              //       fontWeight: fontWeight ?? FontWeight.w400,
              //       color: color ?? const Color(0xffB7B7B7)),
              //   enabledBorder: OutlineInputBorder(
              //     borderSide: BorderSide(
              //       width: 1.w,
              //       color: enableBorder ?? false
              //           ? const Color(0xffE0E0E0)
              //           : const Color(0xffEFEFEF),
              //     ),
              //     borderRadius: BorderRadius.circular(55.w),
              //   ),
              //   focusedBorder: OutlineInputBorder(
              //     borderSide: BorderSide(
              //       width: 1.w,
              //       color: enableBorder ?? false
              //           ? const Color(0xffE0E0E0)
              //           : const Color(0xffEFEFEF),
              //     ),
              //     borderRadius: BorderRadius.circular(55.w),
              //   ),
            ),
          ),
        ),
      ],
    );
  }
}

/////////////////////////////////ddddddddddddddddd/////////////
// class MobileNoTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final double? height;
//   final bool? enableOrder;
//   final void Function(CountryCode)? onCountryCodeChanged;
//   final void Function(String)? onChanged;
//   final String? initialSelection;
//   final bool? readOnly;
//   final String? titleHeader;
//   final TextStyle? textStyle;
//   final FocusNode? focusNode;
//   final void Function()? onEditingComplete;
//   final TextInputAction? textInputAction;
//   final TextInputType? textInputType;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;

//   const MobileNoTextFormField({
//     Key? key,
//     this.textStyle,
//     this.enableOrder,
//     this.readOnly,
//     this.onChanged,
//     this.height,
//     this.initialSelection,
//     this.titleHeader,
//     required this.controller,
//     this.onCountryCodeChanged,
//     this.focusNode,
//     this.onEditingComplete,
//     this.textInputAction,
//     this.textInputType,
//     this.lengthLimitingTextInputFormatter,

//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String initialCountry = 'TR';
//     PhoneNumber number = PhoneNumber(isoCode: 'TR');
//     bool hasText = (controller?.text ?? '').isNotEmpty;

//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleHeader != null
//                 ? Text(
//                     // textAlign: TextAlign.start,
//                     titleHeader ?? "",
//                     style: TextStyle(
//                         letterSpacing: 3,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 10.sp,
//                         color: const Color(0xffFFFFFF)),
//                   )
//                 : Container(),
//           ],
//         ),
//         titleHeader != null
//             ? SizedBox(
//                 height: 10.w,
//               )
//             : Container(),
//         Container(
//           height: height ?? 50.w,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25.w),
//             color: Colors.black,
//             border: Border.all(
//               color: hasText
//                   ? Colors.green
//                   : (enableOrder ?? false)
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//             ),
//           ),
//           // decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(25.w),
//           //     color: Colors.black,
//           //     border: Border.all(
//           //         color: enableOrder ?? false
//           //             ? const Color(0xffE0E0E0)
//           //             : const Color(0xffEFEFEF))),
//           child: Row(
//             children: [
//               Divider(
//                 thickness: 5,
//                 color: Colors.grey,
//               ),
//               Container(
//                 // decoration: const BoxDecoration(
//                 //   border: Border(
//                 //     right: BorderSide(
//                 //       color: Color(0xff454545),
//                 //       width: 1.0,
//                 //     ),
//                 //     // top: BorderSide(
//                 //     //   color: Colors.pink,
//                 //     //   width: 10.0,
//                 //     // ),
//                 //   ),
//                 // ),
//                 child: CountryCodePicker(
//                   enabled: readOnly == true ? false : true,
//                   flagWidth: 20.w,
//                   flagDecoration: const BoxDecoration(),
//                   padding: EdgeInsets.zero,
//                   onChanged: onCountryCodeChanged,
//                   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                   initialSelection: 'TR',
//                   showFlagDialog: true,
//                   showFlag: true,
//                   showFlagMain: false,
//                   favorite: const ['+ 90'],
//                   textStyle: TextStyle(
//                       letterSpacing: 3,
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white),
//                 ),
//               ),
//               SvgPicture.asset(
//                 "assets/icons/arrow-up-2.svg",
//                 // color: Colors.red,
//               ),
//               SizedBox(
//                 width: 5.w,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 4.0.w, bottom: 4.w),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     border: Border(
//                       right: BorderSide(
//                         color: Color(0xff454545),
//                         width: 1.0,
//                       ),
//                       // top: BorderSide(
//                       //   color: Colors.pink,
//                       //   width: 10.0,
//                       // ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: MobilenumberTextField(

//                   style: textStyle ??
//                       TextStyle(
//                         color: Colors.white,
//                         letterSpacing: 3,
//                         fontFamily: 'Campton',
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                         // fontSize: 21.sp,
//                         // fontWeight: FontWeight.w500,
//                         // letterSpacing: isPasswordFeild ? 0 : -0.5
//                       ),

//                   fontWeight: FontWeight.w500,
//                   enableBorder: false,
//                   color: Colors.white,
//                   textInputAction: textInputAction,
//                   // readOnly: readOnly,
//                   focusNode: focusNode ?? null,
//                   onEditingComplete: onEditingComplete ?? null,
//                   controller: controller,

//                   // lengthLimitingTextInputFormatter:
//                   //     LengthLimitingTextInputFormatter(10),
//                   // onChanged: onChanged,

//                   onChanged: (text) {
//                     if (onChanged != null) {
//                       onChanged!(text);
//                     }
//                   },

//                   hintText: "Mobile Number",
//                   textInputType: TextInputType.number,

//                   // padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 10.w),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

class MobileNoTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final double? height;
  final bool? enableOrder;
  final void Function(CountryCode)? onCountryCodeChanged;
  final void Function(String)? onChanged;
  final String? initialSelection;
  final bool? readOnly;
  final String? titleHeader;
  final TextStyle? textStyle;

  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;

  const MobileNoTextFormField({
    Key? key,
    this.textStyle,
    this.enableOrder,
    this.readOnly,
    this.onChanged,
    this.height,
    this.initialSelection,
    this.titleHeader,
    required this.controller,
    this.onCountryCodeChanged,
    this.focusNode,
    this.onEditingComplete,
    this.textInputAction,
    this.textInputType,
    this.lengthLimitingTextInputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasText = (controller?.text ?? '').isNotEmpty;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (titleHeader != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleHeader!,
                style: TextStyle(
                  letterSpacing: 3,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  color: const Color(0xffFFFFFF),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.w),
        ],
        Container(
          height: height ?? 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.w),
            color: Colors.black,
            border: Border.all(
              color: hasText
                  ? Colors.green
                  : (enableOrder ?? false)
                      ? const Color(0xffE0E0E0)
                      : const Color(0xffEFEFEF),
            ),
          ),
          child: Row(
            children: [
              Container(
                child: Row(
                  children: [
                    CountryCodePicker(
                      enabled: readOnly == true ? false : true,
                      flagWidth: 20.w,
                      flagDecoration: const BoxDecoration(),
                      onChanged: onCountryCodeChanged,
                      initialSelection: 'IN', // Default country
                      showFlagDialog: true,
                      showFlag: true,
                      showFlagMain: false,
                      favorite: const [
                        '+91'
                      ], // Add your favorite country codes
                      textStyle: TextStyle(
                        letterSpacing: 3,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrow-up-2.svg",
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5.w),
              Padding(
                padding: EdgeInsets.only(top: 4.0.w, bottom: 4.w),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Color(0xff454545),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  style: textStyle ??
                      TextStyle(
                        color: Colors.white,
                        letterSpacing: 3,
                        fontFamily: 'Campton',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: textInputAction,
                  focusNode: focusNode,
                  onEditingComplete: onEditingComplete,
                  controller: controller,
                  onChanged: onChanged,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    lengthLimitingTextInputFormatter ??
                        LengthLimitingTextInputFormatter(10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class MobileNoTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final double? height;
//   final bool? enableOrder;
//   final void Function(CountryCode)? onCountryCodeChanged;
//   final void Function(String)? onChanged;
//   final String? initialSelection;
//   final bool? readOnly;
//   final String? titleHeader;
//   final TextStyle? textStyle;

//   final FocusNode? focusNode;

//   final void Function()? onEditingComplete;

//   final TextInputAction? textInputAction;
//   final TextInputType? textInputType;
//   final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;

//   const MobileNoTextFormField({
//     Key? key,
//     this.textStyle,
//     this.enableOrder,
//     this.readOnly,
//     this.onChanged,
//     this.height,
//     this.initialSelection,
//     this.titleHeader,
//     required this.controller,
//     this.onCountryCodeChanged,
//     this.focusNode,
//     this.onEditingComplete,
//     this.textInputAction,
//     this.textInputType,
//     this.lengthLimitingTextInputFormatter,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool hasText = (controller?.text ?? '').isNotEmpty;
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         if (titleHeader != null) ...[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 titleHeader!,
//                 style: TextStyle(
//                   letterSpacing: 3,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 10.sp,
//                   color: const Color(0xffFFFFFF),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10.w),
//         ],
//         Container(
//           height: height ?? 50.w,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25.w),
//             color: Colors.black,
//             border: Border.all(
//               color: hasText
//                   ? Colors.green
//                   : (enableOrder ?? false)
//                       ? const Color(0xffE0E0E0)
//                       : const Color(0xffEFEFEF),
//             ),
//           ),
//           child: Row(
//             children: [
//               Divider(
//                 thickness: 5,
//                 color: Colors.white,
//               ),
//               Container(
//                 child: Row(
//                   children: [
//                     CountryCodePicker(
//                       enabled: readOnly == true ? false : true,
//                       flagWidth: 20.w,
//                       flagDecoration: const BoxDecoration(),
//                       onChanged: onCountryCodeChanged,
//                       initialSelection: 'TR',
//                       showFlagDialog: true,
//                       showFlag: true,
//                       showFlagMain: false,
//                       favorite: const ['+90'],
//                       textStyle: TextStyle(
//                         letterSpacing: 3,
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SvgPicture.asset(
//                       "assets/icons/arrow-up-2.svg",
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 5.w),
//               Padding(
//                 padding: EdgeInsets.only(top: 4.0.w, bottom: 4.w),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     border: Border(
//                       right: BorderSide(
//                         color: Color(0xff454545),
//                         width: 1.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: TextField(
//                   style: textStyle ??
//                       TextStyle(
//                         color: Colors.white,
//                         letterSpacing: 3,
//                         fontFamily: 'Campton',
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                   decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                   ),
//                   keyboardType: TextInputType.number,
//                   textInputAction: textInputAction,
//                   focusNode: focusNode,
//                   onEditingComplete: onEditingComplete,
//                   controller: controller,
//                   onChanged: onChanged,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     lengthLimitingTextInputFormatter ??
//                         LengthLimitingTextInputFormatter(10),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

class MobileNoController extends ChangeNotifier {
  String flagIcon = "";
  String countryCode = "+ 90";

  void onCountrySelected(code, icon) {
    countryCode = "+" + code;
    flagIcon = icon;
    notifyListeners();
  }
}
////////////////////////////ShopConFig DropDown TextField/////////////////////

class PrimarySTextFormFieldShopConfig extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final String? selectedCountryCode;

  PrimarySTextFormFieldShopConfig(
      {Key? key,
      this.color,
      this.onTap,
      this.padding,
      this.height,
      this.width,
      this.hintFontSize,
      this.maxLines,
      this.enableBorder,
      this.suffix,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.textInputType,
      this.fontWeight,
      this.hintText,
      this.selectedCountryCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            titleHeader != null
                ? Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  )
                : Container(),
          ],
        ),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            onTap: onTap,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              // lengthLimitingTextInputFormatter ??
              // LengthLimitingTextInputFormatter(1000),

              FilteringTextInputFormatter.allow(RegExp(r'^[0-9,:]*$'))
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: padding ??
                  EdgeInsets.only(
                      left: 10.w, top: maxLines != null ? 30.w : 0.w),
              hintStyle: TextStyle(
                  fontSize: hintFontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xffE0E0E0)
                      : const Color(0xffEFEFEF),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: enableBorder ?? false
                      ? const Color(0xffE0E0E0)
                      : const Color(0xffEFEFEF),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

////////////////////////// Number Formatter ///////////////////////////////////////////////

class CustomNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String newText =
        newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
    if (newText.length > 10) {
      newText = newText.substring(0, 10); // Limit the length to 10 characters
    }

    // Add spaces at specific intervals
    newText = newText
        .replaceAllMapped(
          RegExp(r".{1,3}"),
          (Match match) => "${match.group(0)} ",
        )
        .trim();

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

////////////////Calender////////////////////////////////
class NewCalender extends StatelessWidget {
  final String? titleHeader;
  final bool? readOnly;
  final double? height;
  final double? width;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;

  NewCalender(
      {Key? key,
      this.onTap,
      this.textStyle,
      this.borderColor,
      this.maxLines,
      this.height,
      this.width,
      this.hintStyle,
      this.color,
      this.enableBorder,
      this.suffix,
      this.contentPadding,
      this.controller,
      this.titleHeader,
      this.readOnly,
      this.textInputType,
      this.onChanged,
      this.lengthLimitingTextInputFormatter,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: textInputType,
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(1000),
            ],
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding: contentPadding ?? EdgeInsets.only(left: 20.w),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: borderColor ?? const Color(0xff989898),
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? const Color(0xff989898),
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

////////////////////////////////////
class CVVPrimaryInformationTextFormField extends StatelessWidget {
  final String? titleHeader;
  // final FormValidator? validator;
  final String? Function(String?)? validator;
  final bool? obscureText; // Add this property
  final bool? readOnly;
  final TextCapitalization? textCapitalization;
  final double? height;
  final double? width;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  void Function(String)? onChanged;
  final LengthLimitingTextInputFormatter? lengthLimitingTextInputFormatter;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Color? color;
  final bool? enableBorder;
  final Color? borderColor;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final String? label; // Add this parameter for the label text
  final double? borderRadius;
  // final bool allowOnlyDigits; // Add this parameter
  // final bool allowCommasAndDotsAndSpaces; // Add this parameter

  CVVPrimaryInformationTextFormField({
    Key? key,
    this.onTap,
    this.label, // Add this parameter for the label text
    this.obscureText, // Add this parameter
    this.textStyle,
    this.borderColor,
    this.maxLines,
    this.height,
    this.width,
    this.textCapitalization,
    this.hintStyle,
    this.color,
    this.enableBorder,
    this.suffix,
    this.contentPadding,
    this.controller,
    this.titleHeader,
    this.readOnly,
    this.textInputType,
    this.onChanged,
    this.lengthLimitingTextInputFormatter,
    this.hintText,
    this.validator,
    this.borderRadius,
    // this.allowOnlyDigits = false,
    // this.allowCommasAndDotsAndSpaces = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool hasText = (controller?.text ?? '').isNotEmpty;
    return Column(
      children: [
        titleHeader != null
            ? Row(
                children: [
                  Text(
                    titleHeader ?? "",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xff3A3A3A)),
                  ),
                ],
              )
            : Container(),
        titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        SizedBox(
          height: height ?? 48.w,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            validator: validator, // Add the validator here
            keyboardType: textInputType ??
                TextInputType.text, // Set a default value if needed
            obscureText: obscureText ?? false, // Set a default value if needed
            style: textStyle,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            inputFormatters: [
              // if (allowOnlyDigits) FilteringTextInputFormatter.digitsOnly,
              // if (!allowCommasAndDotsAndSpaces)
              //   FilteringTextInputFormatter.deny(RegExp(r'[,./]')),
              // if (!allowOnlyDigits)
              //   FilteringTextInputFormatter.allow(
              //     RegExp(r'[a-zA-Z]'), // Allow only alphabetic characters
              //   ),
              lengthLimitingTextInputFormatter ??
                  LengthLimitingTextInputFormatter(3),
            ],
            controller: controller,
            decoration: InputDecoration(
              // labelText: hintText, // Use label text as inline label
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              contentPadding:
                  contentPadding ?? EdgeInsets.only(left: 10.w, top: 20.w),
              hintStyle: hintStyle ??
                  TextStyle(
                      fontFamily: 'Campton',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      //  hasText ? Colors.green :
                      Color(0xff989898),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kDefaultActiveColor,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
