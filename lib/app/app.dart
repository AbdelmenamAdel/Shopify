import 'package:flutter/material.dart';
import 'package:shopify/core/app/connectivity_controller.dart';
import 'package:shopify/core/common/screens/no_network_view.dart';
import 'package:shopify/core/common/screens/shopify.dart';

class ConnectivityCheck extends StatelessWidget {
  const ConnectivityCheck({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectivityController.instance.init();
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
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
