import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/login/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import '../widgets/bloc_consumer_of_login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocProvider(
        create: (context) => ServiceLocator.getIt.get<SignInCubit>(),
        child: BlocConsumerOfLoginScreen(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   icon: const Icon(
      //     Icons.arrow_back_ios_new,
      //     color: Colors.black,
      //   ),
      // ),
      title: const Text(
        'تسجيل الدخول',
        textAlign: TextAlign.center,
      ),
    );
  }
}
