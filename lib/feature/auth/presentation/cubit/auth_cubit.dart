import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  var formkey = GlobalKey<FormState>();
  var usernamController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var otpController = TextEditingController();

  login() async {
    emit(AuthloadingState());

    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );
    var response = await AuthRepo.login(params);
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('Login Failed'));
    }
  }

  register() async {
    emit(AuthloadingState());

    var params = AuthParams(
      name: usernamController.text,
      email: emailController.text,
      password: passwordController.text,
      password_confirmation: passwordConfirmationController.text,
    );
    var response = await AuthRepo.register(params);
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('Registration Failed'));
    }
  }

  forget_password() async {
    emit(AuthloadingState());

    var params = AuthParams(
      email: LocalHelper.getString(LocalHelper.KEmail) ?? emailController.text,
    );
    var response = await AuthRepo.forget_password(params);
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('forget password Failed'));
    }
  }

  check_forget_password() async {
    emit(AuthloadingState());

    var params = AuthParams(
      email: LocalHelper.getString(LocalHelper.KEmail),
      verify_code: int.parse(otpController.text),
    );

    var response = await AuthRepo.check_forget_password(params);
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('forget password Failed'));
    }
  }

  reset_password() async {
    emit(AuthloadingState());
    log('${LocalHelper.getString(LocalHelper.Kotp)}');
    var params = AuthParams(
      verify_code: int.tryParse(LocalHelper.getString(LocalHelper.Kotp) ?? ''),
      new_password: passwordController.text,
      new_password_confirmation: passwordConfirmationController.text,
    );

    var response = await AuthRepo.reset_password(params);

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState('Reset password Failed'));
    }
  }
}
