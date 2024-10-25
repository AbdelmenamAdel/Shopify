import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/products/data/models/update_product_request_body.dart';
import 'package:shopify/features/admin/products/data/repos/products_admin_repo.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';
part 'update_product_bloc.freezed.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc(this._repo) : super(const _Initial()) {
    on<ReNewProductEvent>(_updateProduct);
  }
  final ProductsAdminRepo _repo;
  FutureOr<void> _updateProduct(
    ReNewProductEvent event,
    Emitter<UpdateProductState> emit,
  ) async {
    emit(const UpdateProductState.loading());
    final result = await _repo.updateProduct(body: event.body);
    result.when(
      success: (_) {
        emit(const UpdateProductState.success());
      },
      failure: (error) {
        emit(UpdateProductState.error(error: error));
      },
    );
  }
}
