import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String value;
  final Widget? trailing;
  final ValueChanged<String?> onChanged;
  final bool? initiallyExpanded;
  final ValueChanged<bool?>? onExpansionChanged;
  final String? title;
  final String? titleSvg;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.trailing,
    required this.value,
    this.title,
    required this.onChanged,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
    this.titleSvg,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with SingleTickerProviderStateMixin {
  OverlayEntry? entry;
  final layerLink = LayerLink();
  final Duration _kExpand = const Duration(milliseconds: 200);
  late AnimationController _controller;
  late CurvedAnimation _easeInAnimation;
  late ColorTween _borderColor;
  late ColorTween _headerColor;
  late ColorTween _iconColor;
  late ColorTween _backgroundColor;
  late Animation<double> _iconTurns;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _easeInAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _borderColor = ColorTween();
    _headerColor = ColorTween();
    _iconColor = ColorTween();
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(_easeInAnimation);
    _backgroundColor = ColorTween();

    _isExpanded =
        PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    _setExpanded(true);
  }

  void collapse() {
    _setExpanded(false);
  }

  void toggle() {
    _setExpanded(!_isExpanded);
  }

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded) {
          _controller.forward();
          WidgetsBinding.instance!.addPostFrameCallback((_) => _startOverlay());
        } else {
          _controller.reverse().then((value) => setState(() {}));
          _stopOverlay();
        }
        PageStorage.of(context)?.writeState(context, _isExpanded);
      });
      if (widget.onExpansionChanged != null) {
        widget.onExpansionChanged!(_isExpanded);
      }
    }
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Scrollbar(
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: child,
      ),
    );
  }

  _stopOverlay() {
    // entry = null;
    entry?.remove();
    _setExpanded(false);
  }

  _startOverlay() {
    final ThemeData theme = Theme.of(context);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = theme.textTheme.bodyLarge?.backgroundColor
      ..end = theme.colorScheme.secondary;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = theme.colorScheme.secondary;
    _backgroundColor.end = Colors.white;
    final bool closed = !_isExpanded && _controller.isDismissed;

    final overlayState = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => SizedBox(
        width: size.width,
        child: Stack(children: [
          ModalBarrier(onDismiss: _stopOverlay),
          Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              child: ListItem(
                animation: _controller.view,
                builder: _buildChildren,
                numberOfItems: widget.items.length,
                items: widget.items,
                action: (item) {
                  _setExpanded(!_isExpanded);
                  widget.onChanged(item);
                  _stopOverlay();
                },
                closed: closed,
              ),
            ),
          ),
        ]),
      ),
    );
    overlayState?.insert(entry!);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = theme.textTheme.bodyLarge?.backgroundColor
      ..end = theme.colorScheme.secondary;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = theme.colorScheme.secondary;
    _backgroundColor.end = Colors.white;

    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: Colors.black, width: 1.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconTheme.merge(
              data: IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
              child: ListTile(
                visualDensity: VisualDensity.compact,
                onTap: toggle,
                leading: Container(
                  height: 100,
                  width: 200,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: widget.title != null
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.title != null
                          ? Container(
                              padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                              child: Text(
                                widget.title ?? '',
                                style: TextStyle(
                                  color: Color(0xff8B8B8B),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Campton',
                                  fontSize: 13.sp,
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        // width: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Row(
                          children: [
                            widget.titleSvg != null
                                ? SvgPicture.asset(
                                    'assets/icons/Calendar.svg',
                                    height: 15.h,
                                    width: 15.w,
                                  )
                                : Container(),
                            widget.titleSvg != null
                                ? SizedBox(
                                    width: 2.w,
                                  )
                                : Container(),
                            Flexible(
                              child: Text(
                                widget.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Campton',
                                        fontSize: 16.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: widget.trailing ??
                    RotationTransition(
                      turns: _iconTurns,
                      child: const Icon(Icons.expand_more),
                    ),
              ),
            ),
            ClipRect(
              child: Align(
                heightFactor: _easeInAnimation.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int numberOfItems;
  final List<String> items;
  final ValueChanged<String?> action;
  final Listenable animation;
  final Widget Function(BuildContext, Widget?) builder;
  final bool closed;

  const ListItem(
      {Key? key,
      required this.numberOfItems,
      required this.items,
      required this.action,
      required this.closed,
      required this.animation,
      required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(items.toString());
    return AnimatedBuilder(
      animation: animation,
      builder: builder,
      child: closed
          ? null
          : Container(
              constraints: const BoxConstraints(maxHeight: 150),
              child: ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: numberOfItems,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        debugPrint('hi from Gesture Detector');
                        action(item);
                      },
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
