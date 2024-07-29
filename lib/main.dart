import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'core/services/app_pref.dart';
import 'core/utils/app_text_styles.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'FruitHub',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor,),
        // useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Cairo',
        primaryColor: AppColors.primaryColor,
        appBarTheme:  AppBarTheme(
          centerTitle: true,
          scrolledUnderElevation: 0,
          color: Colors.white,
          titleTextStyle: TextStyles.bold19.copyWith(
            color: Colors.black,
          ),

        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName ,

    );
  }
}
