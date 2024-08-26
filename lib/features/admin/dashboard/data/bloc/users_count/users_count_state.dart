part of 'users_count_bloc.dart';

@freezed
class UsersCountState with _$UsersCountState {
  const factory UsersCountState.loading() = LoadingState;
  const factory UsersCountState.success({required String count}) = SuccessState;
  const factory UsersCountState.failure({required String error}) = FailureState;
}
