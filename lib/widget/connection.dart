// import 'package:connectivity/connectivity.dart';
// // import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class NoInternetScreen with ChangeNotifier {
//   bool? _isOnline;
//   bool? get isOnline => _isOnline;
//   NoInternetScreen() {
//     Connectivity _connectivity = Connectivity();
//     _connectivity.onConnectivityChanged.listen((result) {
//       if (result == ConnectivityResult.none) {
//         _isOnline = false;
//         notifyListeners();
//       } else {
//         _isOnline = true;
//         notifyListeners();
//       }
//     });
//   }
// }


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService with ChangeNotifier {
  bool _isOnline = true;
  bool get isOnline => _isOnline;

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectionStatus(result);
    });
    _initialize();
  }

  void _initialize() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      _isOnline = false;
    } else {
      _isOnline = true;
    }
    notifyListeners();
  }
}
