import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';

class SearchNamePriceButton extends StatelessWidget {
  const SearchNamePriceButton({
    required this.isSelected,
    required this.onTap,
    required this.title,
    super.key,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 150.w,
        decoration: BoxDecoration(
          color:
              isSelected ? context.color.bluePinkDark : context.color.navBarbg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontWeight: FontWeightHelper.bold,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
