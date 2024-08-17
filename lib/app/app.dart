import 'package:flutter/material.dart';
import 'package:shopify/core/common/screens/no_network_view.dart';
import 'package:shopify/core/common/screens/shopify.dart';
import '../core/app/connectivity_controller.dart';

class ConnectivityCheck extends StatelessWidget {
  const ConnectivityCheck({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectivityController connectivityController = ConnectivityController();
    connectivityController.init();
    return ValueListenableBuilder(
      valueListenable: connectivityController.isConnected,
      builder: (context, value, child) {
        if (value) {
          return const Shopify();
        } else {
          return const NoNetworkView();
        }
      },
    );
  }
}
