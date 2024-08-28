import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/users/data/models/get_all_users_response.dart';
import 'package:shopify/features/admin/users/data/repos/users_repo.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';
part 'get_all_users_bloc.freezed.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc(this._repo) : super(const GetAllUsersState.loading()) {
    on<FetchAllUsersEvent>(_getAllUsers);
    on<SearchForUsersEvent>(_searchForUsers);
  }
  final UsersRepo _repo;
  List<UserModel> usersList = [];
  TextEditingController searchController = TextEditingController();

  FutureOr<void> _getAllUsers(
    FetchAllUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    if (event.isNotLoaded) {
      emit(const GetAllUsersState.loading());
    }
    final result = await _repo.getAllUsers();

    result.when(
      success: (users) {
        if (users.data.users.isEmpty) {
          emit(const GetAllUsersState.empty());
        } else {
          usersList = users.data.users;
          emit(GetAllUsersState.success(usersList: usersList));
        }
      },
      failure: (error) {
        emit(GetAllUsersState.error(error: error));
      },
    );
  }

// ! Search For Users
  FutureOr<void> _searchForUsers(
    SearchForUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    final searchResult = usersList
        .where(
          (searchWith) =>
              searchWith.name!
                  .toLowerCase()
                  .startsWith(event.searchName!.toLowerCase().trim()) ||
              searchWith.email!
                  .toLowerCase()
                  .startsWith(event.searchName!.toLowerCase().trim()),
        )
        .toList();
    if (searchResult.isEmpty) {
      emit(const GetAllUsersState.empty());
    } else {
      emit(GetAllUsersState.success(usersList: searchResult));
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
