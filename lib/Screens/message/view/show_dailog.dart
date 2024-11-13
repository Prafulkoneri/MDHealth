// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';
// import 'package:md_health/Screens/message/controller/conversations_list_controller.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:provider/provider.dart';

// class ShowMyDailog extends StatefulWidget {
//   final String? object;
//   final String? dateTime;
//   final String? convertionId;
//   const ShowMyDailog(
//       {super.key,
//       required this.dateTime,
//       required this.object,
//       required this.convertionId});

//   @override
//   State<ShowMyDailog> createState() => _ShowMyDailogState();
// }

// class _ShowMyDailogState extends State<ShowMyDailog> {
//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<ConversationListController>().initState(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final watch = context.watch<ConversationListController>();
//     final read = context.read<ConversationListController>();
//     return Container(
//       // padding: EdgeInsets.only(right: 20.w),
//       width: ScreenUtil().screenWidth,
//       height: 480.h,
//       // padding:
//       //     EdgeInsets.only(bottom: 10.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               padding: EdgeInsets.only(right: 20.w, top: 16.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SvgPicture.asset("assets/icons/Close-Square black.svg"),
//                 ],
//               ),
//             ),
//           ),

//           SizedBox(
//             height: 5.h,
//           ),
//           Text(
//             "Make a Live Conversation Appoinment",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.black,
//                 // letterSpacing: .5,
//                 fontSize: 23.sp,
//                 fontWeight: FontWeight.w700),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Text(
//             "Fill the form & get your live conversation appoinment",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.black,
//                 // letterSpacing: .5,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w400),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Column(
//             children: [
//               GridView.builder(
//                   shrinkWrap: true,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 5, // number of items in each row
//                     mainAxisSpacing: 5.0, // spacing between rows
//                     crossAxisSpacing: 5.0, // spacing between columns
//                   ),
//                   padding: EdgeInsets.all(10.0), // padding around the grid
//                   itemCount: watch.timeSelectData?.length ??
//                       0, // total number of items
//                   itemBuilder: (context, index) {
//                     final element = watch.timeSelectData?[index];
//                     final isSelected = watch.selectedIndex == index;

//                     return GestureDetector(
//                         onTap: () {
//                           print("objectffffffffffff");
//                           read.onSelectItem(index);
//                         },
//                         child: element?.status == "booked"
//                             ? Container(
//                                 padding: EdgeInsets.all(6.w),
//                                 decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     // border: Border.all(
//                                     //   width: 1,
//                                     //   color: isSelected
//                                     //       ? Colors.transparent
//                                     //       : Color(0xff989898),
//                                     // ),
//                                     borderRadius: BorderRadius.circular(35)),
//                                 child: Center(
//                                   child: Text(
//                                     "${element?.time}",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ))
//                             : Container(
//                                 padding: EdgeInsets.all(6.w),
//                                 decoration: BoxDecoration(
//                                     color: isSelected
//                                         ? Color(0xffF55C5C)
//                                         : Colors.transparent,
//                                     border: Border.all(
//                                       width: 1,
//                                       color: isSelected
//                                           ? Colors.transparent
//                                           : Color(0xff989898),
//                                     ),
//                                     borderRadius: BorderRadius.circular(35)),
//                                 child: Center(
//                                   child: Text(
//                                     "${element?.time}",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: watch.isCheckedOne
//                                             ? Colors.white
//                                             : Colors.black,
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 )));
//                   }),
//             ],
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           PrimaryButton(
//             // borderColor: Colors.black,
//             width: 250.w,
//             height: 45.w,

//             borderRadius: 30,

//             color: Color(0xff4CDB06),
//             // color: kDefaultActiveColor,
//             onTap: () {
//               // Navigator.pop(context);
//               print(watch.selectedIndex);
//               print(widget.object);
//               print(widget.dateTime);
//               print("time          ${watch.selectedIndex}     ");
//               print("object");
//               print("convertion Id${widget.convertionId}");
//               print("object");
//               // return;
//               read.videoSheduling(context, watch.selectedTime, widget.object,
//                   widget.dateTime, widget.convertionId);
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => SignUpView()),
//               // );
//             },
//             child: Text(
//               "Submit",
//               style: TextStyle(
//                   color: Colors.black,
//                   // letterSpacing: .5,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//           // Row(
//           //   children: [
//           //     SeconderyCheckBox(
//           //       // value: watch.isVerifyChecked,
//           //       onChanged: (value) {
//           //         // read.onVerifyChecked(value);
//           //       },
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';
import 'package:md_health/Screens/message/controller/conversations_list_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:provider/provider.dart';

