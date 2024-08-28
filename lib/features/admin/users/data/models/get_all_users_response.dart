import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_users_response.g.dart';

@JsonSerializable()
class GetAllUsersResponse {
  GetAllUsersResponse(this.data);
  factory GetAllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersResponseFromJson(json);
  final UserData data;
}

@JsonSerializable()
class UserData {
  UserData(this.users);
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  @JsonKey(name: 'users')
  final List<UserModel> users;
}

@JsonSerializable()
class UserModel {
  UserModel(this.id, this.name, this.email);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'email')
  final String? email;
}
