// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsResponse _$GetAllProductsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllProductsResponse(
      GetAllProductsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllProductsResponseToJson(
        GetAllProductsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllProductsData _$GetAllProductsDataFromJson(Map<String, dynamic> json) =>
    GetAllProductsData(
      (json['products'] as List<dynamic>)
          .map((e) => GetAllProductsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductsDataToJson(GetAllProductsData instance) =>
    <String, dynamic>{
      'products': instance.productsList,
    };

GetAllProductsModel _$GetAllProductsModelFromJson(Map<String, dynamic> json) =>
    GetAllProductsModel(
      json['title'] as String?,
      json['id'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['description'] as String?,
      json['category'] == null
          ? null
          : CategoryProductModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllProductsModelToJson(
        GetAllProductsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'images': instance.images,
      'description': instance.description,
      'category': instance.category,
    };

CategoryProductModel _$CategoryProductModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductModel(
      json['id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoryProductModelToJson(
        CategoryProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
