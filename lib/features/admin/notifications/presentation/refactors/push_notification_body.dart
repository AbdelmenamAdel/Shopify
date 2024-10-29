import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/features/admin/notifications/presentation/widgets/add_notification_item.dart';
import 'package:shopify/features/admin/notifications/presentation/widgets/create/create_notification.dart';

class PushNotificationBody extends StatelessWidget {
  const PushNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0.w,
        vertical: 20.0.h,
      ),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CreateNotification(),
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const AddNotificationItem(
                    // notificationModel: notificaionList[index],
                    // index: index,
                    );
              },
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
            ),
          ),
        ],
      ),
    );
  }
}
