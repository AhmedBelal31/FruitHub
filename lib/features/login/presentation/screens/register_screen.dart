import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/login/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/login/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../core/helper_functions/custom_snack_bar.dart';
import '../widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حساب جديد')),
      body: BlocProvider(
        create: (context) => SignUpCubit(
          authRepo: GetItService.getIt<AuthRepo>(),
        ),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              // Navigator.pushNamed(context, LoginScreen.routeName);
              customSnackBar(
                context: context,
                type: CustomSnackBarType.success,
                message: 'تم التسجيل بنجاح',
              );
            }

            if (state is SignUpFailureState) {
              customSnackBar(
                context: context,
                type: CustomSnackBarType.error,
                message: state.message,
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignUpLoadingState,
              child: RegisterScreenBody(),
            );
          },
        ),
      ),
    );
  }
}
