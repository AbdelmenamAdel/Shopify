import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/custom_container_linear_admin.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/core/styles/fonts/font_family_helper.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/admin/notifications/presentation/widgets/edit/edit_notification.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({
    // required this.notificationModel,
    // required this.index,
    super.key,
  });

  // final AddNotificationModel notificationModel;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            const Spacer(),
            //Title
            const NotificationInfo(
              title: 'Tilte: ',
              body: 'notificationModel.title',
            ),
            const Spacer(),
            //Body
            const NotificationInfo(
              title: 'Body: ',
              body: 'notificationModel.body',
            ),
            const Spacer(),
            const NotificationInfo(
              title: 'Create At: ',
              body: '11/11/2022',
              // body: notificationModel.createAt.getFormatDayMonthYear(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //delete notification
                // DeleteNotificationWidget(
                //   notificationModel: notificationModel,
                // ),
                const Icon(Icons.delete, color: Colors.red),
                SizedBox(width: 40.w),
                //Edit notification
                const EditNotification(
                    // notificationModel: notificationModel,
                    ),
                SizedBox(width: 40.w),
                //send notification
                // SendNotificationWidget(
                //   notificationModel: notificationModel,
                //   index: index,
                // ),
                const Icon(Icons.send, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({
    required this.title,
    required this.body,
    super.key,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            color: Colors.white,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        SizedBox(height: 8.w),
        Flexible(
          child: TextApp(
            text: body,
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              color: ColorsDark.blueLight,
              fontFamily: FontFamilyHelper.poppinsEnglish,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ),
      ],
    );
  }
}
