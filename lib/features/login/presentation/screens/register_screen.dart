import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text('Register Screen'),
        ),
      ),
    );
  }
}
