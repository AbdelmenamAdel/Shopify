part of 'get_all_categories_bloc.dart';

@freezed
class GetAllCategoriesState with _$GetAllCategoriesState {
  const factory GetAllCategoriesState.loading() = LoadingState;
  const factory GetAllCategoriesState.success({
    required List<CategoriesGetAllModel> categoryList,
  }) = SuccessState;
  const factory GetAllCategoriesState.empty() = EmptyState;
  const factory GetAllCategoriesState.error({required String error}) =
      ErrorState;
}
