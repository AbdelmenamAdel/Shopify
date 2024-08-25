import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  SignUpRequestBody({
    this.name,
    this.email,
    this.password,
    this.avatar,
  });
  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);
  final String? name;
  final String? email;
  final String? password;
  final String? avatar;
}
