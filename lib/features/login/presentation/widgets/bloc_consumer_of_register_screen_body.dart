import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper_functions/custom_snack_bar.dart';
import '../../../../core/widgets/custom_progress_hud.dart';
import '../cubits/sign_up_cubit/sign_up_cubit.dart';
import '../screens/login_screen.dart';
import 'register_screen_body.dart';

class BlocConsumerOfRegisterScreenBody extends StatelessWidget {
  const BlocConsumerOfRegisterScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          customSnackBar(
            context: context,
            type: SnackBarType.success,
            message: 'تم التسجيل بنجاح',
          );

          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }

        if (state is SignUpFailureState) {
          customSnackBar(
            context: context,
            type: SnackBarType.error,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignUpLoadingState,
          child: const RegisterScreenBody(),
        );
      },
    );
  }
}
