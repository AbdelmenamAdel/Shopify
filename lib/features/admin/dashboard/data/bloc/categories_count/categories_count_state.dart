part of 'categories_count_bloc.dart';

@freezed
class CategoriesCountState with _$CategoriesCountState {
  const factory CategoriesCountState.loading() = LoadingState;
  const factory CategoriesCountState.success({required String count}) =
      SuccessState;
  const factory CategoriesCountState.failure({required String error}) =
      FailureState;
}
