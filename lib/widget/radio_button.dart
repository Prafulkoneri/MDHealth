import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String? leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const PrimaryRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        child: Row(
          children: [
            _customRadioButton,
            // if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
        height: 16.w,
        width: 16.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1.w,
          ),
        ),
        child: Center(
          child: isSelected
              ? Container(
                  height: 9.14.w,
                  width: 9.14.w,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                )
              : Container(),
        ));
  }
}

class SecondaryRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String? leading;
  final Widget? title;
  final Color? outerColor;
  final Color? innerColor;
  final Color? backgroundColor;
  final ValueChanged<T?> onChanged;

  const SecondaryRadioButton({
    super.key,
    required this.value,
    this.backgroundColor,
    this.innerColor,
    this.outerColor,
    required this.groupValue,
    required this.onChanged,
    this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        child: Row(
          children: [
            _customRadioButton,
            // if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
        height: 16.w,
        width: 16.w,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: outerColor ?? const Color(0xff03C9CC),
            width: 1.w,
          ),
        ),
        child: Center(
          child: isSelected
              ? Container(
                  height: 9.14.w,
                  width: 9.14.w,
                  decoration: BoxDecoration(
                      color: innerColor ?? const Color(0xff03C9CC),
                      shape: BoxShape.circle),
                )
              : Container(),
        ));
  }
}

class FilterRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String? leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const FilterRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        child: Row(
          children: [
            _customRadioButton,
            // if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
        height: 16.w,
        width: 16.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                isSelected ? const Color(0xff03C9CC) : const Color(0xffB7B7B7),
            width: 1.w,
          ),
        ),
        child: Center(
          child: isSelected
              ? Container(
                  height: 9.14.w,
                  width: 9.14.w,
                  decoration: const BoxDecoration(
                      color: Color(0xff03C9CC), shape: BoxShape.circle),
                )
              : Container(),
        ));
  }
}

class OrderSummaryRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String? leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const OrderSummaryRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        child: Row(
          children: [
            _customRadioButton,
            // if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
        height: 16.w,
        width: 16.w,
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? const Color(0xff006F94)
                : const Color(0xff000000).withOpacity(0.5),
            width: 1.w,
          ),
        ),
        child: Center(
          child: isSelected
              ? Container(
                  height: 9.14.w,
                  width: 9.14.w,
                  decoration: const BoxDecoration(
                      color: Color(0xff006F94), shape: BoxShape.circle),
                )
              : Container(),
        ));
  }
}
