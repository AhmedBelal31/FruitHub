import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/do_not_have_an_account.dart';
import '../../../../core/widgets/forget_password.dart';
import '../../../../core/widgets/or_divider.dart';
import '../widgets/social_login_button.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTextField(
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                  color: Color(0xFFC9CECF),
                ),
                validator: (value) {},
              ),
              const SizedBox(height: 16),
              const ForgetPassword(),
              const SizedBox(height: 32),
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              DoNotHaveAnAccount(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
              ),
              const SizedBox(height: 32),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                title: 'تسجيل الدخول بواسطة جوجل',
                image: Assets.assetsImagesGoogleIcon,
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                title: 'تسجيل الدخول بواسطة فيسبوك',
                image: Assets.assetsImagesFacebookIcon,
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                title: 'تسجيل الدخول بواسطة أبل',
                image: Assets.assetsImagesAppleIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      title: const Text(
        'تسجيل الدخول',
        style: TextStyles.bold19,
        textAlign: TextAlign.center,
      ),
    );
  }
}
