import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';

void showAchievementView({
  required BuildContext context,
  String? title,
  String? subTitle,
  Color? color,
  void Function()? onTap,
  Alignment? alignment,
}) {
  AchievementView(
    title: title,
    onTap: onTap,
    alignment: alignment ?? Alignment.topCenter,
    subTitle: subTitle,
    color: color ?? ColorsDark.black1,
  ).show(context);
}
