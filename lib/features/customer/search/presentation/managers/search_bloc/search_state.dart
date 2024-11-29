part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  factory SearchState.loading() = LoadingState;
  factory SearchState.empty() = EmptyState;
  factory SearchState.error({required String error}) = ErrorState;
  factory SearchState.success(
      {required List<GetAllProductsModel> productList}) = SuccessState;
}
