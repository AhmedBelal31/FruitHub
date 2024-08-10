import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../errors/exceptions.dart';

class FirebaseAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
        return CustomException(
            message: 'البريد الالكتروني او الرقم السري غير صحيح');
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
        return CustomException(
            message: 'البريد الالكتروني او الرقم السري غير صحيح');
      default:
        return CustomException(message: 'حدث خطأ غير متوقع.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> sigInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      log('User signed out successfully from both Firebase and Google.');
    } catch (e) {
      log('Error signing out: $e');
    }
  }
}
