part of 'products_count_bloc.dart';

@freezed
class ProductsCountState with _$ProductsCountState {
  const factory ProductsCountState.loading() = LoadingState;
  const factory ProductsCountState.success({required String count}) =
      SuccessState;
  const factory ProductsCountState.failure({required String error}) =
      FailureState;
}
