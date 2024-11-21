import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/features/customer/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:shopify/features/customer/profile/presentation/widgets/user_profile_info.dart';
import 'package:shopify/features/customer/profile/presentation/widgets/user_profile_shimmer.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.when(
                  loading: UserProfileShimmer.new,
                  success: (userInfo) => UserProfileInfo(
                    userInfo: userInfo,
                  ),
                  error: Text.new,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
