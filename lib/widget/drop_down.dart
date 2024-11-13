import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/constants/styles/colors.dart';

class CDropDownField extends StatefulWidget {
  final String? hint;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final String? value;

  const CDropDownField(
      {Key? key,
      this.value,
      this.hint,
      this.onChanged,
      this.items,
      this.titleHeader})
      : super(key: key);

  @override
  _CDropDownFieldState createState() => _CDropDownFieldState();
}

class _CDropDownFieldState extends State<CDropDownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        DropdownButtonFormField2(
          value: widget.value,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            isDense: true,
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEFEFEF))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEFEFEF))),
            //Add more decoration as you want here
            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
          ),
          isExpanded: true,
          hint: Text(
            widget.hint ?? "",
            style: TextStyle(fontSize: 14.sp),
          ),
          items: widget.items,
          validator: (value) {
            if (value == null) {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: widget.onChanged,
          onSaved: (value) {
            selectedValue = value.toString();
          },
          buttonStyleData: ButtonStyleData(
            height: 48.w,
            // padding: EdgeInsets.only(left: 20, right: 10),
          ),
          iconStyleData: IconStyleData(
            icon: Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Color(0xff3A3A3A),
              ),
            ),
            iconSize: 20,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 210.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
/////////////////////////////////////////////////Sign Up DropDown////////////////

class SignUpDropDown extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final String? optionalText;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final bool Function(DropdownMenuItem, String)? searchFunction;
  final void Function(String)? onSearch;
  final double? titleSize;
  final FocusNode? focusNode;

  const SignUpDropDown(
      {Key? key,
      this.value,
      this.textEditingController,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.items,
      this.onSearch,
      this.searchFunction,
      this.titleHeader,
      this.focusNode,
      this.optionalText})
      : super(key: key);

  @override
  _SignUpDropDownState createState() => _SignUpDropDownState();
}

class _SignUpDropDownState extends State<SignUpDropDown> {
  String? selectedValue;
  bool hasValue = false;
  Color borderColor = Colors.white; // Default border color

  @override
  void initState() {
    super.initState();
    hasValue = widget.value != null && widget.value.toString().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.titleHeader !=
            null) // Add this line to conditionally render the header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    letterSpacing: 5.5,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: const Color(0xffFFFFFF)),
              ),
              if (widget.optionalText !=
                  null) // Add this line to conditionally render the optional text
                SizedBox(
                    width:
                        5), // Add a space between the header and optional text
              Text(
                widget.optionalText ?? "", // Your optional text
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        if (widget.titleHeader !=
            null) // Add this line to conditionally render the space
          SizedBox(
            height: 10.w,
          ),
        Container(
          height: 50.h,
          child: DropdownButtonFormField2(
            focusNode: widget.focusNode,
            value: widget.value,
            isDense: true,
            // onChanged: widget.onChanged,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              widget.onChanged!(value);
            },
            decoration: InputDecoration(
              isDense: true,
              // fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.value != null ? Colors.green : Colors.white,
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
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: widget.hintSize ?? 21.sp,
                  color: const Color(0xff727272),
                  fontWeight: FontWeight.w500),
            ),
            items: widget.items,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                child: SvgPicture.asset(
                  "assets/icons/arrow-up-2.svg",
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////
class SDropDownField extends StatefulWidget {
  final String? hint;
  final Color? borderColor;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final bool Function(DropdownMenuItem, String)? searchFunction;
  final void Function(String)? onSearch;
  final double? titleSize;

  const SDropDownField(
      {Key? key,
      this.value,
      this.textEditingController,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.items,
      this.borderColor,
      this.onSearch,
      this.searchFunction,
      this.titleHeader})
      : super(key: key);

  @override
  _SDropDownFieldState createState() => _SDropDownFieldState();
}

class _SDropDownFieldState extends State<SDropDownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: widget.titleSize ?? 14.sp,
                    color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        Container(
          // height: 45.w,
          child: DropdownButtonFormField2(
            value: widget.value,
            isDense: true,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     width: 1.w,
              //     color: borderColor ?? const Color(0xff989898),
              //   ),
              //   borderRadius: BorderRadius.circular(20.w),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: borderColor ?? const Color(0xff989898),
              //   ),
              //   borderRadius: BorderRadius.circular(20.w),
              // ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.w),
                  borderSide: BorderSide(width: 1.w, color: Color(0xff989898))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.w),
                  borderSide: const BorderSide(color: Color(0xff989898))),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontSize: widget.hintSize ?? 16.sp,
                  color: const Color(0xffB7B7B7),
                  fontWeight: FontWeight.w400),
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
              // padding: EdgeInsets.only(left: 20, right: 10),
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                // child: SvgPicture.asset("assets/icons/Arrow---Down-Circle.svg"),
                child: SvgPicture.asset("assets/icons/latest_drop_down.svg"),
              ),
              // iconSize: 30,
            ),
            // dropdownStyleData: DropdownStyleData(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffE0E0E0)),
            //     borderRadius: BorderRadius.circular(5.w),
            //   ),
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchDropDownField extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final double? titleSize;

  const SearchDropDownField(
      {Key? key,
      this.value,
      required this.textEditingController,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.items,
      this.titleHeader})
      : super(key: key);

  @override
  _SearchDropDownFieldState createState() => _SearchDropDownFieldState();
}

