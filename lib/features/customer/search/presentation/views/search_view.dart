import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/customer_app_bar.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/features/customer/search/presentation/managers/search_bloc/search_bloc.dart';
import 'package:shopify/features/customer/search/presentation/refactors/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Search'),
        body: SearchViewBody(),
      ),
    );
  }
}
