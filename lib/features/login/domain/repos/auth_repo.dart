import '../entities/user_entitiy.dart';

abstract class AuthRepo
{
  Future<UserEntity> createUserWithEmailAndPassword({required String email, required String password});

}