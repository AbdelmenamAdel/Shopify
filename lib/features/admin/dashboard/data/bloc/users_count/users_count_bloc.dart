import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'users_count_event.dart';
part 'users_count_state.dart';
part 'users_count_bloc.freezed.dart';

class UsersCountBloc extends Bloc<UsersCountEvent, UsersCountState> {
  UsersCountBloc(this._repo) : super(const UsersCountState.loading()) {
    on<GetUsersCountEvent>(_getUsersCount);
  }
  final DashBoardRepo _repo;
  // ! get products count
  FutureOr<void> _getUsersCount(
    GetUsersCountEvent event,
    Emitter<UsersCountState> emit,
  ) async {
    emit(const UsersCountState.loading());
    final result = await _repo.numberOfUsers();
    result.when(
      success: (usersData) => emit(
        UsersCountState.success(count: usersData.usersCount),
      ),
      failure: (error) => emit(UsersCountState.failure(error: error)),
    );
  }
}