class _SearchDropDownFieldState extends State<SearchDropDownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: widget.titleSize ?? 14.sp,
                    color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        Container(
          // height: 45.w,
          child: DropdownButtonFormField2(
            dropdownSearchData: DropdownSearchData(
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
              //     (item, searchValue) {
              //   print(item);
              //   print(searchValue);
              //   return item.value.toString().contains(searchValue);
              // },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                widget.textEditingController?.clear();
              }
            },
            value: widget.value,
            isDense: true,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.w),
                  borderSide: const BorderSide(color: Color(0xffEFEFEF))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.w),
                  borderSide: const BorderSide(color: Color(0xffEFEFEF))),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontSize: widget.hintSize ?? 16.sp,
                  color: const Color(0xffB7B7B7),
                  fontWeight: FontWeight.w400),
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
              // padding: EdgeInsets.only(left: 20, right: 10),
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                child: SvgPicture.asset("assets/icons/Arrow---Down-Circle.svg"),
              ),
              // iconSize: 30,
            ),
            // dropdownStyleData: DropdownStyleData(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffE0E0E0)),
            //     borderRadius: BorderRadius.circular(5.w),
            //   ),
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////////
class PackageDropDownSearchList extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final double? titleSize;

  const PackageDropDownSearchList(
      {Key? key,
      this.value,
      required this.textEditingController,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.items,
      this.titleHeader})
      : super(key: key);

  @override
  _PackageDropDownSearchListState createState() =>
      _PackageDropDownSearchListState();
}

class _PackageDropDownSearchListState extends State<PackageDropDownSearchList> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: widget.titleSize ?? 14.sp,
                    color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        Container(
          // height: 45.w,
          child: DropdownButtonFormField2(
            dropdownSearchData: DropdownSearchData(
              searchController: widget.textEditingController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  controller: widget.textEditingController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff3A3A3A)),
                    //  TextStyle(
                    //   fontSize: 12,
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
              //     (item, searchValue) {
              //   print(item);
              //   print(searchValue);
              //   return item.value.toString().contains(searchValue);
              // },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                widget.textEditingController?.clear();
              }
            },
            value: widget.value,
            isDense: true,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.w),
                  borderSide: const BorderSide(color: Color(0xffEFEFEF))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.w),
                  borderSide: const BorderSide(color: Color(0xffEFEFEF))),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontSize: widget.hintSize ?? 14.sp,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400),
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
              // padding: EdgeInsets.only(left: 20, right: 10),
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                child: SvgPicture.asset("assets/icons/drop_down1.svg"),
              ),
              // iconSize: 30,
            ),
            // dropdownStyleData: DropdownStyleData(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffE0E0E0)),
            //     borderRadius: BorderRadius.circular(5.w),
            //   ),
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////
class SecondarySDropDownField extends StatefulWidget {
  final String? hint;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final Widget? suffixIcon;
  final double? titleSize;

  const SecondarySDropDownField(
      {Key? key,
      this.value,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.suffixIcon,
      this.items,
      this.titleHeader})
      : super(key: key);

  @override
  _SecondarySDropDownFieldState createState() =>
      _SecondarySDropDownFieldState();
}

class _SecondarySDropDownFieldState extends State<SecondarySDropDownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: widget.titleSize ?? 14.sp,
                    color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        Container(
          // height: 45.w,
          child: DropdownButtonFormField2(
            value: widget.value,
            isDense: true,
            decoration: InputDecoration(
              suffixIcon: widget.value == null
                  ? null
                  : Container(
                      padding: EdgeInsets.only(right: 0.w),
                      child: widget.suffixIcon),
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.w),
                  borderSide: const BorderSide(color: Color(0xffEFEFEF))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.w),
                  borderSide: const BorderSide(color: Color(0xffEFEFEF))),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontSize: widget.hintSize ?? 16.sp,
                  color: const Color(0xffB7B7B7),
                  fontWeight: FontWeight.w400),
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
              // padding: EdgeInsets.only(left: 20, right: 10),
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ??
                    EdgeInsets.only(
                        right: widget.suffixIcon != null ? 0.w : 22.w),
                child: SvgPicture.asset("assets/icons/dropdown.svg"),
              ),
              // iconSize: 30,
            ),
            // dropdownStyleData: DropdownStyleData(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffE0E0E0)),
            //     borderRadius: BorderRadius.circular(5.w),
            //   ),
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////////
class CustomDropDownSearchList extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final double? titleSize;

  const CustomDropDownSearchList(
      {Key? key,
      this.value,
      required this.textEditingController,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.items,
      this.titleHeader})
      : super(key: key);

  @override
  _CustomDropDownSearchListState createState() =>
      _CustomDropDownSearchListState();
}

