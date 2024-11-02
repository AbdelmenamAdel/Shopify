import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/loading/empty_screen.dart';
import 'package:shopify/core/common/widgets/custom_loading_indecator.dart';
import 'package:shopify/features/admin/notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
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
            child: BlocBuilder<GetAllNotificationAdminBloc,
                GetAllNotificationAdminState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return Center(
                      child: SizedBox(
                        height: 50.h,
                        child: const CustomLoadingIndecator(),
                      ),
                    );
                  },
                  success: (notificaionList) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      itemCount: notificaionList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return AddNotificationItem(
                          notificationModel: notificaionList[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                    );
                  },
                  empty: EmptyScreen.new,
                  error: Text.new,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
