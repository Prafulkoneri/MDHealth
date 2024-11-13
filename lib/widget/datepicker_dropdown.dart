// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DatePickerDropDown extends StatefulWidget {
//   const DatePickerDropDown({super.key});

//   @override
//   State<DatePickerDropDown> createState() => _DatePickerDropDownState();
// }

// class _DatePickerDropDownState extends State<DatePickerDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           margin: EdgeInsets.zero,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: Color(0xffEFEFEF), width: 1.0.w),
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Padding(
//             padding:
//             const EdgeInsets.symmetric(horizontal: 16.0),
//             child: DropdownButton(
//               value: dropdownValue,
//               icon: Padding(
//                 padding: EdgeInsets.only(left: 8.0.w),
//                 child: SvgPicture.asset(
//                   'assets/icons/iconamoon_arrow-up-2.svg',
//                   color: Color(0xff989898),
//                 ),
//               ),
//               style:
//               const TextStyle(color: Color(0xff989898)),
//               underline: SizedBox.shrink(),
//               onChanged: (String? value) {
//                 // This is called when the user selects an item.
//                 setState(() {
//                   dropdownValue = value!;
//                 });
//               },
//               items: list.map<DropdownMenuItem<String>>(
//                       (String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }