import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khelwa/core/utils/enums.dart';
import 'package:khelwa/screens/splash/data/onboarding_model.dart';
import 'package:khelwa/services/base_api_service.dart';

import '../../../core/utils/dependency_injection.dart';
import 'on_boarding_event.dart';
import 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final BaseApiService apiService = sl<BaseApiService>();
  OnBoardingBloc() : super(const OnBoardingState()) {
    on<GetOnBoardingEvent>(_onGetOnBoardingEvent);
  }

  FutureOr<void> _onGetOnBoardingEvent(
      GetOnBoardingEvent event, Emitter<OnBoardingState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    try {
      final List<OnBoardingModel> onBoardingList =
          await apiService.getOnBoarding();
      emit(state.copyWith(
          requestState: RequestState.success, onBoardingList: onBoardingList));
    } catch (e) {
      emit(state.copyWith(
          requestState: RequestState.error, errorMessage: e.toString()));
    }
  }
}
