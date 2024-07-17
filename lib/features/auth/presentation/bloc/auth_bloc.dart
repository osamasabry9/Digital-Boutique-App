import 'dart:async';
import 'package:digital_boutique/core/local_storage/secure_storage/secure_storage_helper.dart';
import 'package:digital_boutique/core/local_storage/shared_pref/pref_keys.dart';
import 'package:digital_boutique/core/local_storage/shared_pref/shared_pref.dart';
import 'package:digital_boutique/features/auth/data/models/login_request_body.dart';
import 'package:digital_boutique/features/auth/data/reposatory/auth_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }

   final AuthRepos _repo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

//Login
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _repo.login(
    body:   LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    await result.when(
      success: (loginData) async {
        // user token
        final token = loginData.data.login.accessToken ?? '';
        // save token in secure storage
        await SecureStorageHelper.setSecuredString(PrefKeys.accessToken, token);
        // get user role
        final user = await _repo.userRole(token);
        await SharedPref().setInt(PrefKeys.userId, user.userId ?? 0);
        await SharedPref().setString(PrefKeys.userRole, user.userRole ?? '');
        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }
}
