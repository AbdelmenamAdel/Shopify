import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_count_response.g.dart';

@JsonSerializable()
class CategoriesCountResponse {
  const CategoriesCountResponse(this.data);

  factory CategoriesCountResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesCountResponseFromJson(json);

  final CategoriesCountData data;
  String get categoriesCount {
    if (data.categoriesList.isNotEmpty) {
      return data.categoriesList.length.toString();
    }
    return '0';
  }
}

@JsonSerializable()
class CategoriesCountData {
  const CategoriesCountData(this.categoriesList);

  factory CategoriesCountData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesCountDataFromJson(json);

  @JsonKey(name: 'categories')
  final List<CategoriesCountModel> categoriesList;
}

@JsonSerializable()
class CategoriesCountModel {
  const CategoriesCountModel(this.name);
  factory CategoriesCountModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesCountModelFromJson(json);
  final String? name;
}
