import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/features/customer/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:shopify/features/customer/profile/presentation/refactors/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()
        ..add(
          const ProfileEvent.getUserData(),
        ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const ProfileViewBody(),
      ),
    );
  }
}
