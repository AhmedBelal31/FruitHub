import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/screens/home_screen.dart';
import 'package:fruit_hub/features/login/presentation/screens/login_screen.dart';
import 'package:fruit_hub/features/login/presentation/screens/register_screen.dart';
import 'package:fruit_hub/features/splash/presentation/screens/splash_screen.dart';

import '../../features/on_boarding/presentation/screens/onboarding_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
