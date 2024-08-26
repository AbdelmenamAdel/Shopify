import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'products_count_event.dart';
part 'products_count_state.dart';
part 'products_count_bloc.freezed.dart';

class ProductsCountBloc extends Bloc<ProductsCountEvent, ProductsCountState> {
  ProductsCountBloc(this._repo) : super(const ProductsCountState.loading()) {
    on<GetProductsCountEvent>(_getProductsCount);
  }
  final DashBoardRepo _repo;
  // ! get products count
  FutureOr<void> _getProductsCount(
    GetProductsCountEvent event,
    Emitter<ProductsCountState> emit,
  ) async {
    emit(const ProductsCountState.loading());
    final result = await _repo.numberOfProducts();
    result.when(
      success: (productsData) =>
          emit(ProductsCountState.success(count: productsData.productsCount)),
      failure: (error) => emit(ProductsCountState.failure(error: error)),
    );
  }
}
