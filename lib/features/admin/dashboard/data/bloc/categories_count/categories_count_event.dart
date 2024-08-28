part of 'categories_count_bloc.dart';

@freezed
class CategoriesCountEvent with _$CategoriesCountEvent {
  const factory CategoriesCountEvent.started() = _Started;
  const factory CategoriesCountEvent.getCategoriesCount() =
      GetCategoriesCountEvent;
}
