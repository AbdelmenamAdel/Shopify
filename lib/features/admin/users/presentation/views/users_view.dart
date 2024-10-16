import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/admin_app_bar.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:shopify/features/admin/users/presentation/refactors/user_admin_body.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetAllUsersBloc>()
        ..add(const GetAllUsersEvent.getAllUsers(isNotLoaded: true)),
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Users',
        ),
        body: UserAdminBody(),
      ),
    );
  }
}
