import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/features/onboarding/domain/usecases/set_name_use_case.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final SetNameUseCase _setNameUseCase;
  OnboardingBloc(this._setNameUseCase) : super(OnboardingInitial()) {
    on<OnboardingSetNameEvent>(onOnboardingSetNameEvent);
  }

  FutureOr<void> onOnboardingSetNameEvent(
      OnboardingSetNameEvent event, Emitter<OnboardingState> emit) async {
    final DataState dataState = await _setNameUseCase(event.name);

    if (dataState is DataSuccess) {
      emit(OnboardingSuccessState(
        afterSuccess: (ctx) {
          ctx as BuildContext;
          ctx.navigator.pushReplacementNamed("/");
        },
      ));
    } else {
      emit(OnboardingFailedState(exception: dataState.exception));
    }
  }
}
