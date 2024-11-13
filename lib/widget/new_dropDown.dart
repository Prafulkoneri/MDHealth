import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TestDropdown extends StatefulWidget {
  final List<String> items;
  final String value;
  final Widget? trailing;
  final ValueChanged<String?> onChanged;
  final bool? initiallyExpanded;
  final ValueChanged<bool?>? onExpansionChanged;
  final Color? borderColor;

  const TestDropdown({
    Key? key,
    required this.items,
    this.trailing,
    required this.value,
    required this.onChanged,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
    this.borderColor,
  }) : super(key: key);

  @override
  _TestDropdownState createState() => _TestDropdownState();
}

class _TestDropdownState extends State<TestDropdown>
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
          WidgetsBinding.instance!
              .addPostFrameCallback((Duration) => _startOverlay());
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12, // Set background color to black
          // border: Border.all(
          //   color: Colors.grey, // Set border color to grey
          //   width: 1.0, // Set border width to 1
          // ),
          // borderRadius:
          //     BorderRadius.circular(12.0), // Same border radius as your card
        ),
        child: Card(
          color: Color(0xFF5B5B5B),
          margin: EdgeInsets.zero,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: child,
        ),
      ),
    );
  }

  _stopOverlay() {
    print('Stop Overlay');
    if (entry != null) {
      entry!.remove();
    }
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
          ModalBarrier(
            onDismiss: () {
              _stopOverlay();
              _setExpanded(!_isExpanded);
            },
          ),
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
    if (entry != null) {
      overlayState?.insert(entry!);
    }
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
        height: 44.w,
        width: double.infinity.w,
        decoration: BoxDecoration(
          // color: Colors.black12, // Set background color to black
          border: Border.all(
            color: widget.borderColor ?? Color(0xFF5B5B5B),
            width: 1.0, // Set border width to 1
          ),
          borderRadius:
              BorderRadius.circular(12.0), // Same border radius as your card
        ),
        child: Card(
          color: Colors.black12,
          margin: EdgeInsets.zero,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(12.0),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconTheme.merge(
                data:
                    IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
                child: GestureDetector(
                  onTap: toggle,
                  child: Container(
                    // color: Colors.green,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.w, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity.w,
                            height: 40,
                            // color: Colors.black12,
                            child: Padding(
                              padding: EdgeInsets.only(top: 7.w),
                              child: Text(widget.value,
                                  // textAlign: TextAlign.center,
                                  style: GoogleFonts.lexend(
                                    textStyle: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w300),
                                  )),
                            ),
                          ),
                        ),
                        widget.trailing ??
                            RotationTransition(
                              turns: _iconTurns,
                              child: const Icon(
                                Icons.expand_more,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                      ],
                    ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 53),
      child: AnimatedBuilder(
        animation: animation,
        builder: builder,
        child: closed
            ? null
            : Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 98, 98),
                  border: Border.all(color: Color(0xffE0E0E0)),
                  borderRadius: BorderRadius.circular(12.w),
                ),
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
                        child: Text(item,
                            style: GoogleFonts.lexend(
                              textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