class _CustomDropDownSearchListState extends State<CustomDropDownSearchList> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: widget.titleSize ?? 14.sp,
                    color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        Container(
          // height: 45.w,
          child: DropdownButtonFormField2(
            dropdownSearchData: DropdownSearchData(
              searchController: widget.textEditingController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurStyle: BlurStyle.outer,
                      blurRadius: 1,
                      spreadRadius: 10,
                    )
                  ]),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: widget.textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                      hintText: 'Search...',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
              //     (item, searchValue) {
              //   print(item);
              //   print(searchValue);
              //   return item.value.toString().contains(searchValue);
              // },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                widget.textEditingController?.clear();
              }
            },
            value: widget.value,
            isDense: true,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.w),
                  borderSide: const BorderSide(
                    color: Color(0xffEFEFEF),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.w),
                  borderSide: const BorderSide(color: Color(0xffEFEFEF))),

              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 16.sp,
                  color: const Color(0xffB7B7B7),
                  fontWeight: FontWeight.w400),
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
              // padding: EdgeInsets.only(left: 20, right: 10),
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                child: SvgPicture.asset("assets/icons/drop_down1.svg"),
              ),
              // iconSize: 30,
            ),
            // dropdownStyleData: DropdownStyleData(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffE0E0E0)),
            //     borderRadius: BorderRadius.circular(5.w),
            //   ),
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////
class ProfileDropDown extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final dynamic value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final double? titleSize;
  final String? labelText; // Add label text property

  const ProfileDropDown({
    Key? key,
    this.value,
    required this.textEditingController,
    this.titleSize,
    this.iconPadding,
    this.height,
    this.hint,
    this.hintSize,
    this.onChanged,
    this.items,
    this.titleHeader,
    this.labelText,
  }) : super(key: key);

  @override
  _ProfileDropDownState createState() => _ProfileDropDownState();
}

class _ProfileDropDownState extends State<ProfileDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButtonFormField2(
              isDense: true,
              alignment: Alignment.centerLeft,
              dropdownSearchData: DropdownSearchData(
                searchMatchFn: (item, searchValue) {
                  return item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  widget.textEditingController?.clear();
                }
              },
              value: widget.value,
              // isDense: true,
              decoration: InputDecoration(
                isDense: true,
                labelText: widget.labelText, // Set the labelText here
                fillColor: Colors.transparent,
                filled: true,
                contentPadding: EdgeInsets.zero,
                enabledBorder: InputBorder.none, // Set to InputBorder.none
                focusedBorder: InputBorder.none, // Set to InputBorder.none
              ),
              isExpanded: true,
              hint: Text(
                widget.hint ?? "",
                style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff8B8B8B),
                ),
              ),
              items: widget.items,
              onChanged: widget.onChanged,
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: ButtonStyleData(
                height: widget.height ?? 48.w,
              ),
              iconStyleData: IconStyleData(
                icon: Padding(
                  padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                  child: SvgPicture.asset(
                    "assets/icons/iconamoon_arrow-up-new.svg",
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                width: ScreenUtil().setWidth(300.w),
                maxHeight: 210.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//  "assets/icons/iconamoon_arrow-up-new.svg",
class ProfileDropDownInformation extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final double? titleSize;

  const ProfileDropDownInformation(
      {Key? key,
      this.value,
      required this.textEditingController,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.items,
      this.titleHeader})
      : super(key: key);

  @override
  _ProfileDropDownInformationState createState() =>
      _ProfileDropDownInformationState();
}

class _ProfileDropDownInformationState
    extends State<ProfileDropDownInformation> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: const Color(0xff3A3A3A)),
                // style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     fontSize: widget.titleSize ?? 14.sp,
                //     color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        Container(
          // height: 45.w,
          child: DropdownButtonFormField2(
            dropdownSearchData: DropdownSearchData(
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
              //     (item, searchValue) {
              //   print(item);
              //   print(searchValue);
              //   return item.value.toString().contains(searchValue);
              // },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                widget.textEditingController?.clear();
              }
            },
            value: widget.value,
            isDense: true,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: const Color(0xff989898),
                ),
                borderRadius: BorderRadius.circular(25.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.w),
                borderSide: BorderSide(
                  width: 1.w,
                  color: const Color(0xff989898),
                ),
              ),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffB7B7B7)),
              // style: TextStyle(
              //     fontSize: 16.sp,
              //     fontWeight: FontWeight.w400,
              //     color: const Color(0xffB7B7B7)),
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
              // padding: EdgeInsets.only(left: 20, right: 10),
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                child: SvgPicture.asset("assets/icons/Arrow---Down-Circle.svg"),
              ),
              // iconSize: 30,
            ),
            // dropdownStyleData: DropdownStyleData(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffE0E0E0)),
            //     borderRadius: BorderRadius.circular(5.w),
            //   ),
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////
class ChangeDropDownInformation extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final double? titleSize;

  const ChangeDropDownInformation(
      {Key? key,
      this.value,
      required this.textEditingController,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.items,
      this.titleHeader})
      : super(key: key);

  @override
  _ChangeDropDownInformationState createState() =>
      _ChangeDropDownInformationState();
}

