import 'package:flutter/material.dart';
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
      body: Center(
        child: GestureDetector(
          onTap: (){
          Prefs.setData(key: AppStrings.kIsFirstTime, value: true);
          print(Prefs.getData(key: AppStrings.kIsFirstTime));
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
      ),
    );
  }
}
