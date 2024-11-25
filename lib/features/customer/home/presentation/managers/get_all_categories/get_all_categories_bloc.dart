import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/categories/data/models/get_all_categories_reponse.dart';
import 'package:shopify/features/customer/home/data/repo/home_repo.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';
part 'get_all_categories_bloc.freezed.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc(this._repo)
      : super(const GetAllCategoriesState.loading()) {
    on<FetchAllCategoriesEvent>(_getAllCategories);
  }
  final HomeRepo _repo;
  FutureOr<void> _getAllCategories(
    FetchAllCategoriesEvent event,
    Emitter<GetAllCategoriesState> emit,
  ) async {
    emit(const GetAllCategoriesState.loading());
    final result = await _repo.getAllCategories();
    result.when(
      success: (categories) {
        if (categories.data.categoriesList.isEmpty) {
          emit(const GetAllCategoriesState.empty());
        } else {
          emit(
            GetAllCategoriesState.success(
              categoryList: categories.data.categoriesList,
            ),
          );
        }
      },
      failure: (error) => emit(GetAllCategoriesState.error(error: error)),
    );
  }
}
