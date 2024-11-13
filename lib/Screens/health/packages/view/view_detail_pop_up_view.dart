// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/packages/controller/package_detail_view_controller.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';

// class PackageViewDetailsPagepopUp extends StatefulWidget {
//   final String? purchaseId;
//   final String? packageId;
//   final String? cancelId;
//   final String? hotelId;
//   final String? transportId;
//   final String? tourDetailId;
//   final String? type;

//   const PackageViewDetailsPagepopUp({
//     super.key,
//     this.purchaseId,
//     this.packageId,
//     this.cancelId,
//     this.hotelId,
//     this.transportId,
//     this.tourDetailId,
//     this.type,
//   });

//   @override
//   State<PackageViewDetailsPagepopUp> createState() =>
//       _PackageCancellationPopUpState();
// }

// class _PackageCancellationPopUpState
//     extends State<PackageViewDetailsPagepopUp> {
//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<PackageDetailViewController>().initState(
//             context,
//             widget.packageId,
//             widget.purchaseId,
//             widget.hotelId,
//             widget.transportId,
//             widget.tourDetailId,
//             widget.type,
//           );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<PackageDetailViewController>();
//     final watch = context.watch<PackageDetailViewController>();
//     return Dialog(
//       child: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(left: 20.w, top: 20.w, right: 10.w),
//           height: 550.w,
//           // color: Color.fromARGB(255, 197, 196, 196),
//           width: ScreenUtil().screenWidth,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Acommodition Details",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w700,
//                         color: const Color(0xff3A3A3A)),
//                   ),
//                   // SvgPicture.asset(
//                   //   "assets/icons/Star.svg",
//                   //   width: 17.w,
//                   //   height: 17.h,
//                   // ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: SvgPicture.asset(
//                       "assets/icons/red_close.svg",
//                       color: Colors.grey,
//                       width: 25.w,
//                     ),
//                   ),
//                   // SvgPicture.asset(
//                   //   "assets/icons/Group 17.svg",
//                   //   color: Colors.red,
//                   // )
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Text(
//                 // "",

//                 "Hotel",
//                 style: TextStyle(
//                     fontFamily: 'Campton',
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w700,
//                     color: const Color(0xff3A3A3A)),
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//               Container(
//                 width: 200.w,
//                 child: Text(
//                   "${watch.hotelList?.hotelName}",
//                   // "Renaissence Besiktas ",
//                   // "${watch.hotelList?.hotelAddress}",
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                       color: const Color(0xff3A3A3A)),
//                 ),
//               ),
//               SizedBox(
//                 height: 17.h,
//               ),
//               Text(
//                 "Hotel Stars",
//                 style: TextStyle(
//                     fontFamily: 'Campton',
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w700,
//                     color: const Color(0xff3A3A3A)),
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: List.generate(
//                   int.tryParse(watch.hotelList?.hotelStarts ?? '0') ?? 0,
//                   (index) => Padding(
//                     padding: EdgeInsets.only(right: 3.h),
//                     child: SvgPicture.asset(
//                       "assets/icons/Star.svg",
//                       width: 17.w,
//                       height: 17.h,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 27.h,
//               ),
//               Text(
//                 "Hotel Details",
//                 style: TextStyle(
//                     fontFamily: 'Campton',
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w700,
//                     color: const Color(0xff3A3A3A)),
//               ),
//               Text(
//                 "Everything Included",
//                 style: TextStyle(
//                     fontFamily: 'Campton',
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                     color: const Color(0xff3A3A3A)),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Container(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: watch.hotelList?.hotelOtherServices?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     final element = watch.hotelList?.hotelOtherServices?[index];
//                     return Container(
//                       padding: EdgeInsets.only(top: 5.w),
//                       child: Row(
//                         children: [
//                           Text(
//                             "${element}",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: const Color(0xff3A3A3A)),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 25.w,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     "Notes",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         // letterSpacing: .5,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(
//                     width: 4.w,
//                   ),
//                   Text(
//                     "*Optional",
//                     style: TextStyle(
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         // letterSpacing: .5,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               PrimaryInformationTextFormFieldreq(
//                 borderRadius: 20.w,
//                 controller: watch.notesAccomodatiopnController,
//                 maxLines: 100,
//                 maxLength: 200,

//                 // color: Colors.red,
//                 height: 100.w,
//                 // titleHeader: "*Patient Contact Number",
//                 hintText: "Write notes if any",
//                 contentPadding: EdgeInsets.only(top: 20, left: 15),
//               ),
//               SizedBox(
//                 height: 40.w,
//               ),
//               Center(
//                 child: PrimaryButton(
//                   // borderColor: Colors.black,
//                   width: 250.w,
//                   height: 30.w,

//                   borderRadius: 30,

//                   color: Color(0xff4CDB06),
//                   // color: kDefaultActiveColor,
//                   onTap: () {
//                     Navigator.pop(context);
//                     read.AccomopdationNotes(context);

//                     print("object");
//                     // read.packageDeleteActiveStatus(context,
//                     //     widget.cancelId.toString(), widget.purchaseId.toString());
//                   },
//                   child: Text(
//                     "Submit",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         // letterSpacing: .5,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/packages/controller/package_detail_view_controller.dart';
import 'package:md_health/Screens/health/packages/controller/packages_view_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:md_health/Screens/health/packages/controller/package_detail_view_controller.dart';
import 'package:provider/provider.dart';

class PackageViewDetailsPagepopUp extends StatefulWidget {
  final String? purchaseId;
  final String? packageId;
  final String? cancelId;
  final String? hotelId;
  final String? transportId;
  final String? tourDetailId;
  final String? type;

  const PackageViewDetailsPagepopUp({
    super.key,
    this.purchaseId,
    this.packageId,
    this.cancelId,
    this.hotelId,
    this.transportId,
    this.tourDetailId,
    this.type,
  });

  @override
  State<PackageViewDetailsPagepopUp> createState() =>
      _PackageCancellationPopUpState();
}

class _PackageCancellationPopUpState
    extends State<PackageViewDetailsPagepopUp> {
  @override
  // void initState() {
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     context.read<PackageDetailViewController>().initState(
  //           context,
  //           widget.packageId,
  //           widget.purchaseId,
  //           widget.hotelId,
  //           widget.transportId,
  //           widget.tourDetailId,
  //           widget.type,
  //         );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PackageDetailViewController>();
    final watch = context.watch<PackageDetailViewController>();
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, top: 20.w, right: 10.w),
          height: 600.w,
          // color: Color.fromARGB(255, 197, 196, 196),
          width: ScreenUtil().screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Accommodation Details",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff3A3A3A)),
                  ),
                  // SvgPicture.asset(
                  //   "assets/icons/Star.svg",
                  //   width: 17.w,
                  //   height: 17.h,
                  // ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/red_close.svg",
                      color: Colors.grey,
                      width: 25.w,
                    ),
                  ),
                  // SvgPicture.asset(
                  //   "assets/icons/Group 17.svg",
                  //   color: Colors.red,
                  // )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                // "",

                "Hotel",
                style: TextStyle(
                    fontFamily: 'Campton',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff3A3A3A)),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                width: 200.w,
                child: Text(
                  "${watch.hotelList?.hotelName}",
                  // "Renaissence Besiktas ",
                  // "${watch.hotelList?.hotelAddress}",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3A3A3A)),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Text(
                "Hotel Stars",
                style: TextStyle(
                    fontFamily: 'Campton',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff3A3A3A)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  int.tryParse(watch.hotelList?.hotelStarts ?? '0') ?? 0,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 3.h),
                    child: SvgPicture.asset(
                      "assets/icons/Star.svg",
                      width: 17.w,
                      height: 17.h,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 27.h,
              ),
              Text(
                "Hotel Details",
                style: TextStyle(
                    fontFamily: 'Campton',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff3A3A3A)),
              ),
              Text(
                "Everything Included",
                style: TextStyle(
                    fontFamily: 'Campton',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3A3A3A)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: watch.hotelList?.hotelOtherServices?.length ?? 0,
                  itemBuilder: (context, index) {
                    final element = watch.hotelList?.hotelOtherServices?[index];
                    return Container(
                      padding: EdgeInsets.only(top: 5.w),
                      child: Row(
                        children: [
                          Text(
                            "${element}",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff3A3A3A)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50.w,
                width: 50.w,
                child: AppNetworkImages(
                  imageUrl: "${watch.hotelList?.hotelImagePath}",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 25.w,
              ),
              Row(
                children: [
                  Text(
                    "Notes",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        // letterSpacing: .5,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "*Optional",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Campton',
                        color: Colors.black,
                        // letterSpacing: .5,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              PrimaryInformationTextFormFieldreq(
                borderRadius: 20.w,
                controller: watch.notesAccomodatiopnController,
                maxLines: 100,
                maxWords: 200,

                // color: Colors.red,
                height: 100.w,
                // titleHeader: "*Patient Contact Number",
                hintText: "Write notes if any",
                contentPadding: EdgeInsets.only(top: 20, left: 15),
              ),
              SizedBox(
                height: 40.w,
              ),
              Center(
                child: PrimaryButton(
                  // borderColor: Colors.black,
                  width: 250.w,
                  height: 30.w,

                  borderRadius: 30,

                  color: Color(0xff4CDB06),
                  // color: kDefaultActiveColor,
                  onTap: () {
                    Navigator.pop(context);
                    read.AccomopdationNotes(context);

                    print("object");
                    // read.packageDeleteActiveStatus(context,
                    //     widget.cancelId.toString(), widget.purchaseId.toString());
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        // letterSpacing: .5,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
