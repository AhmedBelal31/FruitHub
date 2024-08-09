import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/do_not_have_an_account.dart';
import '../../../../core/widgets/forget_password.dart';
import '../../../../core/widgets/or_divider.dart';
import '../../../../core/widgets/register_text_form_field_validations.dart';
import '../cubits/sign_in_cubit/sign_in_cubit.dart';
import '../screens/register_screen.dart';
import 'social_login_button.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({
    super.key,
  });

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: autovalidateMode,
                onSaved: (value) {
                  _email = value!;
                },
                validator:validateEmail,
              ),
              const SizedBox(height: 20),
              // CustomTextField(
              //   hintText: 'كلمة المرور',
              //   keyboardType: TextInputType.visiblePassword,
              //   autovalidateMode: autovalidateMode,
              //   obscureText: true,
              //   suffixIcon: const Icon(
              //     Icons.remove_red_eye,
              //     color: Color(0xFFC9CECF),
              //   ),
              //   onSaved: (value) {
              //     _password = value!;
              //   },
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'من فضلك ادخل كلمة المرور';
              //     }
              //     return null;
              //   },
              // ),

              PasswordField(
                onSaved: (value) {
                  _password = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك ادخل كلمة المرور';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const ForgetPassword(),
              const SizedBox(height: 32),
              CustomButton(
                text: 'تسجيل الدخول',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    _formKey.currentState!.save();
                    SignInCubit.get(context).signInWithEmailAndPassword(
                      email: _email,
                      password: _password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
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
}
