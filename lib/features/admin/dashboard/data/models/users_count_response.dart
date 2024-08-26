import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_count_response.g.dart';

@JsonSerializable()
class UsersCountResponse {
  const UsersCountResponse(this.data);

  factory UsersCountResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersCountResponseFromJson(json);

  final UsersCountData data;
  String get usersCount {
    if (data.usersList.isNotEmpty) {
      return data.usersList.length.toString();
    }
    return '0';
  }
}

@JsonSerializable()
class UsersCountData {
  const UsersCountData(this.usersList);

  factory UsersCountData.fromJson(Map<String, dynamic> json) =>
      _$UsersCountDataFromJson(json);

  @JsonKey(name: 'users')
  final List<UsersCountModel> usersList;
}

@JsonSerializable()
class UsersCountModel {
  const UsersCountModel(this.name);
  factory UsersCountModel.fromJson(Map<String, dynamic> json) =>
      _$UsersCountModelFromJson(json);
  final String? name;
}
