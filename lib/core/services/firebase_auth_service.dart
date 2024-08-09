import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (exception) {
      log('FirebaseAuthException in createUserWithEmailAndPassword: ${exception.code} : Code is : ${exception.message}');
      throw _handleFirebaseAuthException(exception);
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ غير متوقع.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (exception) {
      log('FirebaseAuthException in signInWithEmailAndPassword: ${exception.code} : Code is : ${exception.message}');
      throw _handleFirebaseAuthException(exception);
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ غير متوقع.');
    }
  }

  CustomException _handleFirebaseAuthException(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case 'user-not-found':
        return CustomException(message: 'البريد الالكتروني او الرقم السري غير صحيح');
      case 'weak-password':
        return CustomException(message: 'الباسورد ضعيف جداً.');
      case 'email-already-in-use':
        return CustomException(message: 'هذا البريد الالكتروني مستخدم مسبقاً.');
      case 'invalid-email':
        return CustomException(message: 'البريد الالكتروني غير صالح.');
      case 'operation-not-allowed':
        return CustomException(
            message: 'لا يمكنك استخدام هذا البريد الالكتروني.');
      case 'network-request-failed':
        return CustomException(message: 'لا يوجد اتصال بالانترنت.');
      case 'user-disabled':
        return CustomException(message: 'هذا البريد الالكتروني معطل.');
      case 'wrong-password':
        return CustomException(
            message: 'البريد الالكتروني او الرقم السري غير صحيح');
      case 'invalid-credential':
        return CustomException(message: 'البريد الالكتروني او الرقم السري غير صحيح');
      default:
        return CustomException(message: 'حدث خطأ غير متوقع.');
    }
  }
}
