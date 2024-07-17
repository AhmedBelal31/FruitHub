import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class HaveAnAccount extends StatelessWidget {
  final Function()? onTap;

  const HaveAnAccount({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟',
            style:
                TextStyles.semiBold16.copyWith(color: const Color(0xFF949D9E)),
          ),
          TextSpan(
            text: 'تسجيل الدخول',
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style:
                TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
