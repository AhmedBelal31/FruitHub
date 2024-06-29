import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/on_generate_routes.dart';

import 'features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
           color: Colors.white ,
           titleTextStyle: TextStyle(color: Colors.black)
    
          )),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