class ShowMyDailog extends StatefulWidget {
  final String? selectedObject;
  final String? selectedDate;
  final String? convertionId;
  const ShowMyDailog(
      {super.key,
      required this.selectedObject,
      required this.selectedDate,
      required this.convertionId});

  @override
  State<ShowMyDailog> createState() => _ShowMyDailogState();
}

class _ShowMyDailogState extends State<ShowMyDailog> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ConversationListController>().initState(context);
    });
    
    print('************');
    print(widget.convertionId);
    print(widget.selectedObject);
    print(widget.selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<ConversationListController>();
    final read = context.read<ConversationListController>();
    return Container(
      // padding: EdgeInsets.only(right: 20.w),
      width: ScreenUtil().screenWidth,
      height: 480.h,
      // padding:
      //     EdgeInsets.only(bottom: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(right: 20.w, top: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/icons/Close-Square black.svg"),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 5.h,
          ),
          Text(
            "Make a Live Conversation Appoinment",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                // letterSpacing: .5,
                fontSize: 23.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Fill the form & get your live conversation appoinment",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                // letterSpacing: .5,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, // number of items in each row
                    mainAxisSpacing: 5.0, // spacing between rows
                    crossAxisSpacing: 5.0, // spacing between columns
                  ),
                  padding: EdgeInsets.all(10.0), // padding around the grid
                  itemCount: watch.timeSelectData?.length ??
                      0, // total number of items
                  itemBuilder: (context, index) {
                    final element = watch.timeSelectData?[index];
                    final isSelected = watch.selectedIndex == index;

                    return GestureDetector(
                        onTap: () {
                          print("objectffffffffffff");
                          read.onSelectItem(index);
                        },
                        child: element?.status == "booked"
                            ? Container(
                                padding: EdgeInsets.all(6.w),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    // border: Border.all(
                                    //   width: 1,
                                    //   color: isSelected
                                    //       ? Colors.transparent
                                    //       : Color(0xff989898),
                                    // ),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Center(
                                  child: Text(
                                    "${element?.time}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ))
                            : Container(
                                padding: EdgeInsets.all(6.w),
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? Color(0xffF55C5C)
                                        : Colors.transparent,
                                    border: Border.all(
                                      width: 1,
                                      color: isSelected
                                          ? Colors.transparent
                                          : Color(0xff989898),
                                    ),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Center(
                                  child: Text(
                                    "${element?.time}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: watch.isCheckedOne
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )));
                  }),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          PrimaryButton(
            // borderColor: Colors.black,
            width: 250.w,
            height: 45.w,

            borderRadius: 30,

            color: Color(0xff4CDB06),
            // color: kDefaultActiveColor,
            onTap: () {
              // Navigator.pop(context);
              print(watch.selectedIndex);
              print(widget.selectedObject);
              print(widget.selectedDate);
              print("time          ${watch.selectedIndex}     ");
              print("object");
              print("convertion Id${widget.convertionId}");
              print("object");
              // return;
              read.videoSheduling(
                  context,
                  watch.selectedTime,
                  widget.selectedObject,
                  widget.selectedDate,
                  widget.convertionId);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SignUpView()),
              // );
            },
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.black,
                  // letterSpacing: .5,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          // Row(
          //   children: [
          //     SeconderyCheckBox(
          //       // value: watch.isVerifyChecked,
          //       onChanged: (value) {
          //         // read.onVerifyChecked(value);
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
