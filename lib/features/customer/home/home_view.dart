import 'package:flutter/material.dart';
import 'package:shopify/core/common/dialogs/custom_dialogs.dart';
import 'package:shopify/core/utils/app_logout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Do you want log out?',
            textButton1: 'Yes',
            textButton2: 'No',
            isLoading: false,
            onPressed: () async {
              await AppLogout().logout();
            },
          );
        },
        child: const Text(
          'Home View',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
