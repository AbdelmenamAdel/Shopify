part of 'users_count_bloc.dart';

@freezed
class UsersCountEvent with _$UsersCountEvent {
  const factory UsersCountEvent.started() = _Started;
  const factory UsersCountEvent.getUsersCount() = GetUsersCountEvent;
}
