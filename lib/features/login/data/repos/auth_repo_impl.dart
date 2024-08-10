import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/features/login/data/user_model.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword || Auth Repo Impl : ${e.toString()}');

      return left(ServerFailure('حدث خطأ غير متوقع.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword || Auth Repo Impl : ${e.toString()}');
      return left(ServerFailure('حدث خطأ غير متوقع.'));
    }
  }


  // @override
  // Future<Either<Failure, UserEntity>> signInWithFacebook() async {
  //   try {
  //     var user = await firebaseAuthService.signInWithFacebook();
  //     return right(UserModel.fromFirebaseUser(user));
  //   } on CustomException catch (e) {
  //     return left(ServerFailure(e.message));
  //   } catch (e) {
  //     log('Exception in signInWithFacebook || Auth Repo Impl : ${e.toString()}');
  //     return left(ServerFailure('حدث خطأ غير متوقع.'));
  //   }
  // }
  //





  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      print(user);
      return right(UserModel.fromFirebaseUser(user));
    }  catch (e) {
      log('Exception in signInWithGoogle || Auth Repo Impl : ${e.toString()}');
      return left(ServerFailure('حدث خطأ غير متوقع.'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async{
    try {
      return right(firebaseAuthService.signOut());
    } catch (e) {
      log('Exception in signOut || Auth Repo Impl : ${e.toString()}');
      return left(ServerFailure('حدث خطأ غير متوقع.'));
    }
  }
}
