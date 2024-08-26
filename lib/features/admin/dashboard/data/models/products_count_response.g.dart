// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsCountResponse _$ProductsCountResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsCountResponse(
      ProductsCountData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsCountResponseToJson(
        ProductsCountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductsCountData _$ProductsCountDataFromJson(Map<String, dynamic> json) =>
    ProductsCountData(
      (json['products'] as List<dynamic>)
          .map((e) => ProductsCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsCountDataToJson(ProductsCountData instance) =>
    <String, dynamic>{
      'products': instance.productsList,
    };

ProductsCountModel _$ProductsCountModelFromJson(Map<String, dynamic> json) =>
    ProductsCountModel(
      json['title'] as String?,
    );

Map<String, dynamic> _$ProductsCountModelToJson(ProductsCountModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
