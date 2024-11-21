import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/auth/data/models/login/user_role_response.dart';
import 'package:shopify/features/customer/profile/data/repos/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._repo) : super(const ProfileState.loading()) {
    on<GetUserDataEvent>(_getUserInData);
  }
  final ProfileRepo _repo;
  FutureOr<void> _getUserInData(
    GetUserDataEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    final result = await _repo.getUserProfile();
    result.when(
      success: (userInfo) {
        emit(
          ProfileState.success(
            userInfoModel: userInfo,
          ),
        );
      },
      failure: (error) {
        emit(
          ProfileState.error(errMsg: error),
        );
      },
    );
  }
}
