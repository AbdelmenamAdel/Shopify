import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';

class SearchFormDataIcon extends StatelessWidget {
  const SearchFormDataIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.search_sharp,
          color: context.color.textColor,
          size: 150,
        ),
        SizedBox(height: 10.h),
        TextApp(
          text: 'Search For Data',
          theme: context.textStyle.copyWith(
            fontWeight: FontWeightHelper.bold,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
