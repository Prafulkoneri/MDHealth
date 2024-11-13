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
import 'package:provider/provider.dart';

class PackageViewDetailsPagepopUpTour extends StatefulWidget {
  final String? purchaseId;
  final String? packageId;
  final String? cancelId;
  final String? hotelId;
  final String? transportId;
  final String? tourDetailId;
  final String? type;

  const PackageViewDetailsPagepopUpTour({
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
  State<PackageViewDetailsPagepopUpTour> createState() =>
      _PackageCancellationPopUpState();
}

class _PackageCancellationPopUpState
    extends State<PackageViewDetailsPagepopUpTour> {
  @override
  @override
  Widget build(BuildContext context) {
    final read = context.read<PackageDetailViewController>();
    final watch = context.watch<PackageDetailViewController>();
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, top: 20.w, right: 10.w),
          height: 620.w,
          // color: Color.fromARGB(255, 197, 196, 196),
          width: ScreenUtil().screenWidth,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tour Details",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff3A3A3A)),
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
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Tour Name",
              // "Tour",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff3A3A3A)),
            ),

            Text(
              "${watch.tourDetails?.tourName}",
              // "Tour",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff3A3A3A)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Number of Days",
              // "Tour",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff3A3A3A)),
            ),
            Text(
              // "Renaissence Besiktas ",
              "${watch.tourDetails?.tourDays}",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff3A3A3A)),
            ),
            SizedBox(
              height: 17.h,
            ),

            Text(
              "Tour Details",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff3A3A3A)),
            ),
            Text(
              "${watch.tourDetails?.tourDescription}",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff3A3A3A)),
            ),
            SizedBox(
              height: 50.w,
              width: 50.w,
              child: AppNetworkImages(
                imageUrl: "${watch.tourDetails?.tourImagePath}",
                fit: BoxFit.cover,
              ),
            ),
            // Image.network(
            //   "${watch.tourDetails?.tourImagePath}",
            //   fit: BoxFit.cover,
            // ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    watch.tourDetails?.tourOtherServicesTour?.length ?? 0,
                itemBuilder: (context, index) {
                  final element =
                      watch.tourDetails?.tourOtherServicesTour?[index];
                  return Container(
                    padding: EdgeInsets.only(top: 5.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/subway_tick.svg',
                          width: 9.w,
                          height: 9.h,
                          // alignment: Alignment.topRight,Breakfast & Dinner
                        ),
                        SizedBox(
                          width: 7.h,
                        ),
                        Text(
                          "${element}",
                          // "Breakfast & Dinner",
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
              height: 10.w,
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
                  width: 5.w,
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
              controller: watch.notesTourController,
              maxLines: 100,

              // color: Colors.red,
              height: 100.w,
              // titleHeader: "*Patient Contact Number",
              hintText: "Write notes if any",
              contentPadding: EdgeInsets.only(top: 20, left: 15),
            ),
            SizedBox(
              height: 20.w,
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
                  read.TourNotes(context);

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
          ]),
        ),
      ),
    );
  }
}
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(40.w), // Adjust the value as needed
    //     border: Border.all(
    //       color: Colors.black, // Set the border color as needed
    //       width: 1.0, // Set the border width as needed
    //     ),
    //   ),
    //   padding: EdgeInsets.only(left: 20.w, top: 20.w, right: 10.w),
    //   height: 450.w,
    //   child: AlertDialog(
    //     content: SingleChildScrollView(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 "Tour Details",
    //                 style: TextStyle(
    //                     fontFamily: 'Campton',
    //                     fontSize: 16.sp,
    //                     fontWeight: FontWeight.w700,
    //                     color: const Color(0xff3A3A3A)),
    //               ),
    //               // SvgPicture.asset(
    //               //   "assets/icons/Star.svg",
    //               //   width: 17.w,
    //               //   height: 17.h,
    //               // ),
    //               SizedBox(
    //                 width: 10.w,
    //               ),
    //               GestureDetector(
    //                 onTap: () {
    //                   Navigator.pop(context);
    //                 },
    //                 child: SvgPicture.asset(
    //                   "assets/icons/red_close.svg",
    //                   color: Colors.grey,
    //                   width: 25.w,
    //                 ),
    //               ),
    //               // SvgPicture.asset(
    //               //   "assets/icons/Group 17.svg",
    //               //   color: Colors.red,
    //               // )
    //             ],
    //           ),
    //           SizedBox(
    //             height: 10.h,
    //           ),
    //           Text(
    //             "Vehicle Brand",
    //             style: TextStyle(
    //                 fontFamily: 'Campton',
    //                 fontSize: 16.sp,
    //                 fontWeight: FontWeight.w700,
    //                 color: const Color(0xff3A3A3A)),
    //           ),
    //           SizedBox(
    //             height: 3.h,
    //           ),
    //           Container(
    //             width: 200.w,
    //             child: Text(
    //               "${watch.transportationDetails?.brandName ?? ""}",
    //               // "Renaissence Besiktas ",
    //               // "${watch.hotelList?.hotelAddress}",
    //               style: TextStyle(
    //                   fontFamily: 'Campton',
    //                   fontSize: 14.sp,
    //                   fontWeight: FontWeight.w500,
    //                   color: const Color(0xff3A3A3A)),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 17.h,
    //           ),
    //           Text(
    //             "Model",
    //             style: TextStyle(
    //                 fontFamily: 'Campton',
    //                 fontSize: 16.sp,
    //                 fontWeight: FontWeight.w700,
    //                 color: const Color(0xff3A3A3A)),
    //           ),
    //           SizedBox(
    //             height: 2.h,
    //           ),
    //           Container(
    //             width: 200.w,
    //             child: Text(
    //               "${watch.transportationDetails?.vehicleModelId ?? ""}",
    //               // "Renaissence Besiktas ",
    //               // "${watch.hotelList?.hotelAddress}",
    //               style: TextStyle(
    //                   fontFamily: 'Campton',
    //                   fontSize: 14.sp,
    //                   fontWeight: FontWeight.w500,
    //                   color: const Color(0xff3A3A3A)),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 27.h,
    //           ),
    //           Text(
    //             "Vehicle Class",
    //             style: TextStyle(
    //                 fontFamily: 'Campton',
    //                 fontSize: 16.sp,
    //                 fontWeight: FontWeight.w700,
    //                 color: const Color(0xff3A3A3A)),
    //           ),
    //           Text(
    //             "Economy",
    //             style: TextStyle(
    //                 fontFamily: 'Campton',
    //                 fontSize: 16.sp,
    //                 fontWeight: FontWeight.w500,
    //                 color: const Color(0xff3A3A3A)),
    //           ),
    //           SizedBox(
    //             height: 10.h,
    //           ),
    //           Container(
    //             child: ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: watch.otherServicest?.length ?? 0,
    //               itemBuilder: (context, index) {
    //                 final element = watch.otherServicest?[index];
    //                 return Container(
    //                   padding: EdgeInsets.only(top: 5.w),
    //                   child: Row(
    //                     children: [
    //                       Text(
    //                         "${element}",
    //                         style: TextStyle(
    //                             fontFamily: 'Campton',
    //                             fontSize: 12.sp,
    //                             fontWeight: FontWeight.w500,
    //                             color: const Color(0xff3A3A3A)),
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //           SizedBox(
    //             height: 25.w,
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 "Notes",
    //                 style: TextStyle(
    //                     fontFamily: 'Campton',
    //                     color: Colors.black,
    //                     // letterSpacing: .5,
    //                     fontSize: 16.sp,
    //                     fontWeight: FontWeight.w600),
    //               ),
    //               SizedBox(
    //                 width: 4.w,
    //               ),
    //               Text(
    //                 "*Optional",
    //                 style: TextStyle(
    //                     fontStyle: FontStyle.italic,
    //                     fontFamily: 'Campton',
    //                     color: Colors.black,
    //                     // letterSpacing: .5,
    //                     fontSize: 12.sp,
    //                     fontWeight: FontWeight.w600),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 5.h,
    //           ),
    //           PrimaryInformationTextFormFieldreq(
    //             controller: watch.notesTourController,
    //             borderRadius: 20.w,
    //             // controller: watch.reasonController,
    //             maxLines: 100,
    //             maxLength: 300,

    //             // color: Colors.red,
    //             height: 100.w,
    //             // titleHeader: "*Patient Contact Number",
    //             hintText: "Write notes if any",
    //             contentPadding: EdgeInsets.only(top: 20, left: 15),
    //           ),
    //           SizedBox(
    //             height: 20.w,
    //           ),
    //           Center(
    //             child: PrimaryButton(
    //               // borderColor: Colors.black,
    //               width: 250.w,
    //               height: 30.w,

    //               borderRadius: 30,

    //               color: Color(0xff4CDB06),
    //               // color: kDefaultActiveColor,
    //               onTap: () {
    //                 Navigator.pop(context);
    //                 read.TourNotes(
    //                   context,
    //                 );
    //                 print("object");
    //               },
    //               child: Text(
    //                 "Submit",
    //                 style: TextStyle(
    //                     fontFamily: 'Campton',
    //                     color: Colors.black,
    //                     // letterSpacing: .5,
    //                     fontSize: 16.sp,
    //                     fontWeight: FontWeight.w600),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
//   }
// }
