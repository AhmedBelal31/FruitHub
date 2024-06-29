import 'package:flutter/material.dart';
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
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
