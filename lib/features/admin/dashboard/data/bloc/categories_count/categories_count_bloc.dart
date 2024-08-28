import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'categories_count_event.dart';
part 'categories_count_state.dart';
part 'categories_count_bloc.freezed.dart';

class CategoriesCountBloc
    extends Bloc<CategoriesCountEvent, CategoriesCountState> {
  CategoriesCountBloc(this._repo)
      : super(const CategoriesCountState.loading()) {
    on<GetCategoriesCountEvent>(_getCategoriesCount);
  }
  final DashBoardRepo _repo;
  // ! get products count
  FutureOr<void> _getCategoriesCount(
    GetCategoriesCountEvent event,
    Emitter<CategoriesCountState> emit,
  ) async {
    emit(const CategoriesCountState.loading());
    final result = await _repo.numberOfCategories();
    result.when(
      success: (categoriesData) => emit(
        CategoriesCountState.success(count: categoriesData.categoriesCount),
      ),
      failure: (error) => emit(CategoriesCountState.failure(error: error)),
    );
  }
}
