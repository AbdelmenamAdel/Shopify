import 'package:equatable/equatable.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';

abstract class ProductsViewAllState extends Equatable {
  const ProductsViewAllState({
    required this.hasMoreData,
    required this.productsList,
  });

  final List<GetAllProductsModel> productsList;
  final bool hasMoreData;
  @override
  List<Object?> get props => [productsList, hasMoreData];
}

class ProductsViewAllInitialState extends ProductsViewAllState {
  const ProductsViewAllInitialState({
    required super.hasMoreData,
    required super.productsList,
  });
}

class ProductsViewAllLoadingState extends ProductsViewAllState {
  const ProductsViewAllLoadingState({
    required super.hasMoreData,
    required super.productsList,
  });
}

class ProductsViewAllSuccessState extends ProductsViewAllState {
  const ProductsViewAllSuccessState({
    required super.hasMoreData,
    required super.productsList,
  });
}

class ProductsViewAllErrorState extends ProductsViewAllState {
  const ProductsViewAllErrorState({
    required this.errorMessage,
    required super.hasMoreData,
    required super.productsList,
  });

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
