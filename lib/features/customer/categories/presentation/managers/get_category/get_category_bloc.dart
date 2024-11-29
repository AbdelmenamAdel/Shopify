import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/categories/data/repo/get_category_repo.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';

part 'get_category_bloc.freezed.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  GetCategoryBloc(this._repo) : super(const GetCategoryState.loading()) {
    on<FetchCategoryEvent>(_getCategory);
  }
  final GetCategoryRepo _repo;
  FutureOr<void> _getCategory(
    FetchCategoryEvent event,
    Emitter<GetCategoryState> emit,
  ) async {
    emit(const GetCategoryState.loading());
    final result = await _repo.getCategory(categoryId: event.categoryId);

    result.when(
      success: (data) {
        if (data.getAllProductsList.isEmpty) {
          emit(const GetCategoryState.empty());
        } else {
          emit(GetCategoryState.success(productsList: data.getAllProductsList));
        }
      },
      failure: (error) => emit(GetCategoryState.error(error: error)),
    );
  }
}
