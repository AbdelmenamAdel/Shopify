import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/language/lang_keys.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/core/styles/images/app_images.dart';
import 'package:shopify/core/utils/app_info.dart';

class BuildVersion extends StatelessWidget {
  const BuildVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildVersion,
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.buildVersion),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        //Build Version
        FutureBuilder<String>(
          future: AppInfo.getAppVersion(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TextApp(
                text: snapshot.data.toString(),
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
