import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/customer_app_bar.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/extensions/string_exetension.dart';
import 'package:shopify/features/customer/product_details/presentation/manager/product_details/product_details_bloc.dart';
import 'package:shopify/features/customer/product_details/presentation/refactors/add_to_cart_button.dart';
import 'package:shopify/features/customer/product_details/presentation/refactors/product_deatils_custom_painter.dart';
import 'package:shopify/features/customer/product_details/presentation/refactors/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({required this.productId, super.key});
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsBloc>()
        ..add(
          ProductDetailsEvent.productDetails(productId: productId),
        ),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: context.color.textColor,
                  ),
                ),
              );
            },
            success: (productModel) {
              return Scaffold(
                appBar: CustomAppBar(
                  title: productModel.title!.convertLongString(),
                ),
                bottomNavigationBar:
                    AddToCartButton(price: productModel.price ?? 0.0),
                body: Stack(
                  children: [
                    CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height,
                      ),
                      painter: DetailsCustomPainter(
                        gradient: LinearGradient(
                          colors: [
                            context.color.bluePinkLight!,
                            context.color.bluePinkDark!,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    ProductDetailsViewBody(
                      productModel: productModel,
                    ),
                  ],
                ),
              );
            },
            error: (error) {
              return Scaffold(
                body: Center(
                  child: Text(error),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
