import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInStates> {
  AuthRepo authRepo;

  SignInCubit({required this.authRepo}) : super(SignInInitialState());
  static SignInCubit get(context)=> BlocProvider.of(context);

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SignInLoadingState());
    final eitherFailureOrUserEntity = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    eitherFailureOrUserEntity.fold((failure) {
      emit(SignInFailureState(failure.message));
    }, (userEntity) {
      emit(SignInSuccessState(userEntity));
    });
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoadingState());
    final eitherFailureOrUserEntity = await authRepo.signInWithGoogle();
    eitherFailureOrUserEntity.fold((failure) {
      emit(SignInFailureState(failure.message));
    }, (userEntity) {
      print(userEntity);
      emit(SignInSuccessState(userEntity));
    });
  }


}
