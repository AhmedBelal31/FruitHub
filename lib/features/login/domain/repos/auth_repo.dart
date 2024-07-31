import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';

import '../entities/user_entitiy.dart';

abstract class AuthRepo
{
  Future<Either<Failure ,UserEntity >> createUserWithEmailAndPassword({required String email, required String password});

}