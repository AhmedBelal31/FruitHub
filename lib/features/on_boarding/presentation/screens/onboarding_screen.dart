import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/on_boarding_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = 'onBoarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;

  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: OnBoardingPageView(
                pageController: pageController,
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count:2,
              effect: const SwapEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.lightPrimaryColor,
                dotColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 100,)
          ],

        ),
      ),
    );
  }
}
