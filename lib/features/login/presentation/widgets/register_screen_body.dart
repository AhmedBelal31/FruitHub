import 'package:flutter/material.dart';
import 'package:fruit_hub/features/login/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../../../constants.dart';
import '../../../../core/helper_functions/custom_snack_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/have_an_account.dart';
import '../../../../core/widgets/password_field.dart';
import '../../../../core/widgets/register_text_form_field_validations.dart';
import '../../../../core/widgets/terms_and_conditions.dart';
import '../screens/login_screen.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String _name, _email, _password;
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  _name = value!;
                },
                validator: validateName,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  _email = value!;
                },
                validator: validateEmail,
              ),
              const SizedBox(height: 20),
              PasswordField(
                validator: validatePassword,
                onSaved: (value) {
                  _password = value!;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'انشاء حساب جديد',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    FocusScope.of(context).unfocus();
                    if (isTermsAccepted) {

                      SignUpCubit.get(context).createUserWithEmailAndPassword(
                        name: _name,
                        email: _email,
                        password: _password,
                      );
                    } else {
                      customSnackBar(
                        context: context,
                        type: SnackBarType.info,
                        message: 'يجب الموافقة على الشروط والاحكام',
                      );
                    }
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 30),
              HaveAnAccount(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
