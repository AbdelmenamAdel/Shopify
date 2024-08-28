part of 'get_all_users_bloc.dart';

@freezed
class GetAllUsersState with _$GetAllUsersState {
  const factory GetAllUsersState.loading() = LoadingState;
  const factory GetAllUsersState.success({required List<UserModel> usersList}) =
      SuccessState;
  const factory GetAllUsersState.empty() = EmptyState;
  const factory GetAllUsersState.error({required String error}) = ErrorState;
  const factory GetAllUsersState.search({required List<UserModel> usersList}) =
      SearchUserState;
}
