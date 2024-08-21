import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/login/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_hub/features/login/presentation/screens/login_screen.dart';
import '../../../../core/services/app_pref.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Prefs.getData(key: AppStrings.kIsFirstTime));
    return Scaffold(
      body: BlocProvider(
        create: (context) => ServiceLocator.getIt.get<SignInCubit>(),
        child: BlocConsumer<SignInCubit, SignInStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  // Prefs.setData(key: AppStrings.kIsFirstTime, value: true);
                  // print(Prefs.getData(key: AppStrings.kIsFirstTime));
                  context.read<SignInCubit>().signOut();
                  Navigator.of(context).pushReplacementNamed(
                    LoginScreen.routeName,);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Home Screen',
                    style: TextStyles.bold23.copyWith(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
