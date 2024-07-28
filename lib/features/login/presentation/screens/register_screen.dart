import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/login/presentation/screens/login_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/have_an_account.dart';
import '../../../../core/widgets/terms_and_conditions.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTextField(
                  hintText: 'الاسم كامل',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  hintText: 'البريد الالكتروني',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  hintText: 'كلمة المرور',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Color(0xFFC9CECF),
                  ),
                ),
                const SizedBox(height: 16),
                TermsAndConditions(),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'انشاء حساب جديد',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                HaveAnAccount(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                )
              ],
            ),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'حساب جديد',
      ),
    );
  }
}

