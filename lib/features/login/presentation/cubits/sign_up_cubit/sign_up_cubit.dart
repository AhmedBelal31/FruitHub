import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final AuthRepo authRepo;

  SignUpCubit(this.authRepo) : super(SignUpInitialState());

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());

    final eitherFailureOrUserEntity =
        await authRepo.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );

    eitherFailureOrUserEntity.fold(
      (failure) {
        emit(SignUpFailureState(failure.message));
      },
      (userEntity) {
        emit(SignUpSuccessState(userEntity));
      },
    );
  }
}
