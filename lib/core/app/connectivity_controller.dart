import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ValueNotifier<bool> isConnected = ValueNotifier(false);
  Future<void> init() async {
    List<ConnectivityResult> result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      isInternetConnected(result);
    });
  }

  bool isInternetConnected(List<ConnectivityResult> result) {
    if (result[0] == ConnectivityResult.none) {
      isConnected.value = false;
      return false;
    } else if (result[0] == ConnectivityResult.mobile ||
        result[0] == ConnectivityResult.wifi) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}
