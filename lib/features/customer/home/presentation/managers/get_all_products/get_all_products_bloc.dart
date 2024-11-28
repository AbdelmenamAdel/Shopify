import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/home/data/repo/home_repo.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';
part 'get_all_products_bloc.freezed.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc(this._repo) : super(const GetAllProductsState.loading()) {
    on<GetAllProductsEvent>(_getAllProducts);
  }
  final HomeRepo _repo;
  bool isProductListSmallerThan10 = false;

  FutureOr<void> _getAllProducts(
    GetAllProductsEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    emit(const GetAllProductsState.loading());
    final result = await _repo.getAllProducts();
    result.when(
      success: (products) {
        if (products.data.productsList.isEmpty) {
          emit(const GetAllProductsState.empty());
        } else {
          isProductListSmallerThan10 = products.data.productsList.length >= 10;

          emit(
            GetAllProductsState.success(
              productList: products.data.productsList,
            ),
          );
        }
      },
      failure: (error) => emit(GetAllProductsState.error(error: error)),
    );
  }
}
