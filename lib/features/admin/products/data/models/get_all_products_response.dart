import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_products_response.g.dart';

@JsonSerializable()
class GetAllProductsResponse {
  const GetAllProductsResponse(this.data);
  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);

  final GetAllProductsData data;
  List<GetAllProductsModel> get getAllProductsList {
    if (data.productsList.isNotEmpty) {
      return data.productsList;
    }
    return [];
  }
}

@JsonSerializable()
class GetAllProductsData {
  const GetAllProductsData(this.productsList);
  factory GetAllProductsData.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsDataFromJson(json);
  @JsonKey(name: 'products')
  final List<GetAllProductsModel> productsList;
}

@JsonSerializable()
class GetAllProductsModel {
  const GetAllProductsModel(
    this.title,
    this.id,
    this.price,
    this.images,
    this.description,
    this.category,
  );
  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsModelFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'category')
  final CategoryProductModel? category;
}

@JsonSerializable()
class CategoryProductModel {
  const CategoryProductModel(this.id, this.name);
  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
}
