part of 'products_count_bloc.dart';

@freezed
class ProductsCountEvent with _$ProductsCountEvent {
  const factory ProductsCountEvent.started() = _Started;
  const factory ProductsCountEvent.getProductsCount() = GetProductsCountEvent;
}
