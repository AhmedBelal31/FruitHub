import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_images.dart';
import '../../../on_boarding/presentation/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
      Navigator.of(context).pushReplacementNamed(OnBoardingScreen.routeName);
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
