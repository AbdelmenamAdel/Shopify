import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/core/services/shared_pref/pref_keys.dart';
import 'package:shopify/core/services/shared_pref/shared_pref.dart';
import 'package:shopify/features/auth/data/models/login/login_request_body.dart';
import 'package:shopify/features/auth/data/models/signup/sign_up_request_body.dart';
import 'package:shopify/features/auth/data/repos/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const _Initial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
  }
  final AuthRepos _repo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  FutureOr<void> _login(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
    await result.when(
      success: (loginData) async {
        final token = loginData.data.login.accessToken ?? '';
        // ! save token
        await SharedPref().setString(
          PrefKeys.accessToken,
          token,
        );
        // ! get user role
        final user = await _repo.userRole(
          token,
        );
        await SharedPref().setInt(
          PrefKeys.userId,
          user.userId ?? 0,
        );
        await SharedPref().setString(
          PrefKeys.userRole,
          user.userRole ?? '',
        );
        await _repo.addUserIdFirebase(userId: user.userId.toString());
        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }

  FutureOr<void> _signUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _repo.signUp(
      SignUpRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
        avatar: event.imageUrl,
      ),
    );
    result.when(
      success: (signUpData) {
        add(const AuthEvent.login());
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }
}
