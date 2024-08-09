import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper_functions/custom_snack_bar.dart';
import '../../../../core/services/app_pref.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_progress_hud.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../cubits/sign_in_cubit/sign_in_cubit.dart';
import 'login_screen_body.dart';

class BlocConsumerOfLoginScreen extends StatelessWidget {
  const BlocConsumerOfLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          customSnackBar(
            context: context,
            type: SnackBarType.success,
            message: 'تم تسجيل الدخول بنجاح',
          );

           Prefs.setData(key: AppStrings.kIsAlreadyLogin, value: true);

          Navigator.pushNamed(context, HomeScreen.routeName);
        }

        if (state is SignInFailureState) {
          customSnackBar(
            context: context,
            type: SnackBarType.error,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoadingState,
          child: const LoginScreenBody(),
        );
      },
    );
  }
}
