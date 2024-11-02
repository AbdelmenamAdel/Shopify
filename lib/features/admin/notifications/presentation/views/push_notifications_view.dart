import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/admin_app_bar.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/features/admin/notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:shopify/features/admin/notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:shopify/features/admin/notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:shopify/features/admin/notifications/presentation/refactors/push_notification_body.dart';

class PushNotificationsView extends StatelessWidget {
  const PushNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllNotificationAdminBloc>()
            ..add(
              const GetAllNotificationAdminEvent.getAllNotificion(),
            ),
        ),
        BlocProvider(create: (context) => sl<AddNotificationBloc>()),
        BlocProvider(create: (context) => sl<SendNotificationBloc>()),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Notifications',
        ),
        body: PushNotificationBody(),
      ),
    );
  }
}
