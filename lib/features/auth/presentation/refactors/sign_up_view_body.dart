import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/animations/animate_do.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/language/lang_keys.dart';
import 'package:shopify/core/routes/app_routes.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:shopify/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:shopify/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:shopify/features/auth/presentation/widgets/sign_up/sign_up_text_form.dart';
import 'package:shopify/features/auth/presentation/widgets/sign_up/user_avatar_image.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DarkAndLangButtons(),
              SizedBox(
                height: 40.h,
              ),
              AuthTitleInfo(
                title: context.translate(LangKeys.signUp),
                description: context.translate(LangKeys.welcome),
              ),
              SizedBox(
                height: 10.h,
              ),
              // user avatar
              const UserAvatarImage(),
              SizedBox(
                height: 20.h,
              ),
              const SignUpTextForm(),
              SizedBox(
                height: 20.h,
              ),
              const SignUpButton(),
              SizedBox(
                height: 20.h,
              ),
              CustomFadeInDown(
                duration: 400,
                child: TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(AppRoutes.login);
                  },
                  child: TextApp(
                    text: context.translate(LangKeys.youHaveAccount),
                    theme: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: context.color.bluePinkLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
