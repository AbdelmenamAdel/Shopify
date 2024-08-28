import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/admin_app_bar.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/features/admin/products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:shopify/features/admin/products/presentation/refactors/add_products_body.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetAllAdminProductsBloc>()
        ..add(
          const GetAllAdminProductsEvent.getAllProducts(
            isNotLoading: true,
          ),
        ),
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Products',
        ),
        body: AddProductBody(),
      ),
    );
  }
}
