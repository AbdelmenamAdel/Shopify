import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();
  final Connectivity _connectivity = Connectivity();
  static final ConnectivityController instance = ConnectivityController._();
  ValueNotifier<bool> isConnected = ValueNotifier(true);
  Future<void> initialize() async {
    var result = await _connectivity.checkConnectivity();
    isInternerConnected(result);
    _connectivity.onConnectivityChanged.listen((isInternetConnected) {
      result = isInternetConnected;
      isInternerConnected(result);
    });
  }

  bool isInternerConnected(List<ConnectivityResult> result) {
    for (final res in result) {
      if (res == ConnectivityResult.mobile ||
          res == ConnectivityResult.wifi ||
          res == ConnectivityResult.ethernet) {
        isConnected.value = true;
        return true;
      } else {
        isConnected.value = false;
        return false;
      }
    }
    isConnected.value = false;
    return false;
  }
}
