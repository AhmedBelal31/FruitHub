import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/login/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/login/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../widgets/bloc_consumer_of_register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حساب جديد')),
      body: BlocProvider(
        create: (context) => SignUpCubit(
          authRepo: ServiceLocator.getIt<AuthRepo>(),
        ),
        child: const BlocConsumerOfRegisterScreenBody(),
      ),
    );
  }
}


