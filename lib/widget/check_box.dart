import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:provider/provider.dart';

class PrimaryCheckBox<T> extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;
  final String? textValue;
  final T? groupValue;
  final Color? color;
  final bool? value;
  final double? size;
  final Color? borderColor;
  final TextStyle? textStyle;
  const PrimaryCheckBox(
      {Key? key,
      this.color,
      this.groupValue,
      this.textStyle,
      this.size,
      this.borderColor,
      this.onChanged,
      this.textValue,
      this.value})
      : super(key: key);

  @override
  _PrimaryCheckBoxState createState() => _PrimaryCheckBoxState();
}

class _PrimaryCheckBoxState extends State<PrimaryCheckBox> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .read<PrimaryCheckBoxController>()
          .initState(widget.value ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PrimaryCheckBoxController>();
    final watch = context.watch<PrimaryCheckBoxController>();
    return Row(
      children: [
        InkWell(
          onTap: () async {
            await read.onCheckBoxSelected();
            widget.onChanged!(watch.isSelected);
          },
          child: Container(
            height: widget.size ?? 20.w,
            width: widget.size ?? 20.w,
            decoration: BoxDecoration(
              color:
                  // widget.value ?? false
                  //     ? const Color(0xff39C19D)
                  //     :
                  Color(0xffE3E3E3),
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(
              //     color: widget.value ?? false
              //         ? Colors.transparent
              //         : const Color(0xffB9B9B9))
            ),

            // 'assets/icons/BuyPackage Button.svg',
            child: Center(
              child: widget.value ?? false
                  ? Container(
                      // width: 15.w,
                      // color: Color(0xffE3E3E3),
                      child: SvgPicture.asset(
                        "assets/icons/BuyPackage Button_new.svg",
                        // color: Colors.white,
                        // width: 30.w,
                      ),
                    )
                  : Container(),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          widget.textValue ?? "",
          style: widget.textStyle ??
              TextStyle(
                  color: const Color(0xff3A3A3A),
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp),
        ),
      ],
    );
  }
}

class PrimaryCheckBoxController extends ChangeNotifier {
  bool isSelected = false;

  void initState(value) {
    isSelected = value;
    notifyListeners();
  }

  Future<void> onCheckBoxSelected() async {
    isSelected = !isSelected;
    notifyListeners();
  }
}

////////////////Secondary CheckBox
class SeconderyCheckBox extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;
  final String? textValue;
  final Color? color;
  final bool? value;
  final double? size;
  final Color? borderColor;
  final TextStyle? textStyle;
  const SeconderyCheckBox(
      {Key? key,
      this.color,
      this.textStyle,
      this.size,
      this.borderColor,
      this.onChanged,
      this.textValue,
      this.value})
      : super(key: key);

  @override
  _SeconderyCheckBoxState createState() => _SeconderyCheckBoxState();
}

class _SeconderyCheckBoxState extends State<SeconderyCheckBox> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .read<PrimaryCheckBoxController>()
          .initState(widget.value ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PrimaryCheckBoxController>();
    final watch = context.watch<PrimaryCheckBoxController>();
    return Row(
      children: [
        InkWell(
          onTap: () async {
            await read.onCheckBoxSelected();
            widget.onChanged!(watch.isSelected);
          },
          child: Container(
            height: widget.size ?? 25.w,
            width: widget.size ?? 25.w,
            decoration: BoxDecoration(
                color: widget.value ?? false
                    ? Colors.transparent
                    : Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: widget.value ?? false
                        ? kDefaultActiveColor
                        : kDefaultActiveColor)),
            child: Center(
              child: widget.value ?? false
                  ? SvgPicture.asset(
                      "assets/icons/check_box.svg",
                    )
                  : Container(),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          widget.textValue ?? "",
          style: widget.textStyle ??
              TextStyle(
                  color: const Color(0xff3A3A3A),
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp),
        ),
      ],
    );
  }
}

/////////////////////////////Grey Check Box//////////////////////
class NewGearCheckBOx extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;
  final String? textValue;
  final Color? color;
  final bool? value;
  final double? size;
  final Color? borderColor;
  final TextStyle? textStyle;
  const NewGearCheckBOx(
      {Key? key,
      this.color,
      this.textStyle,
      this.size,
      this.borderColor,
      this.onChanged,
      this.textValue,
      this.value})
      : super(key: key);

  @override
  _NewGearCheckBOxState createState() => _NewGearCheckBOxState();
}

class _NewGearCheckBOxState extends State<NewGearCheckBOx> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .read<PrimaryCheckBoxController>()
          .initState(widget.value ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PrimaryCheckBoxController>();
    final watch = context.watch<PrimaryCheckBoxController>();
    return Row(
      children: [
        InkWell(
          onTap: () async {
            await read.onCheckBoxSelected();
            widget.onChanged!(watch.isSelected);
          },
          child: Container(
            height: widget.size ?? 25.w,
            width: widget.size ?? 25.w,
            decoration: BoxDecoration(
                color: widget.value ?? false
                    ? const Color(0xff4689EC)
                    : Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: widget.value ?? false
                        ? Colors.transparent
                        : const Color(0xffB9B9B9))),
            child: Center(
              child: widget.value ?? false
                  ? SvgPicture.asset(
                      "assets/icons/check_box.svg",
                    )
                  : Container(),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          widget.textValue ?? "",
          style: widget.textStyle ??
              TextStyle(
                  color: const Color(0xff3A3A3A),
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp),
        ),
      ],
    );
  }
}
