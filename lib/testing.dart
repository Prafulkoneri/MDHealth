// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//   return WillPopScope(
//     onWillPop: () async {
//       final shouldLeave = await showDialog<bool>(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Are you sure?'),
//           content: Text('Do you want to exit the app?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(true),
//               child: Text('Yes'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(false),
//               child: Text('No'),
//             ),
//           ],
//         ),
//       );
//       return shouldLeave ?? false;
//     },
//     child: Scaffold(
//       appBar: AppBar(title: Text('WillPopScope Example')),
//       body: Center(child: Text('Press back to see dialog')),
//     ),
//   );
// }
// }
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldLeave = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
            ],
          ),
        );
        return shouldLeave ?? false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('WillPopScope Example')),
        body: Center(child: Text('Press back to see dialog')),
      ),
    );
  }
}
