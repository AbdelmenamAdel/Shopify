// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersResponse _$GetAllUsersResponseFromJson(Map<String, dynamic> json) =>
    GetAllUsersResponse(
      UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllUsersResponseToJson(
        GetAllUsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'users': instance.users,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
