import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/extensions/string_exetension.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/auth/data/models/login/user_role_response.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({required this.userInfo, super.key});

  final UserRoleResponse userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // user profile image
        ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: CachedNetworkImage(
            height: 95.h,
            width: 95.w,
            fit: BoxFit.fill,
            imageUrl: userInfo.userImage!,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 70,
            ),
          ),
        ),
        SizedBox(height: 7.h),
        TextApp(
          text: userInfo.userName!.toLowerCase().toCapitalized(),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(height: 7.h),
        TextApp(
          text: userInfo.userEmail!,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}
