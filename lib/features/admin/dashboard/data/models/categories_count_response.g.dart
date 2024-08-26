// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesCountResponse _$CategoriesCountResponseFromJson(
        Map<String, dynamic> json) =>
    CategoriesCountResponse(
      CategoriesCountData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesCountResponseToJson(
        CategoriesCountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesCountData _$CategoriesCountDataFromJson(Map<String, dynamic> json) =>
    CategoriesCountData(
      (json['categories'] as List<dynamic>)
          .map((e) => CategoriesCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesCountDataToJson(
        CategoriesCountData instance) =>
    <String, dynamic>{
      'categories': instance.categoriesList,
    };

CategoriesCountModel _$CategoriesCountModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesCountModel(
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoriesCountModelToJson(
        CategoriesCountModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
