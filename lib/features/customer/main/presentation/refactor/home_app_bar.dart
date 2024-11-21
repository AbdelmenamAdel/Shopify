import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify/core/common/animations/animate_do.dart';
import 'package:shopify/core/common/widgets/custom_linear_button.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/enums/nav_bar_enum.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/language/lang_keys.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/core/styles/images/app_images.dart';
import 'package:shopify/features/customer/main/presentation/manager/cubit/main_cubit.dart';

class CustomerMainAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomerMainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: context.color.mainColor,
      title: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (cubit.navBarEnum == NavBarEnum.home) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInRight(
                  duration: 800,
                  child: TextApp(
                    text: context.translate(LangKeys.chooseProducts),
                    theme: context.textStyle.copyWith(
                      color: context.color.textColor,
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                CustomFadeInLeft(
                  duration: 800,
                  child: CustomLinearButton(
                    onPressed: () {},
                    child: Center(child: SvgPicture.asset(AppImages.search)),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
