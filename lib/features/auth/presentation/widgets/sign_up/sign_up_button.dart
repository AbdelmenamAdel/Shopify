import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/app/upload_image/cubit/upload_image_cubit.dart';
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.loggedSuccessfully),
              );
              context.pushNamedAndRemoveUntil(AppRoutes.mainCustomer);
            },
            error: (errMsg) {
              if (context.translate(errMsg) == 'null') {
                ShowToast.showToastSuccessTop(
                  message: context.translate(LangKeys.loggedSuccessfully),
                );
                context.pushNamedAndRemoveUntil(AppRoutes.login);
              } else {
                ShowToast.showToastErrorTop(message: context.translate(errMsg));
              }
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
                  _validateThenDoSignUp(context);
                },
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
                  text: context.translate(LangKeys.signUp),
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

  void _validateThenDoSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final imageCubit = context.read<UploadImageCubit>();
    if (imageCubit.getImageUrl.isEmpty) {
      ShowToast.showToastErrorTop(
        message: context.translate(LangKeys.validPickImage),
      );
    } else {
      if (authBloc.formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(
              AuthEvent.signUp(
                imageUrl: imageCubit.getImageUrl,
              ),
            );
      }
    }
  }
}
