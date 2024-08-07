import 'package:firebase_auth/firebase_auth.dart';
import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الباسورد ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'هذا البريد الالكتروني مستخدم مسبقاً.');
      } else {
        throw CustomException(message: 'حدث خطأ غير متوقع.');
      }
    } catch (e) {
      throw CustomException(message: 'حدث خطأ غير متوقع.');
    }
  }
}
