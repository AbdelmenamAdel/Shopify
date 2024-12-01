import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/custom_linear_button.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
// import 'package:heroicons_flutter/heroicons_flutter.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isSeen,
    required this.onTapSelected,
    required this.onTapRemoved,
    super.key,
  });

  final String title;
  final String body;
  final String createdAt;
  final bool isSeen;
  final VoidCallback onTapSelected;
  final VoidCallback onTapRemoved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapSelected,
      child: Stack(
        children: [
          // Background Card
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.color.bluePinkDark!,
                  context.color.bluePinkLight!,
                  ColorsDark.black1,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: context.color.textColor!.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Row
                Row(
                  children: [
                    // Icon Container
                    Container(
                      width: 50.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [ColorsDark.blueDark, ColorsDark.blueLight],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.color.textColor!.withOpacity(0.8),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorsDark.white.withOpacity(.8),
                          ),
                        ),
                        child: const Icon(
                          Icons.local_fire_department_rounded,
                          color: ColorsDark.white,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsDark.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapRemoved,
                      child: Icon(
                        Icons.close,
                        color: context.color.textColor!.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Subtitle
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: ColorsDark.white.withOpacity(0.9),
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                // Date and Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isSeen
                              ? Icons.check_circle
                              : Icons.check_circle_outline_rounded,
                          color: isSeen
                              ? context.color.textColor
                              : context.color.textColor!.withOpacity(0.8),
                          size: 18.sp,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          createdAt,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: context.color.textColor!.withOpacity(0.75),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: context.color.bluePinkLight!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: context.color.textColor!.withOpacity(.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                context.color.bluePinkLight!.withOpacity(0.8),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: CustomLinearButton(
                        height: 40,
                        width: 125,
                        onPressed: onTapSelected,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: context.color.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Floating Badge
          if (!isSeen)
            Positioned(
              top: 0,
              left: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: context.color.bluePinkLight!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: context.color.textColor!.withOpacity(.3),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.color.bluePinkLight!.withOpacity(0.8),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  'NEW HOT DEAL 🔥❤️‍🔥',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: context.color.textColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
