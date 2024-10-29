import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:shopify/features/admin/notifications/presentation/widgets/edit/edit_notification_bottom_sheet.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({
    // required this.notificationModel,
    super.key,
  });

  // final AddNotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomBottomSheet.showModalBottomSheetContainer(
          context: context,
          widget: const EditNotificationBottomSheet(
              // notificationModel: notificationModel,
              ),
          whenComplete: () {
            // context.read<GetAllNotificationAdminBloc>().add(
            //       const GetAllNotificationAdminEvent.getAllNotificion(),
            //     );
          },
        );
      },
      child: const Icon(
        Icons.edit,
        color: Colors.yellow,
      ),
    );
  }
}
