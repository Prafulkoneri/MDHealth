// import 'package:flutter/material.dart';

// class Loader extends StatefulWidget {
//   const Loader({Key? key}) : super(key: key);

//   @override
//   _LoaderState createState() => _LoaderState();
// }

// class _LoaderState extends State<Loader> {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();
// class _LoaderState extends State<Loader> with SingleTickerProviderStateMixi {
//    late final AnimationController _controller =
//       AnimationController(vsync: this, duration: const Duration(seconds: 2))
//         ..repeat();

  @override
  void initState() {
    super.initState();

    // Add a delay to navigate to the next page after two seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Replace 'NextPage()' with the actual page you want to navigate to
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Add your image widget here
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/katman_1.png',
              height: 89.h,
              width: 110.42.w,
              fit: BoxFit.fitWidth,
            ),
          ),

          // SizedBox(
          //     height:
          //         16), // Add some spacing between the image and CircularProgressIndicator
          // CircularProgressIndicator(),
        ],
      ),
    );
  }
}
