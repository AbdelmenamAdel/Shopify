import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/loading/empty_screen.dart';
import 'package:shopify/core/common/widgets/custom_loading_indecator.dart';
import 'package:shopify/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:shopify/features/admin/users/presentation/widgets/search_for_users.dart';
import 'package:shopify/features/admin/users/presentation/widgets/table_of_users.dart';

class UserAdminBody extends StatefulWidget {
  const UserAdminBody({super.key});

  @override
  State<UserAdminBody> createState() => _UserAdminBodyState();
}

class _UserAdminBodyState extends State<UserAdminBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          const SearchForUsers(),
          SizedBox(height: 20.h),
          Flexible(
            child: RefreshIndicator(
              onRefresh: () async {
                context
                    .read<GetAllUsersBloc>()
                    .add(const GetAllUsersEvent.getAllUsers(isNotLoaded: true));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return const Center(
                              child: SizedBox(
                                height: 50,
                                child: CustomLoadingIndecator(),
                              ),
                            );
                          },
                          success: (usersList) {
                            return TableOfUsers(
                              usersList: usersList,
                            );
                          },
                          search: (searchUsersList) {
                            return TableOfUsers(
                              usersList: searchUsersList,
                            );
                          },
                          empty: EmptyScreen.new,
                          error: Text.new,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 25.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
