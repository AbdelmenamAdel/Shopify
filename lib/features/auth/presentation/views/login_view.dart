import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/features/auth/presentation/refactors/auth_custom_painter.dart';
import 'package:shopify/features/auth/presentation/refactors/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LoginViewBody(),
      bottomNavigationBar: CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 150.h),
        painter: AuthCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkDark!,
            ],
          ),
        ),
      ),
    );
  }
}
