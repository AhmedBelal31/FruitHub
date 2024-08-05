import 'package:flutter/material.dart';
import '../widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حساب جديد')),
      body: const RegisterScreenBody(),
    );
  }
}
