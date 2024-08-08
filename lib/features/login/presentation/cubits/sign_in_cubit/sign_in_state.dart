part of 'sign_in_cubit.dart';

@immutable
sealed class SignInStates {}

final class SignInInitialState extends SignInStates {}

final class SignInLoadingState extends SignInStates {}

final class SignInSuccessState extends SignInStates {
  final UserEntity userEntity;

  SignInSuccessState(this.userEntity);
}

final class SignInFailureState extends SignInStates {
  final String message;

  SignInFailureState(this.message);
}
