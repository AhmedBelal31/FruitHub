import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/features/login/presentation/screens/login_screen.dart';
import '../../../../core/services/app_pref.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../on_boarding/presentation/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var isFirstTime = Prefs.getData(key: AppStrings.kIsFirstTime);
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  void executeNavigation() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      if (isFirstTime == null || isFirstTime == true)
        {
          Navigator.of(context).pushReplacementNamed(OnBoardingScreen.routeName);

        }
      else
        {
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(Assets.assetsImagesPlant),
          ),
          SvgPicture.asset(Assets.assetsImagesLogo),
          SvgPicture.asset(
            Assets.assetsImagesSplashBottom,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
