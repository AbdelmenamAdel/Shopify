import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/core/services/shared_pref/pref_keys.dart';
import 'package:shopify/core/services/shared_pref/shared_pref.dart';
import 'package:shopify/features/auth/data/models/login/login_request_body.dart';
import 'package:shopify/features/auth/data/repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepos) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }
  final AuthRepos _authRepos;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _authRepos.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
    await result.when(
      success: (loginData) async {
        final token = loginData.data.login.accessToken ?? '';
        log(token);
        // ! save token
        await SharedPref().setString(
          PrefKeys.accessToken,
          token,
        );
        // ! get user role
        final user = await _authRepos.userRole(
          token,
        );
        await SharedPref().setInt(
          PrefKeys.userId,
          user.userId ?? 0,
        );
        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }
}
