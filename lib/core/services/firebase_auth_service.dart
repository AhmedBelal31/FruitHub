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

  // Future<User> sigInWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
  //
  //   return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  // }

  Future<User> sigInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

        try {
          // Try to sign in with the Facebook credential
          return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            final email = e.email;
            final signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email!);

            if (signInMethods.contains('google.com')) {
              final googleUser = await _googleSignIn.signIn();
              final googleAuth = await googleUser?.authentication;
              final googleCredential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken: googleAuth?.idToken,
              );

              final userCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
              await userCredential.user?.linkWithCredential(facebookAuthCredential);

              return userCredential.user!;
            } else {
              throw CustomException(message: 'User signed in with another method.');
            }
          } else {
            rethrow;
          }
        }
      } else {
        throw CustomException(message: 'Facebook login failed.');
      }
    } catch (e) {
      log('Error in sigInWithFacebook: $e');
      throw CustomException(message: 'An unexpected error occurred.');
    }
  }


  // Future<User> sigInWithFacebook() async {
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //     if (loginResult.status == LoginStatus.success) {
  //       final facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
  //
  //       try {
  //         final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //
  //         return userCredential.user!;
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'account-exists-with-different-credential') {
  //           final email = e.email;
  //
  //           final googleUser = await _googleSignIn.signIn(); // Try signing in with Google
  //           if (googleUser != null) {
  //             // User has existing Google account, handle conflict
  //             // (e.g., prompt user for choice)
  //           } else {
  //             // No existing Google account, handle differently
  //             // (e.g., allow linking Facebook)
  //           }
  //           throw CustomException(message: 'Email conflict detected.'); // Or handle differently
  //         } else {
  //           rethrow;
  //         }
  //       }
  //     } else {
  //       throw CustomException(message: 'Facebook login failed.');
  //     }
  //   } catch (e) {
  //     log('Error in sigInWithFacebook: $e');
  //     throw CustomException(message: 'An unexpected error occurred.');
  //   }
  // }





  // Future<User> signInWithFacebookOrGoogle() async {
  //   try {
  //     // Attempt Facebook login
  //     final facebookLoginResult = await FacebookAuth.instance.login();
  //     if (facebookLoginResult.status == LoginStatus.success) {
  //       final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.tokenString);
  //       try {
  //         return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'account-exists-with-different-credential') {
  //           // Handle email conflict
  //           return handleEmailConflict(e.email!, facebookAuthCredential);
  //         } else {
  //           rethrow;
  //         }
  //       }
  //     }
  //
  //     // Attempt Google login if Facebook fails or is not available
  //     final googleUser = await GoogleSignIn().signIn();
  //     if (googleUser != null) {
  //       final googleAuth = await googleUser.authentication;
  //       final googleCredential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //       try {
  //         return (await FirebaseAuth.instance.signInWithCredential(googleCredential)).user!;
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'account-exists-with-different-credential') {
  //           // Handle email conflict
  //           return handleEmailConflict(e.email!, googleCredential);
  //         } else {
  //           rethrow;
  //         }
  //       }
  //     }
  //
  //     // Handle case where both Facebook and Google login failed
  //     throw Exception('Login failed');
  //   } catch (e) {
  //     // Handle general errors
  //     print('Error: $e');
  //     rethrow;
  //   }
  // }
  //
  // Future<User> handleEmailConflict(String email, AuthCredential credential) async {
  //   // Check if the user has an existing account with the same credential
  //   final existingUser = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  //   if (existingUser.contains(credential.providerId)) {
  //     // User already has an account with the same credential
  //     // Handle this case (e.g., prompt user for password, etc.)
  //     // For simplicity, let's throw an exception for now
  //     throw Exception('User already has an account with the same credential');
  //   } else {
  //     // User has an account with a different credential
  //     // Prompt user to link accounts or create a new account
  //     // For simplicity, let's link accounts automatically
  //     final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //     await userCredential.user?.linkWithCredential(credential);
  //     return userCredential.user!;
  //   }
  // }





















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
