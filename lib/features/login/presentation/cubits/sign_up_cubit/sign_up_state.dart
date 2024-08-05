part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpStates {}

final class SignUpInitialState extends SignUpStates {}

final class SignUpLoadingState extends SignUpStates {}

final class SignUpSuccessState extends SignUpStates {
  final UserEntity userEntity;

  SignUpSuccessState(this.userEntity);
}

final class SignUpFailureState extends SignUpStates {
  final String message;

  SignUpFailureState(this.message);
}
