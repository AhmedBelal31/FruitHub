import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity
{
  UserModel({required super.name, required super.email, required String uid, required super.uId});

  factory UserModel.fromFirebaseUser(User user )
  {
    return UserModel(
        name: user.displayName ?? '',
        email: user.email ?? '',
        uid: user.uid,
        uId: user.uid
    );
  }
}