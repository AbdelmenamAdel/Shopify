import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/fonts/font_family_helper.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';

class TableCellTitleWidget extends StatelessWidget {
  const TableCellTitleWidget({
    required this.title,
    required this.icon,
    super.key,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0.h,
        horizontal: 8.0.w,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontFamily: FontFamilyHelper.poppinsEnglish,
              fontSize: 10.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ],
      ),
    );
  }
}
