import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/customer/product_details/data/repo/product_details_repo.dart';
import 'package:shopify/features/customer/product_details/models/product_details_response.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(this._repo) : super(const ProductDetailsState.loading()) {
    on<FetchProductDetails>(_getProductDetails);
  }
  final ProductDetailsRepo _repo;
  FutureOr<void> _getProductDetails(
    FetchProductDetails event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());
    final result = await _repo.getProductDetails(productId: event.productId);
    result.when(
      success: (data) => emit(
        ProductDetailsState.success(productModel: data.data.productModel),
      ),
      failure: (error) => emit(ProductDetailsState.error(error: error)),
    );
  }
}
