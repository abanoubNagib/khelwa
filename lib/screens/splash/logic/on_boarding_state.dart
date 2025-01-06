
import 'package:equatable/equatable.dart';
import 'package:khelwa/core/utils/enums.dart';
import 'package:khelwa/screens/splash/data/onboarding_model.dart';

class OnBoardingState extends Equatable {
  final RequestState requestState;
  final String errorMessage;
  final List<OnBoardingModel> onBoardingList;

  const OnBoardingState({
    this.requestState = RequestState.initial,
    this.errorMessage = '',
    this.onBoardingList = const [],
  });


  OnBoardingState copyWith({
    RequestState? requestState,
    String? errorMessage,
    List<OnBoardingModel>? onBoardingList,
  }) {
    return OnBoardingState(
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
      onBoardingList: onBoardingList ?? this.onBoardingList,
    );
  }

  @override
  List<Object> get props => [
        requestState,
        errorMessage,
        onBoardingList,
      ];
}
