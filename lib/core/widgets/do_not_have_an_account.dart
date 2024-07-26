import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  final Function()? onTap;

  const DoNotHaveAnAccount({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'ليس لديك حساب؟ ',
            style:
                TextStyles.semiBold16.copyWith(color: const Color(0xFF949D9E)),
          ),
          TextSpan(
            text: 'قم بإنشاء حساب',
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style:
                TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(
    //       'ليس لديك حساب؟ ',
    //       style: TextStyles.semiBold16.copyWith(color: const Color(0xFF949D9E)),
    //     ),
    //
    //     GestureDetector(
    //       onTap: onTap,
    //       child: Text(
    //         'قم بإنشاء حساب',
    //         style: TextStyles.semiBold16.copyWith(color:  AppColors.primaryColor),
    //       ),
    //     ),
    //
    //   ],
    // );
  }
}
