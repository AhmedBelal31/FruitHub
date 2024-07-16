import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'هل نسيت كلمة المرور؟',
          style: TextStyles.semiBold13
              .copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}