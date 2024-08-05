import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/have_an_account.dart';
import '../../../../core/widgets/terms_and_conditions.dart';
import '../screens/login_screen.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            const TermsAndConditions(),
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
    );
  }
}