class _ChangeDropDownInformationState extends State<ChangeDropDownInformation> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: const Color(0xff3A3A3A)),
                // style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     fontSize: widget.titleSize ?? 14.sp,
                //     color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        Container(
          // height: 45.w,
          child: DropdownButtonFormField2(
            dropdownSearchData: DropdownSearchData(
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
              //     (item, searchValue) {
              //   print(item);
              //   print(searchValue);
              //   return item.value.toString().contains(searchValue);
              // },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                widget.textEditingController?.clear();
              }
            },
            value: widget.value,
            isDense: true,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: const Color(0xff989898),
                ),
                borderRadius: BorderRadius.circular(25.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.w),
                borderSide: BorderSide(
                  width: 1.w,
                  color: const Color(0xff989898),
                ),
              ),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontFamily: 'Campton', fontSize: 14.sp, color: Colors.black),
              // style: TextStyle(
              //     fontSize: 16.sp,
              //     fontWeight: FontWeight.w400,
              //     color: const Color(0xffB7B7B7)),
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
              // padding: EdgeInsets.only(left: 20, right: 10),
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                child: SvgPicture.asset("assets/icons/Arrow---Down-Circle.svg"),
              ),
              // iconSize: 30,
            ),
            // dropdownStyleData: DropdownStyleData(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffE0E0E0)),
            //     borderRadius: BorderRadius.circular(5.w),
            //   ),
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////ADDADDRESS///////////////////////////////////
class AddAddressDropDown extends StatefulWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem>? items;
  final String? titleHeader;
  final value;
  final double? hintSize;
  final double? height;
  final EdgeInsets? iconPadding;
  final double? titleSize;

  const AddAddressDropDown(
      {Key? key,
      this.value,
      required this.textEditingController,
      this.titleSize,
      this.iconPadding,
      this.height,
      this.hint,
      this.hintSize,
      this.onChanged,
      this.items,
      this.titleHeader})
      : super(key: key);

  @override
  _AddAddressDropDownState createState() => _AddAddressDropDownState();
}

class _AddAddressDropDownState extends State<AddAddressDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleHeader != null
            ? Text(
                widget.titleHeader ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: const Color(0xff3A3A3A)),
                // style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     fontSize: widget.titleSize ?? 14.sp,
                //     color: const Color(0xff3A3A3A)),
              )
            : Container(),
        widget.titleHeader != null
            ? SizedBox(
                height: 10.w,
              )
            : Container(),
        Container(
          // height: 45.w,
          child: DropdownButtonFormField2(
            dropdownSearchData: DropdownSearchData(
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
              //     (item, searchValue) {
              //   print(item);
              //   print(searchValue);
              //   return item.value.toString().contains(searchValue);
              // },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                widget.textEditingController?.clear();
              }
            },
            value: widget.value,
            isDense: true,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.w,
                  color: const Color(0xff989898),
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.w),
                borderSide: BorderSide(
                  width: 1.w,
                  color: const Color(0xff989898),
                ),
              ),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(
              widget.hint ?? "",
              style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff111111)),
              // style: TextStyle(
              //     fontSize: 16.sp,
              //     fontWeight: FontWeight.w400,
              //     color: const Color(0xffB7B7B7)),
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              height: widget.height ?? 48.w,
              // padding: EdgeInsets.only(left: 20, right: 10),
            ),
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: widget.iconPadding ?? EdgeInsets.only(right: 22.w),
                child: SvgPicture.asset("assets/icons/Arrow---Down-Circle.svg"),
              ),
              // iconSize: 30,
            ),
            // dropdownStyleData: DropdownStyleData(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffE0E0E0)),
            //     borderRadius: BorderRadius.circular(5.w),
            //   ),
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 210.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
