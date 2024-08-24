import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/animations/animate_do.dart';
import 'package:shopify/core/common/toast/show_toast.dart';
import 'package:shopify/core/common/widgets/custom_linear_button.dart';
import 'package:shopify/core/common/widgets/custom_loading_indecator.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/language/lang_keys.dart';
import 'package:shopify/core/routes/app_routes.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/auth/presentation/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (userRole) {
              ShowToast.showToastSuccessTop(
                message: context.translate(
                  LangKeys.loggedSuccessfully,
                ),
              );
              if (userRole == 'admin') {
                context.pushNamedAndRemoveUntil(AppRoutes.homeAdmin);
              } else {
                context.pushNamedAndRemoveUntil(AppRoutes.mainCustomer);
              }
            },
            error: (errMsg) {
              ShowToast.showToastErrorTop(
                message: context.translate(
                  errMsg,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                onPressed: () {},
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: const CustomLoadingIndecator(),
              );
            },
            orElse: () {
              return CustomLinearButton(
                onPressed: () {
                  _validateThenDoLogin(context);
                },
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
                  text: context.translate(LangKeys.login),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
