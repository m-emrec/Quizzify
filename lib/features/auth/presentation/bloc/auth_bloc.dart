// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/features/auth/domain/usecases/forgotPassword_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithEmail_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithFacebook_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithGoogle_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signup_user_with_email_usecase.dart';
import 'package:trivia/logger.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final SignInWithEmailUsecase _signInWithEmailUsecase;
  final SignUpUserWithEmailUsecase _signUpUserWithEmailUsecase;
  final SignInUserWithGoogleUsecase _signInUserWithGoogleUsecase;
  final SignInUserWithFacebook _signInUserWithFacebook;
  AuthBloc(
      this._forgotPasswordUsecase,
      this._signInWithEmailUsecase,
      this._signUpUserWithEmailUsecase,
      this._signInUserWithGoogleUsecase,
      this._signInUserWithFacebook)
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthSignUpWithEmailEvent>(onAuthSignUpWithEmail);
    on<AuthSignInWithEmailEvent>(onAuthSignInWithEmailEvent);
    on<AuthForgotPasswordEvent>(onAuthForgotPasswordEvent);
    on<AuthSignInWithGoogleEvent>(onAuthSignInWithGoogleEvent);
  }

  FutureOr<void> onAuthSignUpWithEmail(
      AuthSignUpWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final DataState dataState = await _signUpUserWithEmailUsecase({
        "email": event.email,
        "password": event.password,
      });
      if (dataState is DataSuccess) {
        emit(AuthSuccessState(successMessage: "Successfully signed up."));
      } else {
        emit(AuthFailedState(dataState.exception ?? ""));
      }
    } catch (e) {
      emit(
        AuthFailedState(
          e.toString(),
        ),
      );
    }
  }

  FutureOr<void> onAuthSignInWithEmailEvent(
      AuthSignInWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final DataState dataState = await _signInWithEmailUsecase({
        "email": event.email,
        "password": event.password,
      });

      if (dataState is DataSuccess) {
        emit(AuthSuccessState(successMessage: "Successfully signed in."));
      } else {
        emit(AuthFailedState(dataState.exception ?? ""));
      }
    } catch (e) {
      logger.e(e);
      emit(AuthFailedState(e.toString()));
    }
  }

  FutureOr<void> onAuthForgotPasswordEvent(
      AuthForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final DataState dataState = await _forgotPasswordUsecase(event.email);

      if (dataState is DataSuccess) {
        emit(AuthSuccessState(
          successMessage: "Password reset email sent.",
          afterSuccess: (context) {
            context as BuildContext;
            context.navigator.pop();
          },
        ));
      } else {
        emit(AuthFailedState(dataState.exception ?? ""));
      }
    } catch (e) {
      logger.e(e);
      emit(AuthFailedState(e.toString()));
    }
  }

  FutureOr<void> onAuthSignInWithGoogleEvent(
      AuthSignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    try {
      final DataState dataState = await _signInUserWithGoogleUsecase(null);
      if (dataState is DataSuccess) {
        emit(AuthSuccessState(successMessage: "Signed in"));
      } else {
        emit(AuthFailedState(dataState.exception.toString()));
      }
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }
}
