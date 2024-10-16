import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/custom_text_field.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';

class SearchForUsers extends StatelessWidget {
  const SearchForUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
      builder: (context, state) {
        final bloc = context.read<GetAllUsersBloc>();
        return CustomTextField(
          controller: bloc.searchController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Search for users',
          onChanged: (value) {
            bloc.add(GetAllUsersEvent.searchForUser(value));
            return null;
          },
          suffixIcon: IconButton(
            onPressed: () {
              bloc.searchController.clear();
              bloc.add(const GetAllUsersEvent.getAllUsers(isNotLoaded: true));
            },
            icon: bloc.searchController.text.isEmpty
                ? const Icon(Icons.search, color: ColorsDark.blueLight)
                : const Icon(
                    Icons.clear,
                    color: ColorsDark.blueLight,
                  ),
          ),
        );
      },
    );
  }
}
