import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_count_response.g.dart';

@JsonSerializable()
class ProductsCountResponse {
  const ProductsCountResponse(this.data);

  factory ProductsCountResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsCountResponseFromJson(json);

  final ProductsCountData data;
  String get productsCount {
    if (data.productsList.isNotEmpty) {
      return data.productsList.length.toString();
    }
    return '0';
  }
}

@JsonSerializable()
class ProductsCountData {
  const ProductsCountData(this.productsList);

  factory ProductsCountData.fromJson(Map<String, dynamic> json) =>
      _$ProductsCountDataFromJson(json);

  @JsonKey(name: 'products')
  final List<ProductsCountModel> productsList;
}

@JsonSerializable()
class ProductsCountModel {
  const ProductsCountModel(this.title);
  factory ProductsCountModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsCountModelFromJson(json);
  final String? title;
}
