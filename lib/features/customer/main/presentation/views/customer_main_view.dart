import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/language/lang_keys.dart';
import 'package:shopify/core/services/push_notification/firebase_cloud_messaging.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/customer/main/presentation/manager/cubit/main_cubit.dart';
import 'package:shopify/features/customer/main/presentation/refactor/customer_main_view_body.dart';
import 'package:shopify/features/customer/main/presentation/refactor/main_app_bar.dart';

class CustomerMainView extends StatelessWidget {
  const CustomerMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainCubit>(),
      child: const Scaffold(
        appBar: CustomerMainAppBar(),
        body: CustomerMainViewBody(),
      ),
    );
  }
}

class NotificationsSettings extends StatelessWidget {
  const NotificationsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications_active_outlined,
          color: context.textStyle.color,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.notifications),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        ValueListenableBuilder(
          valueListenable: FirebaseCloudMessaging().isSubscribe,
          builder: (_, value, __) {
            return Transform.scale(
              scale: 1,
              child: Switch.adaptive(
                inactiveTrackColor: const Color(0XFF262626),
                activeColor: Colors.green,
                value: value,
                onChanged: (value) {
                  FirebaseCloudMessaging()
                      .controllerForUserSubscription(context);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
