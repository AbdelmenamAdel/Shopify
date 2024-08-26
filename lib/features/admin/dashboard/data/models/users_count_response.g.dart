// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersCountResponse _$UsersCountResponseFromJson(Map<String, dynamic> json) =>
    UsersCountResponse(
      UsersCountData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersCountResponseToJson(UsersCountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UsersCountData _$UsersCountDataFromJson(Map<String, dynamic> json) =>
    UsersCountData(
      (json['users'] as List<dynamic>)
          .map((e) => UsersCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersCountDataToJson(UsersCountData instance) =>
    <String, dynamic>{
      'users': instance.usersList,
    };

UsersCountModel _$UsersCountModelFromJson(Map<String, dynamic> json) =>
    UsersCountModel(
      json['name'] as String?,
    );

Map<String, dynamic> _$UsersCountModelToJson(UsersCountModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
